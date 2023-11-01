//
//  RISDMuseumViewModel.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 16.10.23.
//

import Foundation
import RISDMuseumNetworking


final class RISDMuseumViewModel: ArtworkListViewModel {
    @Published var artworks: [ArtworkModel] = .init()
    @Published var isLoading: Bool = false
    @Published var canLoad: Bool = true
    var page: Int = 1
    let limit: Int = 10
    
    func fetch() {
        guard isLoading == false else { return }
        
        isLoading = true
        ArtworksAPI.everythingGet(page: page, itemsPerPage: limit, hasImages: 1) { result, error in
            self.isLoading = false
            guard error == nil else {
                print(error as Any)
                return
            }
  
            self.page += 1
            self.canLoad = true
            let modelsArray = result?.compactMap {
                ArtworkModel(
                    id:  Int($0.id!) ?? 0,
                    title: $0.title ?? "",
                    descrittion: $0.description ?? "",
                    imageURL: URL(string: ($0.images?.first?.replacingOccurrences(of: "scaled_900", with: "scaled_600"))!)!,
                    imageFullScreenURL:  URL(string: ($0.images?.first?.replacingOccurrences(of: "scaled_900", with: "full"))!)!,
                    materials: $0.medium?.joined(separator: ", ") ?? "",
                    author: $0.primaryMaker ?? "",
                    date: $0.dating ?? ""
                )
            }
            self.artworks.append(contentsOf: modelsArray!)
        }
    }
    
    func delete(artwork: ArtworkModel) {
        artworks.removeAll(where: {$0.id == artwork.id})
    }
}
