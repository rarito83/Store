//
//  CategoryModel.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import Foundation

struct CategoryModel: Codable, Hashable {
    let id: Int
    let name: String
    let image: URL
}
