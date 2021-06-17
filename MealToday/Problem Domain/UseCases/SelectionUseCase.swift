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
    mutating func revertLastChoice()
    mutating func setSelections(with selections: Selections)
    mutating func reset()
    func getSelections() -> Selections
}

#if DEBUG
struct StubSelectionUseCase: SelectionUseCase {
    mutating func revertLastChoice() {
        //
    }

    mutating func reset() {
        selections = Selections()
        queries = [.dessertOrMeal]
    }

    private var selections = Selections()
    private var queries: [FoodType] = [.dessertOrMeal]

    mutating func setSelections(with selections: Selections) {
        self.selections = selections
    }

    mutating func addChoice(for foodType: FoodType, isChosen: Bool) {
        if foodType == .dessertOrMeal {
            queries += isChosen ? FoodType.dessert : FoodType.meal
        }
        selections.append(.init(foodType: foodType, isChosen: isChosen))
    }

    mutating func getNextQuery() -> AnyPublisher<FoodType?, Never> {
        guard let query = queries.popLast() else { return Just(nil).eraseToAnyPublisher() }
        return Just(query).eraseToAnyPublisher()
    }

    func getSelections() -> Selections {
        self.selections
    }

    var foods: [Food]? = Food.randomFoods

    mutating func getFoodFromSelection() -> AnyPublisher<Food?, Never> { Just(foods?.popLast()).eraseToAnyPublisher() }

}
#endif

typealias DefaultSelectionUseCase = FoodSelectionUseCase

class FoodSelectionUseCase: SelectionUseCase {

    private var selections = Selections()
    private var queries: [FoodType] = [.dessertOrMeal]
    private var popedQueries: [FoodType] = []
    private let repository: FoodRepository
    var foods: LoopIterator<Food>?

    init(repository: FoodRepository) {
        self.repository = repository
    }

    func getFoodFromSelection() -> AnyPublisher<Food?, Never> {
        if foods != nil { return Just(foods!.next()).eraseToAnyPublisher() }
        return repository.getFood(from: selections).map { [weak self] in
            self?.foods = $0?.shuffled().makeIterator()
            return self?.foods?.next()
        }
        .eraseToAnyPublisher()
    }

    func addChoice(for foodType: FoodType, isChosen: Bool) {
        if foodType == .dessertOrMeal {
            queries += isChosen ? FoodType.dessert : FoodType.meal
        } else {
            selections.append(.init(foodType: foodType, isChosen: isChosen))
        }
    }

    func revertLastChoice() {
        _ = selections.popLast()
        if let poped = popedQueries.popLast() {
            queries.append(poped)
        }
        if let poped = popedQueries.popLast() {
            queries.append(poped)
        }
    }

    func getNextQuery() -> AnyPublisher<FoodType?, Never> {
        guard let query = queries.popLast() else { return Just(nil).eraseToAnyPublisher() }
        popedQueries.append(query)
        return Just(query).eraseToAnyPublisher()
    }

    func setSelections(with selections: Selections) {
        self.selections = selections
    }

    func getSelections() -> Selections {
        self.selections
    }

    func reset() {
        self.selections = Selections()
        self.queries = [.dessertOrMeal]
        self.foods = nil
    }
}

struct LoopIterator<T>: IteratorProtocol {
    private var elements: [T]
    private var index = 0

    init(_ elements: [T]) {
        self.elements = elements
    }

    mutating func next() -> T? {
        guard !elements.isEmpty else { return nil }
        index = (index + 1) % elements.count
        return elements[index]
    }
}

extension Array where Element == Food {
    fileprivate func makeIterator() -> LoopIterator<Food> {
        LoopIterator(self)
    }
}
