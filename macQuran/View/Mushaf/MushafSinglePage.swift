//
//  MushafSinglePage.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

struct MushafSinglePage: View {
    
    @Binding var selectedPage: String
    @ObservedObject var homeData : HomeViewModel
    
    var body: some View {
        HStack{
            Button(action:{ // left button = page up
                selectedPage = homeData.AdjustPage(page: selectedPage, adj: true)
            }, label:{ // left chevron image
                    Image(systemName: "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 200)
                        .font(.system(size: 5, weight: .ultraLight))
                        .opacity(0.1)
            })
            Spacer()
            
            VStack{ // page + number
                Text("\(homeData.checkSurah(page: selectedPage))").font(.custom(homeData.arabicFont, size: 20)).fontWeight(.ultraLight)
                Spacer()
                PageImage(pageNumber: homeData.checkPageType(type: homeData.pageType ,page: selectedPage))
                Spacer()
                Text("\(Int(selectedPage)!)").font(.body).fontWeight(.light) // page number
            }

            Spacer()
            Button(action: { // right button = page down
                selectedPage = homeData.AdjustPage(page: selectedPage, adj: false)
            }, label:{ //right chevron image
                        Image(systemName: "chevron.compact.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 200)
                            .font(.system(size: 5, weight: .ultraLight))
                            .opacity(0.1)
            })
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}

struct PageImage: View{
    @Environment(\.colorScheme) var colorScheme
    @GestureState var scale: CGFloat = 1.0
    var pageNumber : String
    var body: some View{
        if colorScheme == .light { // single page light theme
            Image("\(pageNumber)")
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
                        
        }else{ // single page dark theme
            Image("\(pageNumber)")
                .resizable()
                .antialiased(true)
                .scaledToFit()
                .colorInvert()
                .opacity(0.8)
                .scaleEffect(scale)
                        
        }
    }
}
