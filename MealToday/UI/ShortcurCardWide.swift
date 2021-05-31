//
//  ShortcutCardWide.swift
//  MealToday
//
//  Created by Kwon Jinsol on 2021/05/24.
//

import SwiftUI

struct ShortcutCardWide: View {
    var body: some View {

        VStack(alignment: .leading) {
            Rectangle().frame(height: 0)
            Text("디저트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("아메리카노, 프라프치노, 밀크티 ...")
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            HStack {
                ZStack {
                    Circle().frame(width: 50, height: 50)
//                    Text("이")
//                        .font(.system(size: 30))
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(Color.gray)
                }
                ZStack {
                    Circle().frame(width: 50, height: 50)
//                    Text("미")
//                        .font(.system(size: 30))
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(Color.gray)
                }
                ZStack {
                    Circle().frame(width: 50, height: 50)
//                    Text("지")
//                        .font(.system(size: 30))
//                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                        .foregroundColor(Color.gray)
                }

                Spacer()

                Text("둘러보기")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 100)
                    .background(Color.blue)
                    .cornerRadius(20)
            }
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(30)
    }
}

struct ShortcutCardWide_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutCardWide()
    }
}
