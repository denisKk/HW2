//
//  ArtworskList.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 12.10.23.
//

import SwiftUI
import UI


struct ArtworksList<DataViewModel: ArtworkListViewModel>: View {
    
    @StateObject var artworkListVM: DataViewModel
    
    var body: some View {
        
        scrollView
            .onAppear{
                artworkListVM.fetch()
            }
            .ignoresSafeArea()
    }
    
    @ViewBuilder
    var scrollView: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(artworkListVM.artworks) { artwork in
                    
                    ArtworkListCell(artwork: artwork){
                        withAnimation {
                            artworkListVM.delete(artwork: artwork)
                        }
                        
                    }
                    .navigationPushLink(destination: ArtworkScreen(artwork: artwork))
                    .onAppear{
                        if artworkListVM.artworks.isLastElement(artwork) {
                            artworkListVM.fetch()
                        }
                    }
                    .transition(.moveToBottom)
                }
                if artworkListVM.isLoading {
                    ProgressView()
                }
            }
        }
        
    }
}

struct ArtworskList_Previews: PreviewProvider {
    static var previews: some View {
        ArtworksList(artworkListVM: ArtInstituteChicagoViewModel())
    }
}
