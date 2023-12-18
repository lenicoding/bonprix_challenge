//
//  ProductDetailView.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var showingSheet: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    AsyncImage(url: viewModel.imageUrl) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width:.infinity, height: .infinity)
                                .clipped()
                        } else if phase.error != nil {
                            Color.red // Indicates an error.
                        } else {
                            ProgressView()
                        }
                    }
                    
                    ProductDetailInformationView(viewModel: viewModel)
                }
            }
            Group{
                if viewModel.availableProduct {
                    Button(action: {
                        viewModel.addToBasket()
                        showingSheet.toggle()
                    }, label: {
                        Text("In die Einkaufstasche")
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .frame(maxWidth:.infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                            .padding()
                    })
                    .sheet(isPresented: $showingSheet) {
                        Text("In den Einkaufswagen hinzugefügt!")
                            .presentationDetents([.fraction(0.25)])
                    }
                } else {
                    Button(action: {
                    }, label: {
                        Text("Nicht verfügbar")
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .frame(maxWidth:.infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .padding()
                    })
                }
            }.frame(maxHeight: 60, alignment: .bottom)
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButton
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.toggleFavoriteStatus()
                    
                }) {
                    Image(systemName: viewModel.favoriteProduct ? "heart.fill" : "heart")
                        .foregroundColor(.black)
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    var backButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.left") // BackButton Image
                .foregroundColor(.black)
        }
    }
    }
    
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: Product.dummyProduct(), productsInteractor: ProductsInteractor.dummyInteractor()))
}
