//
//  CustomTabItem.swift
//  Music App
//
//  Created by Shailesh H on 05/04/24.
//

import SwiftUI
import TabBar

/**
 Default implementation of the `TabItemStyle` protocol.
 
 This style replicates the default `iOS` style of the
 items of `UITabBar` and used in `TabBar` by default.
 */
public struct DefaultTabItemStyle: TabItemStyle {
    public func tabItem(icon: String, selectedIcon: String, title: String, isSelected: Bool) -> some View {
        VStack(spacing: 5.0) {
            Image(systemName: icon)
                .renderingMode(.template)
                .font(.system(size: 23))
            
            Text(title)
                .font(.caption2)
        }
        .foregroundColor(isSelected ? .red : .gray)
    }

}


