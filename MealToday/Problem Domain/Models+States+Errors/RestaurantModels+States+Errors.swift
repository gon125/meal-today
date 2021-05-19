//
//  RestaurantModels+States+Errors.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//
import Foundation
import MapKit

struct Restaurant: Locationable, Model {
    let name: String
    let coordinate: Coordinate2D
    let menu: [Menu]
}

struct Menu: Model {
    let price: Int
    let food: Food
}

struct Food: Model {
    let name: String
}

// 1. food -> 

#if DEBUG
extension Food {
    static var randomFoods: [Food] { [Food(name: "피자"), Food(name: "햄버거"), Food(name: "순대국")] }
}
#endif
