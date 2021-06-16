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
    
    // add setMode func
    mutating func setMode(with mode: Int)
    
    mutating func reset()
    func getSelections() -> Selections
}

#if DEBUG
struct StubSelectionUseCase: SelectionUseCase {
    
    mutating func reset() {
        // add selectedMode var
        selectedMode = 1
        
        selections = Selections()
        queries = [.dessertOrMeal]
    }
    
    private var selectedMode: Int // mod
    
    private var selections = Selections()
    private var queries: [FoodType] = [.dessertOrMeal]
    
    // mod
    mutating func setMode(with mode: Int) {
        self.selectedMode = mode
        print("struct// selected mode: " + String(mode) + "p")
    }

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

    func getSelections() -> Selections {
        self.selections
    }

    var foods: [Food]? = Food.randomFoods

    mutating func getFoodFromSelection() -> AnyPublisher<Food?, Never> { Just(foods?.popLast()).eraseToAnyPublisher() }

}
#endif

typealias DefaultSelectionUseCase = FoodSelectionUseCase

class FoodSelectionUseCase: SelectionUseCase {

    private var selectedMode: Int
    private var selections = Selections()
    private var queries: [FoodType] = [.dessertOrMeal]
    private let repository: FoodRepository
    var foods: LoopIterator<Food>?

    init(repository: FoodRepository) {
        self.repository = repository
        
        // set default mode to 1p
        self.selectedMode = 1
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
            selections[foodType] = isChosen
        }
    }

    func getNextQuery() -> AnyPublisher<FoodType?, Never> {
        guard let query = queries.popLast() else { return Just(nil).eraseToAnyPublisher() }
        return Just(query).eraseToAnyPublisher()
    }
    
    // set mode (1p, 2p)
    func setMode(with mode: Int) {
        self.selectedMode = mode
        print("class// selected mode: " + String(mode) + "p")
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
