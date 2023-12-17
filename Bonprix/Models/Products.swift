//
//  Products.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Price
    var imageURL: String
    let description: String
    let isAvailable: Bool
    let variants: [Variant]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, price
        case imageURL = "imageUrl"
        case description, isAvailable, variants
    }
    
    func priceString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = price.currency
        numberFormatter.currencyDecimalSeparator = ","
        return numberFormatter.string(for: price.value) ?? ""
    }
    
    static func dummyProduct() -> Product {
        return Product(id: 123, title: "Dummy product mit langem namen", price: Price(value: 12.34, currency: "€"), imageURL: "https://placehold.co/275x385", description: "Dummy product", isAvailable: true, variants: nil)
    }
}

// MARK: - Price
struct Price: Codable {
    let value: Double
    let currency: String
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int
    let color: String
    let imageURL: String
    let isAvailable: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, color
        case imageURL = "imageUrl"
        case isAvailable
    }
}

typealias Products = [Product]
