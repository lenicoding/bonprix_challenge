//
//  ProductOverviewView.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import SwiftUI

struct ProductOverviewView: View {
    @ObservedObject var viewModel: ProductOverviewViewModel

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: product, productsInteractor: viewModel.productsInteractor))) {
                    Text(product.title)
                        .foregroundColor(viewModel.isProductFavorite(productId: product.id) ? .blue : .black)
                }
            }
            .navigationBarTitle("Product Overview")
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}


#Preview {
    ProductOverviewView(viewModel: ProductOverviewViewModel(productsInteractor: ProductsInteractor.dummyInteractor()))
}
