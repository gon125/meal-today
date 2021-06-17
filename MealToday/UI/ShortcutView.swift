//
//  ShortcutView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

// Images --> SF Symbols
struct ShortcutView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                }
                .padding(.horizontal, 20)
                Text("오늘 뭐 먹지?")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                List {
                    ShortcutCardWide()
                    ForEach(viewModel.shortcuts) { shortcut in
                        Button(action: { viewModel.routeToResultView(with: shortcut) }, label: {
                            // Emoji 사용 --> ShortcutCardEmoji()
                            ShortcutCardEmoji(icon: shortcut.icon, title: shortcut.name, detail: shortcut.description, bgColor: shortcut.color.color)
                        })
                    }
                    .onDelete(perform: { indexSet in
                        indexSet.forEach {
                            viewModel.deleteShortcut(index: $0)
                        }
                    })
                    ShortcutCardEmoji(icon: "🌙", title: "출출한 밤엔 !", detail: "치킨, 피자, 라면, 떡볶이, ... ", bgColor: Color.gray)
                    ShortcutCardEmoji(icon: "🌧", title: "비도 오고 그래서", detail: "파전, 칼국수, 수제비 ...", bgColor: Color.blue)
                    ShortcutCardEmoji(icon: "🍔", title: "빨리 빨리!!", detail: "김밥, 햅버거, 샌드위치 ...", bgColor: Color.green)
                    ShortcutCardEmoji(icon: "❤️", title: "데이트..?", detail: "파스타, 스테이크, 초밥 ...", bgColor: Color.pink)
                    ShortcutCardEmoji(icon: "🍽", title: "특별한 날", detail: "소고기, 참치회, 조개구이 ...", bgColor: Color.purple)
                }
                .listStyle(SidebarListStyle())

            }
            VStack {
                Button(action: { viewModel.routeToSelectingView2p() }, label: {
                    Circle()
                        .foregroundColor(Color.yellow)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "person.2")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        )
                        .padding(10)
                        .shadow(radius: 20)
                })
                Button(action: { viewModel.routeToSelectingView() }, label: {
                    Circle()
                        .foregroundColor(Color.yellow)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "plus")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        )
                        .padding(10)
                        .shadow(radius: 20)
                })
            }
        }
    }
}

struct ShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutView()
    }
}
