//
//  HarvardArtMuseumsViewModel.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 8.11.23.
//

import Foundation
import HarvardArtMuseumsNetworking

extension Artwork {
    
    enum ImageSize {
        case small, full
    }
    
    func getURLFromId(size: ImageSize) -> URL {
        let sizeSTR = size == .small ? ",300" : "full"
        
        guard let id = self.images?.first?.idsid else {
            return URL(string: self.primaryimageurl ?? "")!
        }
        
        return URL(string: "https://ids.lib.harvard.edu/ids/iiif/\(id)/full/\(sizeSTR)/0/default.jpg")!
    }
}


final class HarvardArtMuseumsViewModel: ArtworkListViewModel {
    @Published var artworks: [ArtworkModel] = .init()
    @Published var isLoading: Bool = false
    @Published var canLoad: Bool = true
    var page: Int = 1
    
    func fetch() {
        guard isLoading == false else { return }
        
        isLoading = true
        ArtworksAPI.everythingGet(apikey: "e49f1eac-bb98-456f-ac51-f7c9a8cdc116", hasimage: 1, page: page, size: 20) { result, error in
            self.isLoading = false
            guard error == nil else {
                print(error as Any)
                return
            }
            
            if let array = result?.records?.filter({ items in
                items.primaryimageurl != nil || items.images?.first != nil
                
            }) {
                self.page += 1
                self.canLoad = result?.info?.next != nil
                let modelsArray = array.map {
                    ArtworkModel(
                        id: $0.id ?? 0,
                        title: $0.title ?? "",
                        descrittion: $0.description?.htmlToString ?? "",
                        imageURL: $0.getURLFromId(size: .small),
                        imageFullScreenURL:   $0.getURLFromId(size: .full),
                        materials: $0.technique ?? "",
                        author: $0.people?.first?.displayname ?? "",
                        date: $0.dated ?? ""
                    )
                }
                self.artworks.append(contentsOf: modelsArray)
            }
        }
    }
    
    func delete(artwork: ArtworkModel) {
        artworks.removeAll(where: {$0.id == artwork.id})
    }
}
