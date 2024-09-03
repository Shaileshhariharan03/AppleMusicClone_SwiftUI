//
//  ContentView.swift
//  Music App
//
//  Created by Shailesh H on 03/04/24.
//

import SwiftUI
import TabBar

struct ContentView: View {
    
    @State private var expandSheet: Bool = false
    @Namespace private var animation
    
    enum Item: Int, Tabbable {
        case first = 0
        case second
        case third
        case fourth
        case fifth
        
        var icon: String {
            switch self {
            case .first: "music.note.house.fill"
            case .second: "square.grid.2x2.fill"
            case .third: "dot.radiowaves.left.and.right"
            case .fourth: "play.square.stack.fill"
            case .fifth: "magnifyingglass"
                
            }
        }
        
        var title: String {
            switch self {
            case .first:  "Home"// Title of first item.
            case .second: "Browse"// Title of second item.
            case .third:  "Radio"// Title of third item.
            case .fourth: "Library"
            case .fifth: "Search"
            }
        }
    }
    
    
    var body: some View {
        TabBar(selection: $selection, visibility: $visibility) {
            HomeView()
                .tabItem(for: Item.first)
            
            BrowseView()
                .tabItem(for: Item.second)
            
            RadioView()
                .tabItem(for: Item.third)
            
            LibraryView()
                .tabItem(for: Item.fourth)
            
            SearchView()
                .tabItem(for: Item.fifth)
        }
        .tabBar(style: DefaultTabBarStyle())
        .tabItem(style: DefaultTabItemStyle())
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .safeAreaInset(edge: .bottom){
            CustomBottomSheet()
        }
        .overlay{
            if expandSheet{
                ExpandedBottomSheet(expandSheet: $expandSheet, animation: animation)
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: -5)))
            }
        }
        
    }
    @ViewBuilder
    func CustomBottomSheet() -> some View{
        ZStack{
            if expandSheet{
                Rectangle()
                    .fill(.clear)
            }
            else{
                Rectangle()
                    .fill(.ultraThickMaterial)
                    .cornerRadius(13)
                    .padding(.horizontal,11)
                    .overlay{
                        MusicInfoView(expandSheet: $expandSheet, animation: animation)
                    }
                    .matchedGeometryEffect(id: Color(.black), in: animation)
            }
            
        }
        .frame(height: 55)
        .offset(y: -57)
        .shadow(radius: 20)
    }
    
    
}

#Preview {
    ContentView()
}
