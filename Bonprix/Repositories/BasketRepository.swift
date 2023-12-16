//
//  BasketRepository.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation

struct BasketItem: Codable {
    let productId: Int
    var amount: Int
}

class BasketRepository {
    private var basketItems: [BasketItem] = []

    init() {
        loadBasketItems()
    }

    private func loadBasketItems() {
        if let savedBasketItemsData = UserDefaults.standard.data(forKey: "BasketItems") {
            do {
                let decoder = JSONDecoder()
                basketItems = try decoder.decode([BasketItem].self, from: savedBasketItemsData)
            } catch {
                print("Error loading basket items: \(error)")
            }
        }
    }

    private func saveBasketItems() {
        do {
            let encoder = JSONEncoder()
            let basketItemsData = try encoder.encode(basketItems)
            UserDefaults.standard.set(basketItemsData, forKey: "BasketItems")
        } catch {
            print("Error saving basket items: \(error)")
        }
    }

    func getAllBasketItems() -> [BasketItem]? {
        return basketItems.isEmpty ? nil : basketItems
    }

    func modifyBasketItem(productId: Int, amount: Int) {
        if amount == 0 {
            basketItems.removeAll { $0.productId == productId }
        } else {
            if let index = basketItems.firstIndex(where: { $0.productId == productId }) {
                basketItems[index].amount = amount
            } else {
                let newItem = BasketItem(productId: productId, amount: amount)
                basketItems.append(newItem)
            }
        }

        saveBasketItems()
    }
}
