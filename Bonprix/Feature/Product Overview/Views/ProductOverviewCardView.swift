//
//  ProductOverviewCardView.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 17.12.23.
//

import SwiftUI

struct ProductOverviewCardView: View {
    let product: Product
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(width: 180, height: 300)
            
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: product.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width:180, height: 200)
                        .clipped()
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.gray)
                            .frame(width: 180, height: 200)
                        ProgressView()
                    }
                }
                .padding(0)
                Spacer()
                Group {
                    Text(product.title)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .font(.system(size:16))
                        .lineLimit(2)
                        .padding([.leading, .trailing, .top], 8)
                    
                    Spacer()
                    
                    Text(product.priceString())
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                        .font(.system(size:16))
                        .padding([.leading, .trailing, .bottom], 8)
                }
            }
        }
        .frame(width:180, height: 300)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .shadow(radius: 5)
    }
}

#Preview {
    ZStack {
        Color(UIColor.lightGray).edgesIgnoringSafeArea(.all)
        ProductOverviewCardView(product: Product.dummyProduct())
    }
}
