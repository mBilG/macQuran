//
//  TabButtons.swift
//  macQuran
//
//  Created by mBilG on 01/07/2021.
//

import SwiftUI

struct TabButton: View {
    var title : String
    var image: String
    @Binding var selectedTab : String

    var body: some View {

        Button(action: {withAnimation{selectedTab = title}}, label: {
                VStack(spacing:5){
                    
                    Image(systemName: image).font(.system(size: 20, weight: .light))
                    
                    Text(title).font(.system(size: 10, weight: .thin)).lineLimit(1)
                    
                }
                .frame(width:50)
                .foregroundColor(selectedTab == title ? .accentColor : .gray)
        })
        .padding()
        .buttonStyle(PlainButtonStyle())
    }
}
