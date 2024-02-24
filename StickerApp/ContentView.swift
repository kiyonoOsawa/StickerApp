//
//  ContentView.swift
//  StickerApp
//
//  Created by 大澤清乃 on 2024/01/23.
//

import SwiftUI

struct Books: Identifiable {
    var name: String
    var Image: String
    var id = UUID()
}

struct Stickers: Identifiable {
    var name: String
    var Image: String
    var id = UUID()
}

struct ContentView: View {
//    @State var mode: EditMode = .inactive
    var body: some View {
//        BookView().environment(\.editMode, mode)
        let barImage = Image("shadowImage")
        let showAnotherView: Bool = false
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    Image("shadowImage")
                        .resizable()
                        .frame(width: geometry.size.width, height: 5)
                        .padding(.bottom, 8.0)
                    HStack {
                        AddNewBook()
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    FirstList()
                    HStack {
                        AddNewSticker()
                    }
                    .frame(width: geometry.size.width, alignment: .leading)
                    SecondList()
                }
                .navigationBarTitle("Home", displayMode: .inline)
            }
        }
    }
}

struct AddNewBook: View {
    @State var showAnotherView: Bool = false
    var body: some View {
        Text("Books")
            .padding(.leading, 40)
            .multilineTextAlignment(.leading)
            .font(.system(size: 20, weight: .medium, design: .default))
        Button(action: {
            self.showAnotherView = true
        }, label: {
            Image(systemName: "plus.circle")
                .foregroundColor(.gray)
                .padding(.leading, 16)
                .frame(height: 20)
        })
        .sheet(isPresented: $showAnotherView, content: {
            AddBookView()
        })
    }
}

fileprivate struct AnotherView: View {
    var textContent: String
    var body: some View {
        Text(textContent)
    }
}

struct FirstList: View {
    @State var bookData = [Books(name: "①", Image: "book1"),
                           Books(name: "②", Image: "book1")]
    @State var showAnotherView: Bool = false
    var body: some View {
        GeometryReader { geo in
            List(0..<bookData.count, id:\.self) { index in
                FirstListData(book: $bookData[index])
                    .frame(height: 200)
                    .contentShape(Rectangle())
                    .listRowSeparator(.hidden)
                    .padding(.top, 20)
            }
            .padding(.all, 10)
            .frame(width: geo.size.height, height: geo.size.width)
            .background(Color.white.opacity(0.3))
            .cornerRadius(10)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .rotationEffect(.degrees(-90), anchor: .bottomLeading)
            .transformEffect(.init(translationX: geo.size.width, y: 0))
            .scaleEffect(x: 1, y: -1)
        }
    }
}

struct FirstListData: View {
    @Binding var book: Books
    @State var showAnotherView: Bool = false
    var body: some View {
        GeometryReader { geo in
            VStack() {
                Image(book.Image)
                Text(book.name)
                Spacer()
            }
            .padding(.all, 10)
            .background(Color.white.opacity(0.3))
            .cornerRadius(10)
            .listRowSeparator(.hidden)
            .frame(width: geo.size.height, height: geo.size.width)
            .rotationEffect(.degrees(90), anchor: .topTrailing)
            .transformEffect(.init(translationX: 0, y: geo.size.height))
            .scaleEffect(x: -1, y: 1)
            //Cell全体をタップ領域に
            .contentShape(Rectangle())
            .onTapGesture {
                self.showAnotherView = true
            }
            .sheet(isPresented: $showAnotherView, content: {
                BookView()
            })
        }
    }
}

struct AddNewSticker: View {
    @State var showAnotherView: Bool = false
    var body: some View {
        Text("Stickers")
            .padding(.leading, 40)
            .multilineTextAlignment(.leading)
            .font(.system(size: 20, weight: .medium, design: .default))
        Button(action: {
            self.showAnotherView = true
        }, label: {
            Image(systemName: "plus.circle")
                .foregroundColor(.gray)
                .padding(.leading, 16)
                .frame(height: 20)
        })
        .sheet(isPresented: $showAnotherView, content: {
            AddStickerView()
        })
    }
}

struct SecondList: View {
    @State var stickerData =
    [Stickers(name: "star1", Image: "star"),
     Stickers(name: "star2", Image: "star"),
     Stickers(name: "star3", Image: "star"),
     Stickers(name: "star4", Image: "star"),
     Stickers(name: "star4", Image: "star"),
     Stickers(name: "star4", Image: "star"),
     Stickers(name: "star4", Image: "star"),
     Stickers(name: "star4", Image: "star"),
     Stickers(name: "star4", Image: "star")]
    
    //1行当たり3つのアイコンを表示
    let colum: [GridItem] = Array(repeating: .init(.flexible(minimum: 75)), count: 4)
    var body: some View {
        GeometryReader { geo in
            List(0..<1) { index in
                LazyVGrid(columns: colum, spacing: 60) {
                    ForEach(stickerData) {_ in
                        SecondListData(sticker: $stickerData[index])
                            .frame(height: 20)
                            .padding(.top, 0)
                            .contentShape(Rectangle())
                    }
                }
                .padding()
                .listRowSeparator(.hidden)
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .listStyle(.plain)
            .scrollDisabled(true)
        }
    }
}

struct SecondListData: View {
    @Binding var sticker: Stickers
    var body: some View {
        VStack {
            Image(sticker.Image)
                .resizable()
                .frame(width: 30, height: 30)
            Text(sticker.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
