//
//  ResultView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    var body: some View {
        VStack(spacing: 10) {

            ZStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 300, height: 300, alignment: .center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 10/*@END_MENU_TOKEN@*/)
                VStack(spacing: 0) {
                    Spacer().frame(height: 0)
                    Text("오늘 추천 메뉴는")
                        .font(.system(size: 35))
                        .fontWeight(.medium)
                    Text(viewModel.foodName)
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .shadow(radius: 10/*@END_MENU_TOKEN@*/)

                }
            }
            .padding(.bottom, 30)
            Text("메뉴가 마음에 드시나요?")
                .font(.title)
                .padding(.bottom, 5)
            HStack {
                Button(action: { }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 120, height: 50)
                            .foregroundColor(Color.blue)
                            .padding(.horizontal, 5)
                        Text("저장하기")
                            .font(.system(size: 25))
                            .foregroundColor(Color.white)
                    }
                })
                Button(action: { viewModel.retry() }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 120, height: 50)
                            .foregroundColor(Color.gray)
                            .padding(.horizontal, 5)
                        Text("다시뽑기")
                            .font(.system(size: 25))
                    }
                })

            }
            ZStack {
                RoundedRectangle(cornerRadius: 15)
//                            .stroke(lineWidth: 2)
                    .frame(width: 140, height: 60)
                    .foregroundColor(Color.white)
                    .shadow(radius: 5)
                Text("위치 찾기")
                    .font(.system(size: 30))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.black)
            }.padding(.top, 8)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
