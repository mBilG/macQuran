//
//  ModelData.swift
//  macQuran
//
//  Created by mBilG on 11/2/21.
//  Copyright © 2021 thinqrlab.com All rights reserved.
//

import Foundation
import Combine

var surahs: [SurahType] = load("SurahData.json")
var hizbs: [HizbType] = load("HizbData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else { fatalError("Couldn't find \(filename) in main bundle.") }

    do { data = try Data(contentsOf: file) }
    catch {fatalError("Couldn't load \(filename) from main bundle:\n\(error)")}

    do { let decoder = JSONDecoder(); return try decoder.decode(T.self, from: data) }
    catch { fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)") }
}
