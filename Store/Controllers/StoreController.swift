//
//  StoreController.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import Foundation

@MainActor
class StoreController: ObservableObject {
    
    let client = HTTPClient()
    @Published var categories: [CategoryModel] = []
    @Published var products: [ProductModel] = []
    
    func fetchCategories() async throws {
        categories = try await client.load(Resource(url: URL.allCategories))
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        products = try await client.load(Resource(url: URL.productsByCategory(categoryId)))
    }
    
}
