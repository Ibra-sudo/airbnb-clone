//
//  ExploreService.swift
//  AirbnbTutorial
//
//  Created by Abdulrahman Ibrahim on 08.07.24.
//

import Foundation

class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
