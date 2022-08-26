//
//  Models.swift
//  TodayAppUIKit
//
//  Created by Thomas Cowern on 8/26/22.
//

import Foundation
import RealmSwift

class Entry : Object {
    @Persisted var text = ""
    @Persisted var date = Date()
    let pictures = List<Picture>()
}

class Picture : Object {
    @Persisted var fullImageName = ""
    @Persisted var thumbnailName = ""
    @Persisted var entry : Entry
}


