//
//  ContentView.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 12.10.23.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var orientation = UIDeviceOrientation.unknown
    @State var screenSize = UIScreen.screenSize
    @State var selectedTab: HeaderList.Headers = .cma
    
    var body: some View {
        VStack{
            if (orientation.rawValue == 0 && screenSize.width < screenSize.height) || orientation.rawValue == 1 {
                verticalView
            } else {
                horizontalView
            }
        }
        .background(.black)
        .onRotate {
            orientation = $0
        }
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
    
    @ViewBuilder
    var verticalView: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            
            VStack(spacing: 0) {
                HeaderList(selectedTab: $selectedTab)
                    .frame(width: width, height: height * 0.29)
                
                artworksList
            }
        }
    }
    
    @ViewBuilder
    var horizontalView: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            
            HStack(spacing: 0) {
                HeaderList(selectedTab: $selectedTab)
                    .frame(width: width * 0.38, height: height)
                
                artworksList
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
