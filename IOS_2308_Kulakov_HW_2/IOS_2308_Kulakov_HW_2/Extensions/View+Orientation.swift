//
//  View+DeviceOrientation.swift
//  IOS_2308_Kulakov_HW_2
//
//  Created by Dev on 12.10.23.
//
import SwiftUI

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
