//
//  FavoriteProductsRepository.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation

class FavoriteProductsRepository {
    private let favoritesKey = "favoriteProductIds"

    // Get the IDs of favorited products
    private var favoriteProductIds: Set<Int> {
        get {
            if let data = UserDefaults.standard.object(forKey: favoritesKey) as? [Int] {
               let favoriteProductIds = Set(data)
                return favoriteProductIds
            }
            return Set<Int>()
        }
        set {
            let data = Array(newValue)
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }

    // Check if a product is favorited
    func isProductFavorite(productId: Int) -> Bool {
        return favoriteProductIds.contains(productId)
    }

    // Add a product to favorites
    func addProductToFavorites(productId: Int) {
        favoriteProductIds.insert(productId)
    }

    // Remove a product from favorites
    func removeProductFromFavorites(productId: Int) {
        favoriteProductIds.remove(productId)
    }
}
