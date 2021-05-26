//
//  CodableColor.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//
import SwiftUI
extension CodableColor {
    var color: Color {
        Color(red: self.red, green: self.green, blue: self.blue, opacity: self.alpha)
    }
}
