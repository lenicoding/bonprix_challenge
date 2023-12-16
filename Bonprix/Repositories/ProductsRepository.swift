//
//  ProductRepository.swift
//  Bonprix
//
//  Created by Magdalena Reißner on 16.12.23.
//

import Foundation

class ProductsRepository {
    private var products: [Product] = []
    
    init() {
        loadProducts(from: "products")
    }
    
    private func loadProducts(from jsonFileName: String) {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                products = try decoder.decode([Product].self, from: data)
            } catch {
                print("Error loading products: \(error)")
            }
        }
    }
    
    func getAllProducts() -> [Product] {
        return products
    }
    
    func getProduct(by id: Int) -> Product? {
        return products.first { $0.id == id }
    }
}
