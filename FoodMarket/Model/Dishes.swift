//
//  Dishes.swift
//  FoodMarket
//
//  Created by Vlad Dzirko on 06.07.2023.
//

import Foundation

// MARK: - Dishes
struct Dishes: Codable {
    let dishes: [Dish]
}

// MARK: - Dish
struct Dish: Codable {
    let id: Int?
    let name: String?
    let price, weight: Int?
    let description: String?
    let imageURL: String?
    let tegs: [String]?

    var urlToImage: URL? {
        guard let imageURL = imageURL else {
            return nil
        }
        return URL(string: imageURL)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description
        case imageURL = "image_url"
        case tegs
    }
}


extension Dishes {
    static let sampleDishes = Dish(
        id: 1,
        name: "Пельмени",
        price: 499,
        weight: 630,
        description: "Что может быть лучше чем самые обычные пельмени, приготовленные с душой. Мягкое тесто и сочная говядина внтури делают вкус невероятным",
        imageURL: "https://lh3.googleusercontent.com/fife/APg5EObzr6k1HmsChN_hYDWn4dMke5KVpbWm2Ff2AnzB0ZEYCSuA5vkRehfvlW9KbwjCq1J5V6tzhzYa7MZTWED-4YTHHt3NBwARot_KdU5iBnh73HB3xgUgR4bmy6Ah0RbjR-50OPjoSMUqtLowMI8TwJ7rXxcSGeYemhr1SCFqKl2YbUmu3JY4Riz5mxO6WIcr35iXowqayz2gKFOsFW3KhUPMbR1QSq4mjUxwDrPZ82OVMLt4GMJJCNTV6HX1VHOGYvViaqikU1IN4kXgCZ5XUfVTXKAJclGjAiWQ6pf8C5Xw5NbAl76lWVHsOQqVbIqxig8uqnW-6K4rAx02AvF_t7ALDwLN8KXrmh58pJ5OPyrIReLa-RKDUe_fS72qSSO2zl8dVicY2ANVz7f5bpPNUMR8G0gXid1FbEW_9h9yA41MdemTw-rdjUPCA7J3n-rDZuELHTv3dNJ1QblSE_ee01AWa0ljbwTdDQOhdtQY2saHRPj2eLuRdGrgBtPSt64fuGTCygglSnrcJxWU6M8weuUp6FETrs-qWUYvXPVWZDma3db9TC3eAEugZdBQkdaD8yUqrF_l6cqxzVf4KqWmcF41vr5-8mrvQypbtVmoBMR15BZok1hksXJpMc4v4edimtqrg7svx5ytKUyjTiLxk9QFU8pHwiJpwji-A3TNjm7bOX09rvIcL9PhwF13KvV8l73fNIRAe00ByVI_UfBYROwITVGdteZPXASdo5tsSMcBwYt6yHD-ybOwNgkc2m-HG0aJThGoYxXoNHEHCULlwmBlEm4iI9TSUvnR8nEhzO1XBztQ_VkizZ1CUKi8DJ30jfFM1WIUQMIPJc4xP-HNBqrirmPB0AbpzeEI4oARePECl0drE4gj-uqxHzDluoS8Ns689Cc-6tET-NY6Lin_qSAxTzd9piBSp-_mvbgUkbIMfYZqMtt8DRtoviYYTzSL7_Iy3H2Aue2E72paNhyLGf4HIM8ydiQ5A-7vrSMJTnMIR4yiuT20UdWqzoh1rpO3RdmCtUlOrCgBUb4WU-52_1yZcs-wIso6fas70F08SE6-iYuvSyBiKh1Qeju5ujJ_OIOd4c2mYK4aUT5QCq842Rw86h092DBvXsBkks4No5XG6gE2TppSm6E8YeJE6le7Zp4AXvcXBCYfF4PzgDfI4kL8-LvaXy9klrqdpDi-Wht4pzCs924BsQTMQ94p-Bify7Jyyoi9EtiRJweHPwubcrRCAVgGObFgAZfmOZK9g3JgrhXPzq7DcPl37Wvz4W7gPoiejJA_25PMQZA5v0pM1UxG7QDesTdQ6TTUfBRxrL-dx1HDLwscxE-tp6zdFEYVHYIH77c3abfO4yXQBpmw-smquHczSYhKrYyGUhbO4b_zn6irBATn3TfEglYovwsRXjGAXtvyUMTFtadmNfedYWSB6AHbZop3NdwfTq5x2ri3967iGvHCspP61GNRHCkIRAmf-lm2pu1TuEIipxbR-cKjPLoXOsjTJYu9SRTdXwW-fJhJyHTiq6YxJ043mKstI4VdV76hBewXU2Bvcn6C9pH2PH-p_3LXKbXF5HHaoyChpGgWGtcKXt704Nd8tBxVbcqjNob7Jou3EPQALP3bif2fGHSTQS9oCahivvwC7uRb0nvtfOjw=w1366-h617",
        tegs: ["Все меню", "What", "and"]
    )
}
