//
//  ContentView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2023/06/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    
                    if let videoURL = Bundle.main.url(forResource: "HowTo", withExtension: "mp4") {
                        VideoPlayerView(videoURL: videoURL)
                            .aspectRatio(1179.0/2556.0, contentMode: .fill) // アスペクト比を設定
                            .frame(width: 300)
                        
                    }else {
                        Text("Whrere is Video?")
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "1.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.blue)
                            .font(.system(size: 25))
                        Text("設定を開く")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "2.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.blue)
                            .font(.system(size: 25))
                        Text("一般＞キーボード＞キーボードへ進む")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "3.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.blue)
                            .font(.system(size: 25))
                        Text("新しいキーボードを追加をタップ")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "4.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.blue)
                            .font(.system(size: 25))
                        Text("SCKを選択")
                        Spacer()
                    }
                    
                    HStack{
                        Image(systemName: "5.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundStyle(.blue)
                            .font(.system(size: 25))
                        Text("キーボードを切り替える")
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            VStack {
                Spacer()
                    .frame(height: 10)
                Text("使い方")
                    .fontWeight(.bold)
                    .font(.title)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
