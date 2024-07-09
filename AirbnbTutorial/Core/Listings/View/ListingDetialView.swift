//
//  ListingDetialView.swift
//  AirbnbTutorial
//
//  Created by Abdulrahman Ibrahim on 07.07.24.
//

import SwiftUI
import MapKit

struct ListingDetialView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: listing.city == "Los Angeles" ? .losAngeles : .miami,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    //53.6147923" N, 10.0079564" E
    //latitude: 53.57416000, longitude:
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouseView(listing: listing)
                    .frame(height: 320)
                
                Button{
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white.opacity(0.7))
                                .frame(width: 32, height: 32)
                        }
                        .padding(EdgeInsets(top: 58, leading: 32, bottom: 0, trailing: 0))
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(listing.title)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                        
                        Text(" - ")
                        
                        Text("28 rewiews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
                
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //host info
            
            HStack{
                VStack(alignment: .leading){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            // listing features
            
            VStack (alignment: .leading, spacing: 16){
                ForEach(listing.features) { feature in
                    HStack(spacing: 12){
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text (feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text (feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding()

            Divider()
            
            //bedrooms View
            VStack(alignment: .leading, spacing: 16) {
                Text ("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack(spacing: 8){
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                                    .font(.subheadline)
                            }
                            .frame(width: 152, height: 100)
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            // listing amenities
            VStack (alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenty in
                    HStack {
                        Image(systemName: amenty.imageName)
                            .frame(width: 32)
                        
                        Text(amenty.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Jul 07 - 10")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetialView(listing: DeveloperPreview.shared.listings[0])
}
