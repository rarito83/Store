//
//  DetailProductView.swift
//  Store
//
//  Created by Rahmat Susanto on 12/11/23.
//

import SwiftUI

struct DetailProductView: View {
    
    let product: ProductModel
    
    init(product: ProductModel) {
        self.product = product
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
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
            
            Spacer()
            
        }.padding()
            .navigationTitle(product.title)
    }
}

struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView(product: ProductModel(id: 8, title: "Generic Wooden Computer", price: 623, description: "New ABC 13 9370, 13.3, 5th Gen CoreA5-8250U, 8GB RAM, 256GB SSD, power UHD Graphics, OS 10 Home, OS Office A & J 2016", images: [URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=5490")!,URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=5490")!], category: CategoryModel(id: 1, name: "Clothes", image: URL(string: "https://api.lorem.space/image/fashion?w=640&h=480&r=3741")!)))
    }
}
