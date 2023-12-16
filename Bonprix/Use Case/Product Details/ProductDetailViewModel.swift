//
//  ProductDetailViewModel.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    private let productsInteractor: ProductsInteractor

    @Published var product: Product
    @Published var selectedVariantIndex: Int = 0 {
        didSet {
            updateProductImage()
        }
    }
    @Published var favoriteProduct: Bool = false
    @Published var imageUrl: URL?

    init(product: Product, productsInteractor: ProductsInteractor) {
        self.product = product
        self.productsInteractor = productsInteractor
        self.favoriteProduct = productsInteractor.isProductFavorite(productId: product.id)
        self.imageUrl = URL(string: product.imageURL)

        if let variants = product.variants, let variantIndex = variants.firstIndex(where: { $0.id == product.id }) {
            selectedVariantIndex = variantIndex
        }
    }

    func isProductFavorite() -> Bool {
        return productsInteractor.isProductFavorite(productId: product.id)
    }
    
    func toggleFavoriteStatus() {
        favoriteProduct = !favoriteProduct
        productsInteractor.toggleFavoriteProduct(productId: product.id)
    }

    func addToBasket() {
        let basketRepo = BasketRepository()
        if let variants = product.variants {
            basketRepo.modifyBasketItem(productId: variants[selectedVariantIndex].id, amount: 1)
        } else {
            basketRepo.modifyBasketItem(productId: product.id, amount: 1)
        }
    }

    private func updateProductImage() {
        if let variants = product.variants {
            self.imageUrl = URL(string: variants[selectedVariantIndex].imageURL)
        }
    }
}

