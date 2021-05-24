//
//  Selection.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/18.
//
import Combine

protocol SelectionUseCase: UseCase {
    func getFirstQuery() -> AnyPublisher<String, Never>
    func getNextQuery(isDessert: Bool) -> AnyPublisher<[FoodType], Never>
    func getFoodFrom(selection: Selection) -> AnyPublisher<Food?, Never>
    func getFoodFromCache() -> AnyPublisher<Food?, Never>
}

#if DEBUG
struct StubSelectionUseCaase: SelectionUseCase {
    var foods: [Food]? = Food.randomFoods

    func getFirstQuery() -> AnyPublisher<String, Never> {
        Just(firstQuery).eraseToAnyPublisher()
    }

    func getNextQuery(isDessert: Bool) -> AnyPublisher<[FoodType], Never> {
        Just(isDessert ? FoodType.dessert : FoodType.meal ).eraseToAnyPublisher()
    }

    func getFoodFrom(selection: Selection) -> AnyPublisher<Food?, Never> { Just(foods?.randomElement()).eraseToAnyPublisher() }

    func getFoodFromCache() -> AnyPublisher<Food?, Never> { Just(foods?.randomElement()).eraseToAnyPublisher() }

    let firstQuery: String = "디저트 Or 식사"
}
#endif
