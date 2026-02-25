//
//  HizbButton.swift
//  macQuran
//
//  Created by mBilG on 02/07/2021.
//

import SwiftUI

struct HizbButton: View {
    
    var hizb : HizbType
    @Binding var selectedPage : String
    var arabicFont : String
    
    var body: some View {
        VStack{
            if (Int(hizb.hizb) ?? 1) % 2 != 0 {
                HStack{
                    Text("Juz").fontWeight(.ultraLight).font(.system(size:16)).padding(.horizontal, 5)
                    Spacer()
                    Text("\(hizb.juz)").fontWeight(.ultraLight).font(.system(size:16)).padding(.horizontal, 5)
                }.opacity((Int(hizb.hizb) ?? 1) % 2 == 0 ? 0 : 0.8).background(Color.gray.opacity(0.1)).cornerRadius(3.0)
            }
        Button(action: {
            selectedPage = hizb.hizb_start
        }, label: {
        HStack{
            
            Image(systemName: hizb.hizb == "1" ? "1.circle" : "2.circle").resizable().scaledToFit().frame(height:15)
            Spacer()
            Text("\(hizb.hizb_name)")
                .font(.custom(arabicFont, size: 20))
        }.foregroundColor((selectedPage >= hizb.hizb_start && selectedPage <= hizb.hizb_end) ? .accentColor : .gray)
        .padding(.vertical,2.5)
        .frame(maxWidth:200)
        
        }).buttonStyle(PlainButtonStyle())
        }}
}

