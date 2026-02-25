//
//  Home.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

var screen = NSScreen.main!.visibleFrame

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {

        ZStack{
            HStack{
                LeftSidebar(homeData: homeData)
                    .frame(width: homeData.isMenuExpanded ? 70 : 0)
                    .opacity(homeData.isMenuExpanded ? 1 : 0)
                    .background(BlurWindow())
                    .ignoresSafeArea(.all)
            HStack{
                switch homeData.selectedTab{
                case "Mushaf": Mushaf(homeData: homeData)
                case "Recitation": Recitation(homeData: homeData)
                case "Settings": Settings(homeData: homeData)
                default: Mushaf(homeData: homeData)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            VStack{ // placement of left sidebar button
                HStack{
                    Spacer().frame(width: 75)
                    Button(action: {withAnimation{homeData.isMenuExpanded.toggle()}},
                           label:{Image(systemName: "sidebar.left").resizable().frame(width:20, height:15).opacity(0.75)}
                    )
                    .padding(.all,8)
                    .buttonStyle(PlainButtonStyle())
                    .help(homeData.isMenuExpanded ? "Hide Menu" : "Show Menu")
                    Button(action: {if homeData.selectedTheme == "dark"{homeData.selectedTheme = "light"}else{homeData.selectedTheme = "dark"}},
                           label: {Image(systemName: homeData.selectedTheme == "dark" ? "sun.max" : homeData.selectedTheme == "light" ? "moon.stars" : "sun.min").resizable().frame(width:15, height:15).opacity(0.75)}
                    )
                    .buttonStyle(PlainButtonStyle())
                    .help(homeData.selectedTheme == "dark" ? "Light Theme" : "Dark Theme")
                    Spacer()
                
                }
            Spacer()
            }
        }
        .ignoresSafeArea(.all, edges: .all)
        .preferredColorScheme(homeData.selectedTheme == "dark" ? .dark : homeData.selectedTheme == "light" ? .light : nil)
        .frame(minWidth: 780, minHeight: 650)
        .onAppear(perform: {getData()})
        .onDisappear(perform: {saveData()})
        }
    
    // save user default data from homeData to use upon app restart
    func saveData(){
        UserDefaults.standard.set(self.homeData.selectedPage, forKey: "selectedPage")
        UserDefaults.standard.set(self.homeData.selectedTheme, forKey: "selectedTheme")
        UserDefaults.standard.set(self.homeData.pageType, forKey: "pageType")
        UserDefaults.standard.set(self.homeData.arabicFont, forKey: "arabicFont")
        UserDefaults.standard.set(self.homeData.isSinglePage, forKey: "isSinglePage")
        UserDefaults.standard.set(self.homeData.isSurahList, forKey: "isSurahList")
        UserDefaults.standard.set(self.homeData.isExpanded, forKey: "isExpanded")
        UserDefaults.standard.set(self.homeData.isMenuExpanded, forKey: "isMenuExpanded")
    }
    
    // get user default data and save to homeData Model
    func getData(){
        self.homeData.selectedPage = UserDefaults.standard.string(forKey: "selectedPage") ?? "001"
        self.homeData.selectedTheme = UserDefaults.standard.string(forKey: "selectedTheme") ?? ""
        self.homeData.pageType = UserDefaults.standard.string(forKey: "pageType") ?? "new_1441"
        self.homeData.arabicFont = UserDefaults.standard.string(forKey: "arabicFont") ?? "Waseem"
        self.homeData.isSinglePage = UserDefaults.standard.bool(forKey: "isSinglePage")
        self.homeData.isSurahList = UserDefaults.standard.bool(forKey: "isSurahList")
        self.homeData.isExpanded = UserDefaults.standard.bool(forKey: "isExpanded")
        self.homeData.isMenuExpanded = UserDefaults.standard.bool(forKey: "isMenuExpanded")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
