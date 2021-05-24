//
//  Location.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/17.
//

protocol Locationable: Model {
    var coordinate: Coordinate2D { get }
}

struct Location: Locationable {
    var coordinate: Coordinate2D

    init(latitude: Double, longitude: Double) {
        self.coordinate = Coordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct Coordinate2D: Model {
    var latitude: Double
    var longitude: Double
}
