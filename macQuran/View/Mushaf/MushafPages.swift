//
//  MushafPages.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

struct MushafPages: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedPage: String
    @ObservedObject var homeData : HomeViewModel
    
    var body: some View {
        
        let pages = homeData.CheckPage(page: selectedPage)
            HStack(alignment: .center, spacing:50){ // Images side by side : Light theme
                Spacer()
                VStack{
                    Text("\(homeData.checkSurah(page: pages[0]))").font(.custom(homeData.arabicFont, size: 20)).fontWeight(.ultraLight)
                    Spacer()
                    if (colorScheme == .light){ // light theme normal image
                    Image("\(homeData.checkPageType(type: homeData.pageType ,page: pages[0]))") // Left
                        .resizable()
                        .scaledToFit()
                        .onTapGesture { // Tap left
                            selectedPage = homeData.AdjustPage(page: pages[0], adj: true)
                        }.keyboardShortcut(.leftArrow)
                    }else{ // dark theme invert image
                        Image("\(homeData.checkPageType(type: homeData.pageType ,page: pages[0]))") // Left
                            .resizable()
                            .scaledToFit()
                            .colorInvert()
                            .opacity(0.8)
                            .onTapGesture { // Tap left
                                selectedPage = homeData.AdjustPage(page: pages[0], adj: true)
                            }.keyboardShortcut(.leftArrow)
                    }
                    Spacer()
                    Text("\(Int(pages[0])!)").font(.body).fontWeight(.light)
                }
                VStack{
                    Text("\(homeData.checkSurah(page: pages[1]))").font(.custom(homeData.arabicFont, size: 20)).fontWeight(.ultraLight)
                    Spacer()
                    if (colorScheme == .light){ // light theme normal image
                    Image("\(homeData.checkPageType(type: homeData.pageType ,page: pages[1]))") // Right
                        .resizable()
                        .scaledToFit()
                        .onTapGesture { // Tap right
                            selectedPage = homeData.AdjustPage(page: pages[1], adj: false)
                        }.keyboardShortcut(.rightArrow)
                    }else{ // dark theme invert image
                        Image("\(homeData.checkPageType(type: homeData.pageType ,page: pages[1]))") // Right
                            .resizable()
                            .scaledToFit()
                            .colorInvert()
                            .opacity(0.8)
                            .onTapGesture { // Tap right
                                selectedPage = homeData.AdjustPage(page: pages[1], adj: false)
                            }.keyboardShortcut(.rightArrow)
                    }
                    Spacer()
                    Text("\(Int(pages[1])!)").font(.body).fontWeight(.light)
                }
                Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

