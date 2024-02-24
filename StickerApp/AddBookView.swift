//
//  AddBookView.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/02/24.
//

import SwiftUI
import PhotosUI

struct AddBookView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
                HStack{
                    BasicPhotosPicker()
                        .padding(.leading, 10)
                    AddTitleView()
                        .padding(.leading, 16)
                    Spacer()
                }
                Spacer()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button{
                                dismiss()
                            } label: {
                                HStack{
                                    Image(systemName: "chevron.backward")
                                    Text("戻る")
                                }
                            }
                        }
                    }
        }
        .padding()
    }
}

struct BasicPhotosPicker: View {
    @State var selectedItem: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(selection: $selectedItem) {
            VStack{
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.bottom, 10)
                    .foregroundColor(.gray)
                Text("表紙")
                    .foregroundColor(.gray)
            }
            .frame(width: 53, height: 67)
            .padding(30)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}

struct AddTitleView: View{
    @State var inputName = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("タイトル")
            TextField("", text: $inputName)
                .frame(height: 24)
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
