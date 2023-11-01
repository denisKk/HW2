//
//  ClevelandMuseumViewModel.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 16.10.23.
//

import Foundation
import ClevelandMuseumNetworking


final class ClevelandMuseumViewModel: ArtworkListViewModel {
    
    @Published var artworks: [ArtworkModel] = .init()
    @Published var isLoading: Bool = false
    @Published var canLoad: Bool = true
    var page: Int = 0
    let limit: Int = 15
 
    func fetch() {
        guard isLoading == false else { return }
        
        isLoading = true
        ArtworksAPI.everythingGet(skip: page*limit, limit: limit, hasImage: 1) { result, error in
            self.isLoading = false
            guard error == nil else {
                print(error as Any)
                return
            }

            self.page += 1
            self.canLoad = (result?.info?.total)! <= self.page + 15
            let modelsArray = result?.data?.compactMap {
                ArtworkModel(
                    id: $0.id ?? 0,
                    title: $0.title ?? "",
                    descrittion: $0.description?.htmlToString ?? "",
                    imageURL: URL(string: ($0.images?.web?.url)!)!,
                    imageFullScreenURL:   URL(string: ($0.images?.print?.url)!)!,
                    materials: $0.technique ?? "",
                    author: $0.creators?.first?.description ?? "",
                    date: $0.creationDate ?? ""
                )
            }
            self.artworks.append(contentsOf: modelsArray!)
        }
    }
    
    func delete(artwork: ArtworkModel) {
        artworks.removeAll(where: {$0.id == artwork.id})
    }
}
