//
//  HomeViewModel.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    // Selecting tabs from left
    @Published var selectedTab = "Mushaf"
    
    // Expanding Surah list on right
    @Published var isExpanded = false
    
    // Expanding Menu list on left
    @Published var isMenuExpanded = true
    
    // Selecting surah or Juz list
    @Published var isSurahList = true
    
    // Selecting a page to display
    @Published var selectedPage = "001"
    
    // selecting single or double page layout
    @Published var isSinglePage = false
    
    // Preferred user theme
    @Published var selectedTheme = ""
        
    // Mushaf page type
    @Published var pageType = "new_1441"
    
    // Selected Arabic Font for App
    @Published var arabicFont = "Waseem"
    
    // Check if audio is playing
    @Published var audioPlaying = false
    
    func CheckPage(page: String) -> [String] {
        let pageInt = Int(page) ?? 1
        if pageInt % 2 == 0 { // If page even
            return ([page, AdjustPage(page: page, adj: false)]) //return String("Left")
        }else{
            return([AdjustPage(page: page, adj: true),page]) //let pageRight = pageInt - 1
        }
    }
    
    func AdjustPage(page: String, adj: Bool) -> String {
        var val = Int(page) ?? 1
        if (val < 604){ if adj == true { val += 1 } }
        if (val > 1){ if adj == false { val -= 1 } }
    
        if String(val).count == 1 { return String("00" + String(val)) }
        else if String(val).count == 2 { return String("0" + String(val)) }
        else { return String(val) }
    }
    
    func checkPageType(type: String, page: String) -> String{
        if type == "old"{ return String("madani_old/page" + page) }
        if type == "new_1429"{ return String("madani_new_1429/page" + page) }
        if type == "new_1441"{ return String("madani_new_1441/page" + page) }
        else{ return String("madani_new_1441/page" + page) }
    }
    
    func checkSurah(page: String) -> String{
        for surah in surahs{
            if (surah.page_start <= page && surah.page_end >= page){ return surah.name_ar }
        }
        return ""
    }
}
