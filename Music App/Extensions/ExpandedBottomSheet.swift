//
//  ExpandedBottomSheet.swift
//  Music App
//
//  Created by Shailesh H on 05/04/24.
//

import SwiftUI

struct ExpandedBottomSheet: View {
    @Binding var expandSheet: Bool
    @State private var animateContent: Bool = false
    @State private var offsetY: CGFloat = 0
    @State private var isPlaying = false
    @State private var scale: CGFloat = 0
    var animation: Namespace.ID
    var body: some View {
        GeometryReader{
            let size=$0.size
            let safeArea=$0.safeAreaInsets
            
            ZStack{
                RoundedRectangle(cornerRadius: animateContent ? deviceCornerRadius : 0 , style: .circular)
                    .fill(.red)
                    .overlay{
                        RoundedRectangle(cornerRadius: animateContent ? deviceCornerRadius : 0 , style: .circular)
                            .fill(LinearGradient(colors: [Color(red: 1, green: 0, blue: 0),Color(red: 0.95, green: 0, blue: 0),Color(red: 0.647, green: 0, blue: 0)], startPoint: .top, endPoint: .bottom))
                            .opacity(animateContent ? 1 : 0)
                    }
                    .overlay(alignment: .top){
                        MusicInfoView(expandSheet: $expandSheet, animation: animation)
                            .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                            .opacity(animateContent ? 0 : 1)
                    }
                    .matchedGeometryEffect(id: Color(.black), in: animation)
                VStack(spacing: 15){
                    Capsule()
                        .fill(.red)
                        .frame(width: 40,height: 5)
                        .opacity(animateContent ? 1 : 0)
                        .offset(y: animateContent ? 0 : size.height)
                    
                    GeometryReader{
                        let size=$0.size
                        Image("the-love-album-off-the-grid")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: size.width,height: size.width)
                            .clipShape(RoundedRectangle(cornerRadius: animateContent ? 15 : 5, style: .continuous))
                            .shadow(radius: 20, x: 0, y: 20)
                    }
                    .matchedGeometryEffect(id: "the-love-album-off-the-grid", in: animation)
                    .frame(height: size.width - 50)
                    .padding(.vertical, size.height < 700 ? 5 : 15)
                    PlayerView(size)
                        .offset(y: animateContent ? 0 : size.height)
                }
                .padding(.top, safeArea.top + (safeArea.bottom == 0 ? 10 : 0))
                .padding(.bottom, safeArea.bottom == 0 ? 10 : safeArea.bottom)
                .padding(.horizontal, 25)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity, alignment: .top)
                .clipped()
            }
            .contentShape(Rectangle())
            .offset(y: offsetY)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        let translationY = value.translation.height
                        offsetY = (translationY > 0 ? translationY : 0)
                    })
                    .onEnded({ value in
                        withAnimation(.easeInOut(duration: 0.3)){
                            if offsetY > size.height * 0.4{
                                expandSheet = false
                                animateContent = false
                            }
                            else{
                                offsetY = .zero
                            }
                            
                            
                        }
                    })
            )
            .ignoresSafeArea(.container, edges: .all)
        }
        
        .onAppear{
            withAnimation(.easeIn(duration: 0.35)){
                animateContent = true
            }
        }
    }
    
    @ViewBuilder
    func PlayerView(_ mainSize: CGSize) -> some View{
        GeometryReader{
            let size=$0.size
            let spacing = size.height * 0.04
            VStack(spacing: spacing){
                VStack(spacing: spacing){
                    HStack(alignment: .center, spacing: spacing){
                        VStack(alignment: .leading, spacing: 4){
                            Text("Moments (feat. Justin Bieber)")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .lineLimit(1)
                            Text("Diddy")
                                .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        Button{
                            
                        }label: {
                            Image(systemName: "star")
                                .foregroundColor(.white)
                                .padding(12)
                                .background{
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 30,height: 30)
                                        .environment(\.colorScheme, .light)
                                        .opacity(0.4)
                                }
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                                .padding(12)
                                .background{
                                    Circle()
                                        .fill(.ultraThinMaterial)
                                        .environment(\.colorScheme, .light)
                                        .opacity(0.4)
                                }
                        }
                    }
                    Capsule()
                        .fill(.ultraThinMaterial)
                        .opacity(0.8)
                        .environment(\.colorScheme, .light)
                        .frame(height: 6)
                        .padding(.top, spacing)
                    HStack{
                        Text("0.00")
                            .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                            .font(.caption)
                        Spacer()
                        HStack{
                            Image("apple-lossless-seeklogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                                .frame(height: 10)
                            Text("Lossless")
                                .font(.caption)
                                .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                        }
                        .background{
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .environment(\.colorScheme, .light)
                                .cornerRadius(5)
                                .frame(width: 100,height: 22)
                                .padding(.horizontal,11)
                                .opacity(0.4)
                        }
                        
                        Spacer()
                        Text("-4:22")
                            .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                            .font(.caption)
                    }
                }
                .frame(height: size.height / 2.5, alignment: .top)
                
                HStack(spacing: size.width * 0.18){
                    Button{
                        
                    }label: {
                        Image(systemName: "backward.fill")
                            .font(size.height < 300 ? .title3 : .title)
                    }
                    
                    Button(action: {
                                withAnimation {
                                    self.isPlaying.toggle()
                                    self.scale = 1.2 // Scale up on click
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation {
                                        self.scale = 0 // Scale down after a delay
                                    }
                                }
                            }) {
                                ZStack {
                                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.white)
                                        .padding(20)

                                    Circle()
                                        .fill(Color.red)
                                        .scaleEffect(scale)
                                        .opacity(scale > 0 ? 0.2 : 0) // Only show when scale is greater than 0
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "forward.fill")
                            .font(size.height < 300 ? .title3 : .title)
                    }
                }
                .foregroundColor(.white)
                .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack(spacing: spacing){
                    HStack(spacing:15){
                        Image(systemName: "speaker.fill")
                            .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                        
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .environment(\.colorScheme, .light)
                            .frame(height: 6)
                        
                        Image(systemName: "speaker.wave.3.fill")
                            .foregroundColor(Color(red: 0.999, green: 0.428, blue: 0.424))
                        
                    }
                    Spacer()
                    HStack(alignment: .top, spacing: size.width * 0.25){
                        Button{
                            
                        }label: {
                            Image(systemName: "quote.bubble")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.999, green: 0.528, blue: 0.559))
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "airplayaudio")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.999, green: 0.528, blue: 0.559))
                        }
                        Button{
                            
                        }label: {
                            Image(systemName: "list.bullet")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.999, green: 0.528, blue: 0.559))
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

extension View{
    var deviceCornerRadius: CGFloat{
        let key = "_displayCornerRadius"
        if let screen = (UIApplication.shared.connectedScenes.first as?
                         UIWindowScene)?.windows.first?.screen{
            if let cornerRadius = screen.value(forKey: key) as? CGFloat {
                return cornerRadius
            }
            return 0
        }
        return 0
    }
}
