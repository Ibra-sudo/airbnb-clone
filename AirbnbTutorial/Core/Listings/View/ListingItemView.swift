//
//  ListingItemView.swift
//  AirbnbTutorial
//
//  Created by Abdulrahman Ibrahim on 07.07.24.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            
            ListingImageCarouseView(listing: listing)
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
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                    
                }
                .foregroundStyle(.black)
                
                Spacer()
                
                // rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
            .padding(2)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
