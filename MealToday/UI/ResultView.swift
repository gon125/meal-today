//
//  ResultView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var showingAlert = false

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                // [NEED] route to ShortcutView
                Button(action: { viewModel.routeToShortcutView()  }, label: {
                    Image(systemName: "house.fill")
                        .font(.system(size: 30))
                        .shadow(radius: 1)
                })

            }
            .padding(.horizontal, 20)
            Divider()

            Spacer()
                .frame(maxHeight: 65)

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
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .shadow(radius: 10/*@END_MENU_TOKEN@*/)

                }
            }
            .padding(.bottom, 30)
            Text("메뉴가 마음에 드시나요?")
                .font(.title)
                .padding(.bottom, 5)
            HStack {
                Button(action: {self.showingAlert = true}, label: {

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

                .popover(isPresented: $showingAlert) {
                    Save2View(show: self.$showingAlert, viewModel: viewModel)
                }

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
            Button(action: {
                viewModel.routeToMap()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 140, height: 60)
                        .foregroundColor(Color.white)
                        .shadow(radius: 5)
                    Text("위치 찾기")
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                }.padding(.top, 8)
            })
            Spacer()
                .frame(minHeight: 50)
        }
    }

}

struct Save2View: View {
    @Binding var show: Bool

    @State var name = "바로가기 이름"
    @State var color: CGColor = UIColor.blue.cgColor
    @State var emoji = "🍜"
    @State var buttonClicked = false

    weak var viewModel: ResultView.ViewModel?

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Text("바로가기 저장")
                    .font(.headline).padding()
                HStack {
                    Spacer()
                    Button(action: {
                        self.show = false
                    }, label: { Text("취소") }).padding()
                }
            }
            Divider()
            Form {
                Section(header: Text("미리보기")) {
                    ShortcutCardEmoji(icon: emoji, title: name, detail: "음식 종류 ...", bgColor: Color(color))
                }
                Section(header: Text("바로가기 이름")) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.gray)
                        TextField("프로필 이름을 입력하세요", text: $name)
                    }
                    .padding()

                }
                Section(header: Text("바로가기 색상")) {
                    ColorPicker("색상을 선택하세요", selection: $color)
                }

                Section(header: Text("바로가기 이모지")) {
                    //                    Text(emoji)
                    TextField("프로필 이모지를 입력하세요", text: $emoji)
                }

                Section {
                    Button(
                        action: {
                            buttonClicked = true
                            viewModel?.saveShortcut(name: name, icon: emoji, color: color.codableColor)
                            buttonClicked = false
                            self.show = false
                        }/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Spacer()
                            Text("저장하기")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(color))
                            Spacer()
                        }

                        }).disabled(buttonClicked)
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
