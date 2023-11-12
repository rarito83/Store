//
//  URL+Ext.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import Foundation

extension URL {

    static var production: URL {
        URL(string: "https://api.escuelajs.co")!
    }
    
    static var `default`: URL {
        return production
    }
    
    static var saveProduct: URL {
        return URL(string: "/api/v1/products/", relativeTo: Self.default)!
    }
    
    static var allCategories: URL {
        URL(string: "/api/v1/categories", relativeTo: Self.default)!
    }
    
    static func productsByCategory(_ categoryId: Int) -> URL {
        return URL(string: "/api/v1/categories/\(categoryId)/products", relativeTo: Self.default)!
    }
    
}
