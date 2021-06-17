//
//  SelectionView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct SelectionView: View {
    @ObservedObject var viewModel: ViewModel = ViewModel()

    var body: some View {
        VStack {
            Text(viewModel.query)
                .font(.system(size: 40))
                .fontWeight(.black)
                .multilineTextAlignment(.center)
            HStack {
                Button(action: { viewModel.onYes() }, label: {
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

                Button(action: { viewModel.onNo() }, label: {
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

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
