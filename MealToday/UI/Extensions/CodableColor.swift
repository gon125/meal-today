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

extension CGColor {
    var codableColor: CodableColor {
        let color = CIColor(cgColor: self)
        return CodableColor(red: Double(color.red), green: Double(color.green), blue: Double(color.blue), alpha: Double(color.alpha))
    }
}
