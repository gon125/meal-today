//
//  MealTodayApp.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import SwiftUI

@main
struct MealTodayApp: App {
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(AppState())
        }
    }
}
