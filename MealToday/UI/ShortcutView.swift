//
//  ShortcutView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

// Images --> SF Symbols
struct ShortcutView: View {
    @EnvironmentObject var appState: AppState
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

                ScrollView {
                    VStack {
                        ShortcutCardWide()
                        ShortcutCard(icon: "moon.fill", title: "출출한 밤엔 !", detail: "치킨, 피자, 라면, 떡볶이, ... ", bgColor: Color.gray)
                        ShortcutCard(icon: "cloud.rain.fill", title: "비도 오고 그래서", detail: "파전, 칼국수, 수제비 ...", bgColor: Color.blue)
                        ShortcutCard(icon: "clock.fill", title: "빨리 빨리!!", detail: "김밥, 햅버거, 샌드위치 ...", bgColor: Color.green)
                        ShortcutCard(icon: "heart.fill", title: "데이트..?", detail: "파스타, 스테이크, 초밥 ...", bgColor: Color.pink)
                        ShortcutCard(icon: "star.fill", title: "특별한 날", detail: "소고기, 참치회, 조개구이 ...", bgColor: Color.purple)

                    }
                    .padding()
                }
            }

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
        }
    }
}

struct ShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutView()
    }
}
