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
            ScrollView {
                LazyVGrid(columns: gridLayout(), spacing: 8) {
                    ForEach(viewModel.products, id: \.id) { product in
                        NavigationLink(destination: ProductDetailView(viewModel: ProductDetailViewModel(product: product, productsInteractor: viewModel.productsInteractor))) {
                            ProductOverviewCardView(product: product)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationBarTitle("Produktübersicht")
                
                .navigationBarTitleDisplayMode(.inline)
            }
            .background {
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
            }
            .onAppear {
                viewModel.fetchProducts()
            }
        }
        .accentColor(.black)
        
        
    }
    private func gridLayout() -> [GridItem] {
        let itemCount = viewModel.products.count
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: min(itemCount, 3))
        return columns
    }
}


#Preview {
    ProductOverviewView(viewModel: ProductOverviewViewModel(productsInteractor: ProductsInteractor.dummyInteractor()))
}
