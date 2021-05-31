//
//  FoodRepository.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/24.
//

import Foundation
import Combine

protocol FoodRepository {
    func getFood(from selections: Selections) -> String
}
