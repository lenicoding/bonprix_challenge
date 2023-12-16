//
//  BonprixApp.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import SwiftUI

@main
struct BonprixApp: App {
    var body: some Scene {
        let repository: ProductsRepository = ProductsRepository()
        let favoritesRepository = FavoriteProductsRepository()
        let interactor = ProductsInteractor(productsRepository: repository, favoritesRepository: favoritesRepository )
        let productOverviewViewModel = ProductOverviewViewModel(productsInteractor: interactor)
        
        let productOverviewView = ProductOverviewView(viewModel: productOverviewViewModel)
        
        WindowGroup {
            productOverviewView
        }
    }
}
