//
//  MusicInfoView.swift
//  Music App
//
//  Created by Shailesh H on 05/04/24.
//

import SwiftUI

struct MusicInfoView: View {
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    var body: some View {
        HStack(spacing: 0){
            ZStack{
                if !expandSheet{
                    GeometryReader{
                        let size = $0.size
                        Image("the-love-album-off-the-grid")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: size.width,height: size.width)
                            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                    }
                    .matchedGeometryEffect(id: "the-love-album-off-the-grid", in: animation)
                }
            }
            .frame(width: 40, height:40)
            Text("Moments (feat. Justin Bieber)")
                .fontWeight(.medium)
                .font(.system(size: 14))
                .lineLimit(1)
                .padding(.trailing,1)
                .padding(.leading,10)
            Spacer()
            Button{
                
            } label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
            }
            
            Button{
                
            } label: {
                Image(systemName: "forward.fill")
                    .font(.title2)
            }
            .padding(.leading,25)
            .padding(.trailing,5)
        }
        .foregroundColor(.primary)
        .padding(.horizontal,18)
        .frame(height: 70)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)){
                expandSheet = true
            }
        }
        
    }
}

