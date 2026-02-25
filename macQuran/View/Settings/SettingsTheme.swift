//
//  SettingsTheme.swift
//  macQuran
//
//  Created by mBilG on 03/07/2021.
//

import SwiftUI

struct SettingsTheme: View {
    @Binding var selectedTheme: String
    var body: some View {
        VStack{
            Text("Theme").font(.system(size: 14, weight: .ultraLight)).padding(20) // Title
            
            HStack(spacing: 40){
                VStack{
                    Button(action: {selectedTheme = "light"}, label: {
                            Image("theme_light")
                                .resizable()
                                .frame(width:150, height:80)
                                .scaledToFill()
                                .cornerRadius(10)
                                .shadow(color: .gray.opacity(0.6),radius: 7)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                                
                    }).buttonStyle(PlainButtonStyle())
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(selectedTheme == "light" ? Color.accentColor.opacity(0.8) : Color.clear, lineWidth: 2))
                    Text("Light")
                            .font(.body)
                            .fontWeight(.light)
                }
                VStack{
                    Button(action: {selectedTheme = ""}, label: {
                        Image("theme_auto")
                            .resizable()
                            .frame(width:150, height:80)
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.6),radius: 7)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                            
                    }).buttonStyle(PlainButtonStyle())
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(selectedTheme == "" ? Color.accentColor.opacity(0.8) : Color.clear, lineWidth: 2))
                    Text("System")
                            .font(.body)
                            .fontWeight(.light)
                }
                VStack{
                    Button(action: {selectedTheme = "dark"}, label: {
                        Image("theme_dark")
                            .resizable()
                            .frame(width:150, height:80)
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color: .gray.opacity(0.6),radius: 7)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                            
                    }).buttonStyle(PlainButtonStyle())
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(selectedTheme == "dark" ? Color.accentColor.opacity(0.8) : Color.clear, lineWidth: 2))
                    
                    Text("Dark")
                            .font(.body)
                            .fontWeight(.light)
                }
                
            }
        }
    }
}

