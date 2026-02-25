//
//  SettingsPageType.swift
//  macQuran
//
//  Created by mBilG on 03/07/2021.
//

import SwiftUI

struct SettingsPageType: View {
    @Binding var pageType : String
    var body: some View {
        VStack{
            
            Text("Page Type") // title
                .font(.system(size: 14, weight: .ultraLight))
                .padding(20)
            
            HStack(spacing: 20){
                VStack{
                    Button(action: { // Old pages
                        pageType = "old"
                    }, label: {
                            Image("madani_old")
                                .resizable()
                                .frame(width:200, height:175)
                                .clipShape(Circle())
                                .scaledToFill()
                                //.cornerRadius(15)
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(color: .gray.opacity(0.7),radius: 7)
                                
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(7)
                    .overlay(Circle().stroke(pageType == "old" ? Color.accentColor.opacity(0.8) : Color.clear, lineWidth: 3))
                    Text("Old Mushaf").font(.body).fontWeight(.light)
                }
                VStack{
                    Button(action: { // new 1429 pages
                        pageType = "new_1429"
                    }, label: {
                            Image("madani_new_1429")
                                .resizable()
                                .frame(width:200, height:175)
                                .clipShape(Circle())
                                .scaledToFill()
                                //.cornerRadius(15)
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(color: .gray.opacity(0.7),radius: 7)
                                
                    }).buttonStyle(PlainButtonStyle())
                    .padding(7)
                    .overlay(Circle().stroke(pageType == "new_1429" ? Color.accentColor.opacity(0.8) : Color.clear, lineWidth: 3))
                    Text("New Mushaf (1429H)").font(.body).fontWeight(.light)
                }
                VStack{
                    Button(action: { // new 1441 pages
                        pageType = "new_1441"
                    }, label: {
                            Image("madani_new_1441")
                                .resizable()
                                .frame(width:200, height:175)
                                .clipShape(Circle())
                                .scaledToFill()
                                //.cornerRadius(15)
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(color: .gray.opacity(0.7),radius: 7)
                        
                    }).buttonStyle(PlainButtonStyle())
                    .padding(7)
                    .overlay(Circle().stroke(pageType == "new_1441" ? Color.accentColor.opacity(0.8) : Color.clear, lineWidth: 3))
                    Text("New Mushaf (1441H)").font(.body).fontWeight(.light)
                }
            }
        }
    }
}
