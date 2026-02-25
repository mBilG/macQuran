//
//  ArabicFonts.swift
//  macQuran
//
//  Created by mBilG on 05/07/2021.
//

import SwiftUI

struct ArabicFonts: View {
    @Binding var arabicFont : String
    var body: some View {

        VStack{
            Text("Fonts")
                .font(.system(size: 14, weight: .ultraLight))
                .padding(20)
            
            Text("Your text looks like this: ")
            Text("سورة الفاتحة")
                .frame(width: 200, height: 50)
                .padding()
                .font(.custom(arabicFont, size: 30))
            
            Picker(selection: $arabicFont, label: Text("Choose Arabic Font")) {
                Text("Al Bayan").tag("Al Bayan")
                Text("Baghdad").tag("Baghdad")
                Text("DecoType Naskh").tag("DecoType Naskh")
                Text("Diwan Thuluth").tag("Diwan Thuluth")
                Text("Mishafi Gold").tag("Mishafi Gold")
                Text("Sana").tag("Sana")
                Text("Waseem").tag("Waseem")
                    
            }.frame(width:250)
        }.padding()
    }
}
