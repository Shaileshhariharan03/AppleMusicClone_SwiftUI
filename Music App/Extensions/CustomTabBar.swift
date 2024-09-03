//
//  CustomTabBar.swift
//  Music App
//
//  Created by Shailesh H on 05/04/24.
//

import SwiftUI
import TabBar

/**
 Default implementation of the `TabBarStyle` protocol.
 
 This style replicates the default `iOS` style of the
 bar of `UITabBar` and used in `TabBar` by default.
 */
public struct DefaultTabBarStyle: TabBarStyle {
    
    public func tabBar(with geometry: GeometryProxy, itemsContainer: @escaping () -> AnyView) -> some View {
        VStack(spacing: 0.0) {
            Divider()
            
            VStack {
                itemsContainer()
                    .frame(height: 90)
                    .padding(.bottom, geometry.safeAreaInsets.bottom)
            }
            .background(
                Color(.acc)
            )

            .frame(height: 50.0 + geometry.safeAreaInsets.bottom)
        }
        .padding(.bottom,30)
    }
    
}
