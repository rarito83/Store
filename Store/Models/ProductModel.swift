//
//  ProductModel.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import Foundation

struct ProductModel: Codable, Hashable, Identifiable {
    var id: Int?
    let title: String
    let price: Double
    let description: String
    let images: [URL]?
    let category: CategoryModel
//    var isFavorite: Bool = false
}
