//
//  HeaderCell.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 1.11.23.
//

import SwiftUI

struct HeaderCell: View {
    
    let title: String
    let logo: Image
    
    var body: some View {
        HStack {
            logo
                .resizable()
                .scaledToFit()
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 48, weight: .light))
                .minimumScaleFactor(0.5)
                .padding()
        }
    }
}
