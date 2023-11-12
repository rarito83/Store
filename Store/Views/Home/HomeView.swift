//
//  HomeView.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var controller: StoreController
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(controller.categories, id: \.id) { category in
                        NavigationLink(value: category) {
                            ItemCategoryView(category: category)
                        }
                    }
                    .navigationDestination(for: CategoryModel.self, destination: { category in
                        ProductListView(category: category)
                    })
                }
                .task {
                    do {
                        try await controller.fetchCategories()
                    } catch {
                        errorMessage = error.localizedDescription
                    }
                }
                Text(errorMessage)
            }
            .navigationTitle("Keda Store")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(StoreController())
    }
}
