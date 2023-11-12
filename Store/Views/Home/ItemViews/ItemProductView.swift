//
//  ItemProductView.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import SwiftUI

struct ItemProductView: View {
    
    var product: ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(product.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(product.images ?? [], id: \.self) { imageURL in
                        AsyncImage(url: imageURL) { image in
                            image.resizable()
                                .frame(maxWidth: 100, maxHeight: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            
            Text(product.description)
                .font(.subheadline)
        }
        
    }
}

struct ItemProductView_Previews: PreviewProvider {
    static var previews: some View {
        var product = ProductModel(id: 1, title: "Handmade Fresh Table" , price: 687, description: "Andy shoes are designed to keeping in...", images: [URL(string: "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1544&q=80")!], category: CategoryModel(id: 1,name: "Clothes",
                                                                                                                                                                                                                                                                                                                                                        image: URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=3741")!)
        )
        ItemProductView(product: product)
    }
}
