//
//  BookView.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/02/24.
//

import SwiftUI

struct BookView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            HStack {
                VStack {
                    BookData()
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("閉じる")
                    }
                }
            }
        }
        .padding(.top, 100)
    }
}

struct BookData: View {
    @Environment(\.editMode) var mode
    var body: some View {
        VStack {
            Image("book1")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text("タイトル")
                .padding(.top, 30)
                .font(.system(size: 32))
            Text("MM/dd/YYYY")
                .padding(.top, 1)
                .font(.system(size: 12))
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
