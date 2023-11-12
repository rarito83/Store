//
//  ItemCategoryView.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import SwiftUI

struct ItemCategoryView: View {
    
    var category: CategoryModel
    
    var body: some View {
        VStack {
            imageCategory
            itemContent
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 250)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(20)
    }
}

extension ItemCategoryView {
    
    var imageCategory: some View {
        AsyncImage(url: category.image) { img in
            img.resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .circular))
        } placeholder: {
            ProgressView()
        }
    }
    
    var itemContent: some View {
        VStack(alignment: .leading) {
            Text(category.name)
                .font(.title)
                .bold()
        }.padding(
            EdgeInsets(
                top: 0,
                leading: 16,
                bottom: 8,
                trailing: 16
            )
        )
    }
    
}

struct ItemCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        let category = CategoryModel(
            id: 1,
            name: "Clothes",
            image: URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=3741")!
        )
        ItemCategoryView(category: category)
    }
}
