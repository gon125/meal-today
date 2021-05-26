//
//  DIContainer.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//

import Foundation

struct DIContainer {
    static var shared: Self = Self()
    private var dependencies = [String: AnyObject]()

    mutating func register<T>(_ dependency: T) {
        let key = "\(type(of: T.self))"
        dependencies[key] = dependency as AnyObject
    }

    func resolve<T>() -> T {
        let key = "\(type(of: T.self))"
        guard let dependency = dependencies[key] as? T else { fatalError("Please Register before resolve. - \(key)") }
        return dependency
    }
}

@propertyWrapper
struct Injected<T> {
    var wrappedValue: T

    init() {
        wrappedValue = DIContainer.shared.resolve()
    }
}
