//
//  RandomAccessCollection+Last.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 1.11.23.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable  {
    func isLastElement<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else {return false}
        
        guard let itemIndex = firstIndex(where: {
            AnyHashable($0.id) == AnyHashable(item.id)
        }) else {return false}
        
        let distance = distance(from: itemIndex, to: endIndex)
        return distance == 4
    }
}
