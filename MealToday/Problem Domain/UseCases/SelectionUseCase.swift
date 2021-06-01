//
//  Selection.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/18.
//
import Combine

protocol SelectionUseCase: UseCase {
    mutating func getFoodFromSelection() -> AnyPublisher<Food?, Never>
    mutating func addChoice(for foodType: FoodType, isChosen: Bool)
    mutating func getNextQuery() -> AnyPublisher<FoodType?, Never>
    mutating func setSelections(with selections: Selections)
}

#if DEBUG
typealias DefaultSelectionUseCase = StubSelectionUseCaase

struct StubSelectionUseCaase: SelectionUseCase {

    private var selections = Selections()
    private var queries: [FoodType] = [.dessertOrMeal]

    mutating func setSelections(with selections: Selections) {
        self.selections = selections
    }

    mutating func addChoice(for foodType: FoodType, isChosen: Bool) {
        if foodType == .dessertOrMeal {
            queries += isChosen ? FoodType.dessert : FoodType.meal
        }
        selections[foodType] = isChosen
    }

    mutating func getNextQuery() -> AnyPublisher<FoodType?, Never> {
        guard let query = queries.popLast() else { return Just(nil).eraseToAnyPublisher() }
        return Just(query).eraseToAnyPublisher()
    }

    var foods: [Food]? = Food.randomFoods

    mutating func getFoodFromSelection() -> AnyPublisher<Food?, Never> { Just(foods?.popLast()).eraseToAnyPublisher() }

}
#endif
