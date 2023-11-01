//
//  ContentView.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 12.10.23.
//

import SwiftUI

struct MainScreen: View {

    @State var selectedTab: HeaderList.Headers = .cma
    
    var body: some View {
        GeometryReader {proxy in
            if proxy.size.width < proxy.size.height {
                verticalView(size: proxy.size)
            } else {
                horizontalView(size: proxy.size)
            }
        }
        .background(.black)
        .ignoresSafeArea(edges: .vertical)
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    var artworksList: some View {
        switch selectedTab {
        case .aic:
            ArtworksList(artworkListVM: ArtInstituteChicagoViewModel())
        case .cma:
            ArtworksList(artworkListVM: ClevelandMuseumViewModel())
        case .risd:
            ArtworksList(artworkListVM: RISDMuseumViewModel())
        }
    }
    
   
    func verticalView(size: CGSize) -> some View {
            VStack(spacing: 0) {
                HeaderList(selectedTab: $selectedTab)
                    .frame(width: size.width, height: size.height * 0.29)
                
                artworksList
            }
    }
    
    func horizontalView(size: CGSize) -> some View {
            HStack(spacing: 0) {
                HeaderList(selectedTab: $selectedTab)
                    .frame(width: size.width * 0.38, height: size.height)
                artworksList
            }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
