//
//  ProductOverviewViewModel.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation
import Combine

class ProductOverviewViewModel: ObservableObject {
    let productsInteractor: ProductsInteractor
    
    @Published var products: [Product] = []

    init(productsInteractor: ProductsInteractor) {
        self.productsInteractor = productsInteractor
    }

    func fetchProducts() {
        let allProducts = productsInteractor.getAllProducts()
        let sortedProducts = allProducts.sorted { (product1, product2) in
            let isFavorite1 = productsInteractor.isProductFavorite(productId: product1.id)
            let isFavorite2 = productsInteractor.isProductFavorite(productId: product2.id)

            if isFavorite1 == isFavorite2 {
                return product1.title < product2.title
            } else {
                return isFavorite1 && !isFavorite2
            }
        }
        products = sortedProducts
    }

    func isProductFavorite(productId: Int) -> Bool {
        return productsInteractor.isProductFavorite(productId: productId)
    }
}

