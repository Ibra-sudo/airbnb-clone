//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Abdulrahman Ibrahim on 07.07.24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4",
    ]
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            ListingImageCarouseView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
//            TabView {
//                ForEach(images, id: \.self) { image in
//                    Image(image)
//                        .resizable()
//                        .scaledToFill()
//                }
//            }
//                .frame(height: 320)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .tabViewStyle(.page)
            
            //listing detail
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    
                }
                .foregroundStyle(.black)
                
                Spacer()
                
                // rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
            .padding(2)
        }
    }
}

#Preview {
    ListingItemView()
}
