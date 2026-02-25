//
//  Settings.swift
//  macQuran
//
//  Created by mBilG on 30/06/2021.
//  Copyright © 2021 thinqrlab.com All rights reserved.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var homeData: HomeViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack{
             
                VStack(spacing:5){
                    Text("About")
                        .font(.system(size: 14, weight: .ultraLight))
                        .padding(20)
                    Image("Icon")
                        .resizable()
                        .frame(width:80, height:80)
                    Text("V1.3")
                    Text("A free and simple macOS Quran App")
                    Text("More functionalities to be added")
                    Text("Developed by: mBilG")
                }
                
                Divider()
                    .frame(width: 100)
                    .padding(20)
                
                ArabicFonts(arabicFont: $homeData.arabicFont)
                Divider()
                    .frame(width: 100)
                    .padding(20)
                
                SettingsTheme(selectedTheme: $homeData.selectedTheme)
                Divider()
                    .frame(width: 100)
                    .padding(20)
                
                SettingsPageType(pageType: $homeData.pageType)
                    .padding(.horizontal,10)

            }
            .padding(.top, 40)
            .padding(.bottom, 40)
            .frame(maxWidth:.infinity)
        }
    }
}
