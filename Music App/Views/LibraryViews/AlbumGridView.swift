//
//  AlbumGridView.swift
//  Music App
//
//  Created by Shailesh H on 04/04/24.
//

import SwiftUI

struct AlbumGridView: View {
    struct AlbumItem: Identifiable, Hashable {
        var id = UUID()
        var albumimage: String
        var albumname: String
        var artist: String
    }
    
    var albumItems = [
        AlbumItem(albumimage: "the-love-album-off-the-grid", albumname: "The Love Album: Off The Grid", artist: "Diddy"),
        AlbumItem(albumimage: "Love-Sick", albumname: "Love Sick", artist: "Don Toliver"),
        AlbumItem(albumimage: "ab67616d0000b2736f04e53cb5309f8e88286842", albumname: "airplane thoughts - Single", artist: "Dhruv"),
        AlbumItem(albumimage: "1200x1200bf-60", albumname: "Tragedy - Single", artist: "Dhruv"),
        AlbumItem(albumimage: "artworks-000472246587-dnl9cv-t500x500", albumname: "MIA (feat. Drake) - Single", artist: "Bad Bunny"),
        AlbumItem(albumimage: "500x500", albumname: "The Idol - Single", artist: "The Weeknd, JENNIE & Lily Rose Depp"),
    ]
    
    private let items = [GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 2.4
    var body: some View {
        LazyVGrid(columns: items, alignment:.center, spacing:20, content: {
            ForEach(albumItems){ item in
                NavigationLink(destination: AlbumsView(), label: {
                    VStack(alignment: .leading) {
                        Image(item.albumimage)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(width: width,height: width)
                        Text(item.albumname)
                            .foregroundColor(Color("AccentColor"))
                            .lineLimit(1)
                            .padding(.top,2)
                            .padding(.trailing)
                            .font(.subheadline)
                            .padding(.vertical,-3)
                        Text(item.artist)
                            .foregroundStyle(.gray)
                            .padding(.vertical,-3)
                            .font(.subheadline)
                            .lineLimit(1)
                            .padding(.trailing)
                    }
                    
                })
                
            }
        })
        .padding(.horizontal)
    }
}

#Preview {
    AlbumGridView()
}
