//
//  ContentView.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI
import Combine

struct AppView: View {
    @State private var viewRouting: AppState.ViewRouting = .shortcut
    @Injected var appState: AppState

    var body: some View {
        Group {
            switch viewRouting {
            case .shortcut: ShortcutView()
            case .selecting: SelectionView()
            case .resultView: ResultView()
            }
        }.onReceive(appState.$viewRouting, perform: { viewRouting = $0 })
    }

    // MARK: - Private
    private var cancelBag = Set<AnyCancellable>()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
