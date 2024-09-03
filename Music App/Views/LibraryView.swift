//
//  LibraryView.swift
//  Music App
//
//  Created by Shailesh H on 03/04/24.
//

//
//  LibraryView.swift
//  Music App
//
//  Created by Shailesh H on 03/04/24.
//

import SwiftUI

struct LibraryView: View {
    struct NavigationItem: Identifiable, Hashable {
        var id = UUID()
        var title: String
        var icon: String
        var menu: Menu
    }
    
    var navigationItems = [
        NavigationItem(title: "Playlists", icon: "music.note.list", menu: .playlist),
        NavigationItem(title: "Artists", icon: "music.mic", menu: .artists),
        NavigationItem(title: "Albums", icon: "square.stack", menu: .albums),
        NavigationItem(title: "Songs", icon: "music.note", menu: .songs),
        NavigationItem(title: "Made for you", icon: "person.crop.square", menu: .mdy),
        NavigationItem(title: "Genres", icon: "guitars", menu: .genres),
        NavigationItem(title: "Compilations", icon: "person.2.crop.square.stack", menu: .compilation),
        NavigationItem(title: "Composers", icon: "music.quarternote.3", menu: .composers),
    ]
    
    enum Menu: String {
        case playlist
        case artists
        case albums
        case songs
        case mdy
        case genres
        case compilation
        case composers
    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
            
                LazyVStack(alignment: .leading, spacing: 9) {
                    
                    ForEach(navigationItems) { item in
                        HStack {
                            NavigationLink(destination: navigationDestination(for: item)) {
                                Label {
                                    Text(item.title)
                                        .font(.title2)
                                        .foregroundColor(Color("AccentColor"))
                                } icon: {
                                    Image(systemName: item.icon)
                                        .foregroundColor(Color(red: 1.0, green: 0.233, blue: 0.186))
                                        .font(.title2)
                                        .frame(minWidth: 30)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12))
                                    .bold()
                                    .foregroundColor(Color(red: 0.529, green: 0.529, blue: 0.551, opacity: 0.455))
                            }
                            
                        }
                        
                        Divider()
                            .padding(.leading,38)
                            .frame(width:400)
                    }
                    Text("Recently Added")
                        .font(.title2)
                        .bold()
                        .padding(.leading,2)
                        .padding(.top)
                        .padding(.bottom,5)
                    AlbumGridView()
                        .padding(.horizontal,-17)
                }
                .padding()
                
                
            }
            .navigationTitle("Library")
            
        }
    }
    
    @ViewBuilder
    private func navigationDestination(for item: NavigationItem) -> some View {
        switch item.menu {
        case .playlist:
            PlaylistView()
        case .artists:
            ArtistsView()
        case .albums:
            AlbumsView()
        case .songs:
            SongsView()
        case .mdy:
            MadeforyouView()
        case .genres:
            GenresView()
        case .compilation:
            CompilationView()
        case .composers:
            ComposersView()
        }
    }
}


#Preview {
    LibraryView()
}

