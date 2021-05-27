//
//  DefaultFoodRepository.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/27.
//

import Combine

struct DefaultFoodRepository: FoodRepository {
    func getFood(from selections: Selections) -> AnyPublisher<[FoodDTO]?, Never> {
        // 여기에 구현하시면 됩니다.
        return Just([]).eraseToAnyPublisher()
    }
}
