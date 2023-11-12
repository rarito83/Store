//
//  StoreController.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import Foundation
//import Combine

@MainActor
class StoreController: ObservableObject {
    
    let client = HTTPClient()
//    private var cancellables: Set<AnyCancellable> = []
//    private let productUseCase: ProductUseCase
    @Published var categories: [CategoryModel] = []
    @Published var products: [ProductModel] = []
//    @Published var product: ProductModel
    
//    init(productUseCase: ProductUseCase) {
//      self.productUseCase = productUseCase
//      product = productUseCase.getProduct()
//    }
    
    func fetchCategories() async throws {
        categories = try await client.load(Resource(url: URL.allCategories))
    }
    
    func fetchProductsByCategory(_ categoryId: Int) async throws {
        products = try await client.load(Resource(url: URL.productsByCategory(categoryId)))
    }
    
//    func saveProductToFavorite() {
//        product.updateFavoriteProduct()
//          .receive(on: RunLoop.main)
//          .sink(receiveCompletion: { completion in
//              switch completion {
//              case .failure:
//                self.errorMessage = String(describing: completion)
//              case .finished:
//                self.isLoading = false
//              }
//            }, receiveValue: { product in
//              self.product = product
//              print("status favorite product: \(product.favorite)")
//            })
//            .store(in: &cancellables)
//    }
    
}
