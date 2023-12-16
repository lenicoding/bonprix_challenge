//
//  ProductsInteractor.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation
import Combine

class ProductsInteractor {
    let productsRepository: ProductsRepository
    let favoritesRepository: FavoriteProductsRepository

    init(productsRepository: ProductsRepository, favoritesRepository: FavoriteProductsRepository) {
        self.productsRepository = productsRepository
        self.favoritesRepository = favoritesRepository
    }

    func getAllProducts() -> [Product] {
        return productsRepository.getAllProducts()
    }
    
    
    func isProductFavorite(productId: Int) -> Bool {
        return favoritesRepository.isProductFavorite(productId: productId)
    }
    
    func toggleFavoriteProduct(productId: Int) {
        if isProductFavorite(productId: productId) {
            favoritesRepository.removeProductFromFavorites(productId: productId)
        } else {
            favoritesRepository.addProductToFavorites(productId: productId)
        }
    }
    
    static func dummyInteractor() -> ProductsInteractor {
        return ProductsInteractor(productsRepository: ProductsRepository(), favoritesRepository: FavoriteProductsRepository())
    }
}
