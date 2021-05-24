//
//  RestaurantUseCase.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

import Foundation
import Combine

protocol RestaurantUseCase {
    func getRestaurant(near currentLocation: Location, with food: Food) -> AnyPublisher<[Restaurant], Never>
}

#if DEBUG
struct StubRestaurantUseCase: RestaurantUseCase {
    func getRestaurant(near currentLocation: Location, with food: Food) -> AnyPublisher<[Restaurant], Never> {
        var coordnates = [Coordinate2D]()
        for _ in 0..<10 {
            coordnates.append(
                Coordinate2D(
                    latitude: currentLocation.coordinate.latitude + Double.random(in: -0.006..<0.006),
                    longitude: currentLocation.coordinate.longitude + Double.random(in: -0.006..<0.006))
            )
        }
        let restaurants: [Restaurant] = coordnates.map { Restaurant(name: "", coordinate: $0, menu: []) }
        return Just(restaurants).eraseToAnyPublisher()
    }
}
#endif
