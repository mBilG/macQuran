//
//  Surah.swift
//  macQuran
//
//  Created by mBilG on 9/2/21.
//  Copyright © 2021 thinqrlab.com All rights reserved.
//

import Foundation
import SwiftUI

struct SurahType: Hashable, Codable, Identifiable {
    var id: Int
    var name_ar: String
    var name_en: String
    var name_tr_en: String
    var total_verses: String
    var revelation_type: String
    var page_start: String
    var page_end: String
}

struct HizbType: Hashable, Codable, Identifiable {
    var id: String
    var hizb: String
    var juz: String
    var hizb_name: String
    var hizb_start: String
    var hizb_end: String
}

