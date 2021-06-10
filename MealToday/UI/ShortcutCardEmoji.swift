//
//  ShortcutCard.swift
//  MealToday
//
//  Created by Kwon Jinsol on 2021/05/24.
//

import SwiftUI

struct ShortcutCardEmoji: View {
    var icon: String
    var title: String
    var detail: String
    var bgColor: Color

    var body: some View {

        HStack {

            Text(icon)
                .font(.system(size: 50))
                .foregroundColor(Color.white)
                .shadow(radius: 5)
            Spacer().frame(width: 15)

            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                Text(title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)

                Spacer().frame(height: 5)

                Text(detail)
                    .foregroundColor(Color.white)
            }

            Image(systemName: "chevron.right")
                .font(.system(size: 30))
                .foregroundColor(Color.white)
        }
        .padding(20)
        .background(bgColor)
        .cornerRadius(30)
    }
}

struct ShortcutCardEmoji_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutCardEmoji(icon: "🍜", title: "출출한 밤엔 !", detail: "치킨, 피자, 라면, 떡볶이 ... ", bgColor: Color.green)
    }
}
