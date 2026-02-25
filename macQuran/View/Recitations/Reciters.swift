//
//  Reciters.swift
//  macQuran
//
//  Created by mBilG on 04/07/2021.
//

import SwiftUI

struct Reciters: View {
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 1)
        ScrollView(showsIndicators: false) {
            
            LazyVGrid(columns: columns, content: {
                Reciter(reciterName: "Abdul Basit Abdus Samad", reciterImage: "Abdul Basit Abdus Samad")
                Reciter(reciterName: "Mahmoud Khaleel Al-Husary", reciterImage: "Mahmoud Khaleel Al-Husary")
                Reciter(reciterName: "Muhammad Siddiq al-Minshawi", reciterImage: "Muhammad Siddiq al-Minshawi")
            })
        }
        
    }
}

struct Reciter: View {
    var reciterName: String
    var reciterImage: String
    var body: some View {
        HStack{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            VStack{
                Image(reciterImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width:150,height:170)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                Text(reciterName)
            }
            .padding(.vertical,5)
            .frame(width:200)
            .background(Color.blue)
            .cornerRadius(10)
        }).buttonStyle(PlainButtonStyle())
        .padding()
            Spacer()
            MediaPlayer()
        }.background(Color.gray)
        .cornerRadius(15)
        .shadow(radius: 5)
        .frame(width:200)
    }
}

struct AudioSurahList: View {
    var body: some View {
        let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)
        ScrollView(showsIndicators: false) {
            
            LazyVGrid(columns: columns, content: {
                ForEach(surahs){surah in
                    AudioSurahButton(surah: surah)
                }
            })
        }
        .frame(width: 200)
    }
}

struct AudioSurahButton: View {
    var surah: SurahType
    var body: some View {
        Button(action:{
        }, label:{
            HStack{
                Text("\(surah.id)")
                    .fontWeight(.ultraLight)
                    .font(.system(size:16))
                Spacer()
                Text("\(surah.name_en)")
                    .font(.caption)
                    .fontWeight(.light)
                    .font(.system(size:8))
                Spacer()
                Text("\(surah.name_ar)")
                    .font(.custom("DecoType Naskh", size: 20))
                
            }
//            .foregroundColor((selectedPage >= surah.page_start && selectedPage <= surah.page_end) ? .primary : .gray)
        }).buttonStyle(PlainButtonStyle())
        .padding(2.5)
        .frame(width:200)
        
    }
}

struct Reciters_Previews: PreviewProvider {
    static var previews: some View {
        Reciters()
    }
}
