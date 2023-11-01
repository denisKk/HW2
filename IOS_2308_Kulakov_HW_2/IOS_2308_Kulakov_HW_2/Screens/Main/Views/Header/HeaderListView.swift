//
//  HeaderList.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 12.10.23.
//

import SwiftUI




struct HeaderList: View {
    
    @Binding var selectedTab: Headers
    
    var body: some View {
        ZStack {
            Color.black
            
            TabView(selection: $selectedTab) {
                ForEach(Headers.allCases, id: \.self.rawValue) { item in
                    HeaderCell(title: item.description, logo: item.getLogo)
                        .tag(item)
                        .padding(.bottom, 34)
                }
            }
            .tabViewStyle(.page)
        }
    }
}

struct HeaderList_Previews: PreviewProvider {
    static var previews: some View {
        HeaderList(selectedTab: .constant(.aic))
    }
}

extension HeaderList {
    enum Headers: Int, CaseIterable {
        case cma
        case aic
        case risd
        
        var description: String {
            switch self {
            case .aic:
                return "The Art Institute of Chicago"
            case .cma:
                return "Cleveland Museum of Art"
            case .risd:
                return "Rhode Island School of Design Museum"
            }
        }
        
        var getLogo: Image {
            switch self {
            case .aic:
                return Image("aic")
            case .cma:
                return Image("cma")
            case .risd:
                return Image("risd")
            }
        }
    }
}
