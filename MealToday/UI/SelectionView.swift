//
//  SelectionView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct SelectionView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()
    @State var dessertOrMeal = true
    
    var body: some View {
        VStack {
            if(dessertOrMeal == true) {
                Text("디저트 OR 식사")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
            } else {
                Text(viewModel.query)
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
            }
            HStack {
                Button(action: { viewModel.onYes(); setState() }, label: {
                    ZStack {

                        Circle()
                            .fill(Color.blue)
                            .frame(width: 130, height: 130)
                        if(dessertOrMeal == true) {
                            Text("디저트")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        } else {
                            Text("YES")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        }
                    }
                })

                Divider().frame(height: 180).padding(.horizontal, 20)

                Button(action: { viewModel.onNo(); setState() }, label: {
                    ZStack {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 130, height: 130)
                        if(dessertOrMeal == true) {
                            Text("식사")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        } else {
                            Text("NO")
                                .font(.system(size: 30))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        }
                    }
                })

            }
        }
    }
    
    func setState() {
        self.dessertOrMeal = false
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
