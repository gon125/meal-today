//
//  ContentView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        switch appState.viewRouting {
        case .shortcut: ShortcutView()
        case .selecting: SelectionView()
        case .selectionFinished: SaveView()
        case .resultView: ResultView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(AppState())
    }
}
