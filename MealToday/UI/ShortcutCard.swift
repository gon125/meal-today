//
//  ShortcutCard.swift
//  MealToday
//
//  Created by Kwon Jinsol on 2021/05/24.
//

import SwiftUI

struct ShortcutCard: View {
    var icon: String
    var title: String
    var detail: String
    var bgColor: Color

    var body: some View {

        HStack {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color.white)

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
        }
        .padding(20)
        .background(bgColor)
        .cornerRadius(30)
    }
}

struct ShortcutCard_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutCard(icon: "moon.fill", title: "출출한 밤엔 !", detail: "치킨, 피자, 라면, 떡볶이 ... ", bgColor: Color.green)
    }
}
