//
//  Mushaf.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

struct Mushaf: View {

    @ObservedObject var homeData : HomeViewModel
    var body: some View {

        ZStack{
            HStack{
                VStack{
                    GeometryReader { geo in
                        if (geo.size.width < 800 || homeData.isSinglePage) {
                            MushafSinglePage(selectedPage: $homeData.selectedPage, homeData: homeData).padding(.top,5)
                        }else{
                            MushafPages(selectedPage: $homeData.selectedPage, homeData: homeData)
                        }
                    }
                    SurahProgress(page: homeData.selectedPage)
                }
                
                VStack{
                        
                        Button(action: {withAnimation{homeData.isSurahList.toggle()}}, label:{
                            HStack{
                                Text("Surah").fontWeight(.ultraLight).font(.system(size:10)).foregroundColor(homeData.isSurahList ? .primary : .gray.opacity(0.6)).padding(.trailing, 8)
                                Image(systemName: homeData.isSurahList ? "square.fill.and.line.vertical.and.square" : "square.and.line.vertical.and.square.fill")
                                    .resizable().scaledToFit().frame(height:15).opacity(0.75)
                                Text("Hizb").fontWeight(.ultraLight).font(.system(size:10)).foregroundColor(homeData.isSurahList ? .gray.opacity(0.6) : .primary).padding(.leading, 8)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())
                        .help(homeData.isSurahList ? "Show Hizb List" : "Show Surah List")
                        .padding(.top,8)
                    ZStack{
                        HizbScrollView(homeData: homeData)
                            .opacity(homeData.isSurahList ? 0 : 1)
                        SurahScrollView(homeData: homeData)
                            .opacity(homeData.isSurahList ? 1 : 0)
                            
                    }.padding(.horizontal, homeData.isExpanded ? 10 : 0)
                }
                .frame(width: homeData.isExpanded ? 230 : 0)
                .opacity(homeData.isExpanded ? 1 : 0)
                .background(BlurWindow())
                
            }
            VStack{ // right sidebar button placement
                HStack{
                    Spacer()
                    Button(action: {withAnimation{homeData.isSinglePage.toggle()}}, label:{
                        Image(systemName: homeData.isSinglePage ? "rectangle.split.1x2" : "rectangle").resizable().scaledToFit().rotationEffect(.degrees(90)).frame(height:15).opacity(0.75)
                    })
                        .padding(.vertical,8)
                        .padding(.horizontal,homeData.isExpanded ? 200 : 0)
                        .buttonStyle(PlainButtonStyle())
                        .help(homeData.isSinglePage ? "Show Two Pages" : "Show Single Page")
                    
                    Button(action: {withAnimation{homeData.isExpanded.toggle()}}, label:{
                        Image(systemName: "sidebar.right").resizable().frame(width:20, height:15).opacity(0.75)
                    })
                    .padding(.vertical,8)
                    .padding(.trailing,10)
                    .buttonStyle(PlainButtonStyle())
                    .help(homeData.isExpanded ? "Hide Surah List" : "Show Surah List")
                }
                Spacer()
            }
        }
    }
}
