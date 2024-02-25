//
//  StickerView.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/02/25.
//

import SwiftUI

struct StickerView: View {
    var body: some View {
        ViewItem()
    }
}

struct ViewItem: View {
    var body: some View {
        Image("star")
            .resizable()
            .frame(width: 100, height: 100)
            .scaledToFill()
        Text("star1")
        ShowAlertButton()
            .padding(.top, 30)
            .foregroundColor(Color.red)
    }
}

struct ShowAlertButton: View {
    @State private var isShowAlert = false
    var body: some View {
        Button("削除") { isShowAlert.toggle() }
            .alert("ステッカーを削除しますか", isPresented: $isShowAlert) {
                //action
            } message: {
                Text("この処理は取り消せません")
            }
    }
}

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        StickerView()
    }
}
