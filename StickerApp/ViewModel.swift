//
//  ViewModel.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/01/26.
//

import SwiftUI

struct ViewModel {
//    struct Input {
//
//    }
    final class Books: ObservableObject {
        @Published var title = ["①", "②"]
        @Published var image = Image("book1")
        @Published var id = UUID()
    }
    
//    func transform(_input: Input) -> Output{}
}

