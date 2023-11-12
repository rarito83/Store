//
//  ProductListView.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import SwiftUI

struct ProductListView: View {
    
    @EnvironmentObject private var controller: StoreController
    let category: CategoryModel
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            SearchBar(
                text: $searchText,
                onSearchButtonClicked: hideKeyboard,
                onSearchCancelButtonClicked: hideKeyboard,
                placeHolder: "Search category"
            ).padding(8)
            
            ScrollView {
                ForEach(
                    self.controller.products.filter {
                        self.searchText.isEmpty ? true : $0.title.contains(self.searchText)
                    },
                    id: \.id
                ) { product in
                    
                    ZStack {
                        NavigationLink(value: product) {
                            ItemProductView(product: product)
                        }
                    }
                    .padding(
                        EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)
                    )
                    .navigationDestination(for: ProductModel.self, destination: { product in
                        DetailProductView(product: product)
                    })
                }
            }
            
            .listStyle(.plain)
            .task {
                do {
                    try await controller.fetchProductsByCategory(category.id)
                } catch {
                    print(error)
                }
            }
            .navigationTitle(category.name)
        }
    }
}

extension ProductListView {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(category: CategoryModel(id: 1, name: "Clothes", image: URL(string: "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1072&q=80")!))
    }
}
