//
//  ExploreViewModel.swift
//  AirbnbTutorial
//
//  Created by Abdulrahman Ibrahim on 08.07.24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listing = [Listing]()
    
    init() {
        
    }
    
    func fetchListings() async {
        
    }
}
