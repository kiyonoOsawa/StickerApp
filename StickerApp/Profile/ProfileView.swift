//
//  ProfileView.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/02/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        let barImage = Image("shadowImage")
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    Image("shadowImage")
                        .resizable()
                        .frame(width: geometry.size.width, height: 5)
                        .padding(.bottom, 8.0)
                    ProfileItems()
                        .padding(.top, 32)
                    Spacer()
                }
                .navigationBarTitle("Profile", displayMode: .inline)
            }
        }
    }
}

struct ProfileItems: View {
    var body: some View {
        Image("star")
            .resizable()
            .frame(width: 100, height: 100)
            .padding(20)
            .scaledToFill()
            .overlay(
                RoundedRectangle(cornerRadius: 70)
                    .stroke(Color.gray, lineWidth: 1)
            )
        Text("ユーザ名")
            .font(.system(size: 20, weight: .bold, design: .default))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
