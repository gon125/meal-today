//
//  MapUseCase.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/06/01.
//

import Foundation

protocol MapUseCase: UseCase {
    func routeToMap(with: Food, currentLocation: Location)
}

#if DEBUG
struct StubMapUseCase: MapUseCase {
    func routeToMap(with: Food, currentLocation: Location) {
        //
    }
}
#endif

struct DefaultMapUseCase: MapUseCase {
    func routeToMap(with: Food, currentLocation: Location) {
        //
    }
}
