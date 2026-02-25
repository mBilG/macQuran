//
//  SingleMiniPage.swift
//  macQuran
//
//  Created by mBilG on 02/07/2021.
//

import SwiftUI

struct SurahButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    var surah: SurahType
    @Binding var selectedPage : String
    var arabicFont : String
    
    var body: some View {
        
        Button(action:{
            selectedPage = surah.page_start
        }, label:{
            HStack{
                Text("\(surah.id)").fontWeight(.ultraLight).font(.system(size:16))
                Spacer()
                Text("\(surah.name_en)").font(.caption).fontWeight(.light).font(.system(size:8))
                Spacer()
                Text("\(surah.name_ar)").font(.custom(arabicFont, size: 20))
                
            }
            .foregroundColor((selectedPage >= surah.page_start && selectedPage <= surah.page_end) ? .accentColor : .gray)
        })
        .buttonStyle(PlainButtonStyle())
        .padding(.vertical,2.5)
        .frame(width:200)
    }
}
