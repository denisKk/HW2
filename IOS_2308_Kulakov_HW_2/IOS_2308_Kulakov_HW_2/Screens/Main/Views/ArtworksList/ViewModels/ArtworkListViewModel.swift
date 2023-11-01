//
//  ArtworkListViewModel.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 1.11.23.
//

import Foundation

protocol ArtworkListViewModel: ObservableObject {
    var artworks: [ArtworkModel] {get set}
    var isLoading: Bool {get set}
    var canLoad: Bool {get set}
    
    func fetch()
    func delete(artwork: ArtworkModel)
}
