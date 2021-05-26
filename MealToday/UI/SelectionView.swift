//
//  SelectionView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct SelectionView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("매운 음식")
                .font(.system(size: 40))
                .fontWeight(.black)
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 130, height: 130)
                    Text("YES")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                Divider().frame(height: 180).padding(.horizontal, 20)

                ZStack {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 130, height: 130)
                    Text("NO")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }

            }
        }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
