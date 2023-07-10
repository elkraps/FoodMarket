//
//  AsyncImage.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 07.07.2023.
//

import UIKit
import Combine


class ImageLoaderCache {
    static let shared = ImageLoaderCache()
    var loaders: NSCache<NSString, ImageLoader> = NSCache()
    
    func loaderFor(category: Сategories) -> ImageLoader {
        let key = NSString(string: "\(category.name ?? "")")
        if let loader = loaders.object(forKey: key) {
            return loader
        } else {
            let url = (category.imageURL != nil && category.imageURL != "null")
                ? URL(string: category.imageURL!)
                : nil
            let loader = ImageLoader (url: url)
            loaders.setObject(loader, forKey: key)
            return loader
        }
    }
}

final class ImageLoader: ObservableObject {
    // input
    @Published var url: URL?
    // output
    @Published var image: UIImage?
    @Published var noData = false

    
    init(url: URL?) {
        self.url = url
        $url
        .setFailureType(to: Error.self)
        .flatMap { (url) -> AnyPublisher<UIImage?, Error> in
                self.fetchImageErr(for: url).eraseToAnyPublisher()
        }
        .sink(receiveCompletion:  {[unowned self] (completion) in
            if case .failure(_) = completion {
                self.noData = true
            }},
              receiveValue: { [unowned self] in
                self.image = $0
        })
        .store(in: &self.cancellableSet)
    }

    func fetchImageErr(for  url: URL?) -> AnyPublisher<UIImage?, Error>{
        Future<UIImage?, Error> { [unowned self] promise in
    
            guard let url = url, !self.noData  else {
                return promise(
                    .failure(URLError(.unsupportedURL)))
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                        200...299 ~= httpResponse.statusCode else {
                            throw URLError(.unsupportedURL)
                    }
                    return data
            }
                .map { UIImage(data: $0) }
                .receive(on: RunLoop.main)
                .sink(
                    receiveCompletion: { (completion) in
                        if case let .failure(error) = completion {
                            promise(.failure(error))
                        }
                },
                    receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellableSet)
        }
            .eraseToAnyPublisher()
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
  }
