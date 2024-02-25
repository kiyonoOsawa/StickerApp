//
//  DBService.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/02/25.
//

import Foundation
import SwiftUI

class DBService: ObservableObject {
    @Published var books: [Books] = []
    @Published var stickers: [Stickers] = []
}

struct Books: Identifiable {
    var name: String
    var image: String
    var id = UUID()
}

struct Stickers: Identifiable {
    var name: String
    var image: String
    var id = UUID()
}
