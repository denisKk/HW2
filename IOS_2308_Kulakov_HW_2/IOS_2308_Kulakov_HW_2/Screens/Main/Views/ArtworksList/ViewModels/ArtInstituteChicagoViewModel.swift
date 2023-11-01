//
//  ArtInstituteChicagoViewModel.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 16.10.23.
//

import Foundation
import ArtInstituteChicagoNetworking


extension Artwork {
    
    enum ImageSize {
        case small, full
    }
    
    func getURLFromId(size: ImageSize) -> URL {
        let sizeSTR = size == .small ? ",300" : "full"
        return URL(string: "https://www.artic.edu/iiif/2/\(self.imageId ?? self.altImageIds?.first ?? "")/full/\(sizeSTR)/0/default.jpg")!
    }
}


final class ArtInstituteChicagoViewModel: ArtworkListViewModel {
    @Published var artworks: [ArtworkModel] = .init()
    @Published var isLoading: Bool = false
    @Published var canLoad: Bool = true
    var page: Int = 1
    
    func fetch() {
        guard isLoading == false else { return }
        
        isLoading = true
        ArtworksAPI.everythingGet(page: "\(page)", limit: "15") { result, error in
            self.isLoading = false
            guard error == nil else {
                print(error as Any)
                return
            }
            
            if let array = result?.data?.filter({ items in
                items.imageId != nil || items.altImageIds?.first != nil
                
            }) {
                self.page += 1
                self.canLoad = result?.pagination?.nextUrl != nil
                let modelsArray = array.map {
                    ArtworkModel(
                        id: $0.id ?? 0,
                        title: $0.title ?? "",
                        descrittion: $0.description?.htmlToString ?? "",
                        imageURL: $0.getURLFromId(size: .small),
                        imageFullScreenURL: $0.getURLFromId(size: .full),
                        materials: $0.mediumDisplay ?? "",
                        author: $0.artistDisplay ?? "" ,
                        date: $0.dateDisplay ?? ""
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
