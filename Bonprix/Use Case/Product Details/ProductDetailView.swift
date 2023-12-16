//
//  ProductDetailView.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.product.title)
                .font(.title)
            Text(viewModel.product.description)
                .padding()

            HStack {
                Text("Price: \(viewModel.product.price.value) \(viewModel.product.price.currency)")
                    .padding()

                Button(action: {
                    viewModel.toggleFavoriteStatus()
                }) {
                    Image(systemName: viewModel.favoriteProduct ? "heart.fill" : "heart")
                        .foregroundColor(viewModel.favoriteProduct ? .blue : .gray)
                }
                .padding()
            }

            // Display variant selection buttons if the product has variants
            if let variants = viewModel.product.variants, variants.count > 0 {
                HStack {
                    ForEach(0..<variants.count, id: \.self) { index in
                        Button(action: {
                            viewModel.selectedVariantIndex = index
                        }) {
                            Text(variants[index].color)
                                .padding()
                        }
                        .background(viewModel.selectedVariantIndex == index ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                }
                .padding()
            }

            // Display selected variant image
            AsyncImage(url: viewModel.imageUrl) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Color.blue // Acts as a placeholder.
                }
            }

            // Add to Basket button
            Button(action: {
                // Assuming you have a method in the view model to add the selected variant to the basket
                viewModel.addToBasket()
            }) {
                Text("Add to Basket")
                    .padding()
            }
        }
        .navigationBarTitle("Product Detail")
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: Product.dummyProduct(), productsInteractor: ProductsInteractor.dummyInteractor()))
}
