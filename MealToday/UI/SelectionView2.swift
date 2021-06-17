//
//  SelectionView2.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct SelectionView2: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var dessertOrMeal = true

    var body: some View {
        VStack {
            if dessertOrMeal == true {
                HStack {
                    Button(action: { viewModel.onYes(); setState() }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 130, height: 130)
                            Text("디저트")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    })

                    Spacer().frame(height: 100)
                    Divider().frame(height: 180).padding(.horizontal, 20)
                    Spacer().frame(height: 100)

                    Button(action: { viewModel.onNo(); setState() }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 130, height: 130)
                            Text("식사")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    })
                }.rotationEffect(Angle(degrees: 90))
            } else {
                HStack {
                    Button(action: { viewModel.selectionA(with: 0) }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 130, height: 130)
                            Text("No")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .rotationEffect(Angle(degrees: 180))
                        }
                    })

                    Divider().frame(height: 180).padding(.horizontal, 20)

                    Button(action: { viewModel.selectionA(with: 1) }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 130, height: 130)
                            Text("YES")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .rotationEffect(Angle(degrees: 180))
                        }
                    })
                }

                Text(viewModel.query)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .rotationEffect(Angle(degrees: 180))

                Spacer().frame(height: 100)

                Text(viewModel.query)
                    .font(.system(size: 40))
                    .fontWeight(.black)

                HStack {
                    Button(action: { viewModel.selectionB(with: 1) }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 130, height: 130)
                            Text("YES")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    })

                    Divider().frame(height: 180).padding(.horizontal, 20)

                    Button(action: { viewModel.selectionB(with: 0) }, label: {
                        ZStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 130, height: 130)
                            Text("No")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                        }
                    })
                }
            }
        }
    }

    func setState() {
        self.dessertOrMeal = false
    }
}

struct SelectionView2_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView2(dessertOrMeal: false)
    }
}
