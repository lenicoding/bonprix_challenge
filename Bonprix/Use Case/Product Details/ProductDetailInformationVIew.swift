//
//  ProductDetailInformationVIew.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 18.12.23.
//

import SwiftUI

struct ProductDetailInformationView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(viewModel.product.priceString())
                .font(.title2)
                .padding(.top, 20)
            Text("inkl. MwSt., zzgl. Versandkosten")
                .font(.footnote)
            
            
            if let variants = viewModel.product.variants, variants.count > 0 {
                Text("Farbe")
                    .font(.headline)
                    .padding(.top, 10)
                HStack {
                    ForEach(0..<variants.count, id: \.self) { index in
                        if viewModel.selectedVariantIndex == index {
                            Button(variants[index].color) {
                                viewModel.selectedVariantIndex = index
                            }
                            .buttonStyle(.borderedTransparent)
                        } else {
                            Button(variants[index].color) {
                                viewModel.selectedVariantIndex = index
                            }
                            .buttonStyle(.borderedSolid)
                        }
                        
                    }
                }
                .padding([.leading, .trailing, .top], 5)
                
            }
            Text("Beschreibung")
                .font(.headline)
                .padding(.top, 10)
            Text(viewModel.product.description)
                .font(.body)
                .padding(.bottom, 30)
        }
        .frame(maxWidth:.infinity)
        .background(Color.gray.opacity(0.3))
        .clipShape(
            .rect(
                topLeadingRadius: 20,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 20
            )
        )
    }
    
}

struct BorderedTransparent: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .foregroundStyle(.tint)
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: .continuous
                )
                .stroke(.tint, lineWidth: 1)
            )
    }
}

struct BorderedSolid: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .foregroundStyle(Color.white)
            .backgroundStyle(Color.black)
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: .continuous
                )
            )
    }
}

extension ButtonStyle where Self == BorderedTransparent {
    static var borderedTransparent: Self {
        return .init()
    }
}

extension ButtonStyle where Self == BorderedSolid {
    static var borderedSolid: Self {
        return .init()
    }
}

#Preview {
    ProductDetailInformationView(viewModel: ProductDetailViewModel(product: Product.dummyProduct(), productsInteractor: ProductsInteractor.dummyInteractor()))
}
