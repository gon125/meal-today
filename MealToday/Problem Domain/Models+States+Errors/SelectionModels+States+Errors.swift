//
//  SelectionModels+States+Errors.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/18.
//

enum FoodType: String, Hashable, Model, CaseIterable, Codable {

    case dessertOrMeal = "디저트는 Yes\n식사는 No"
    // desserts
    case beverage = "음료"
    case bingsu = "빙수"
    case bread = "빵"
    case icecream = "아이스크림"
    case sweets = "쿠키&초콜릿"
    case cake = "케이크"

    // meal
    case meat = "고기"
    case seafood = "해산물"
    case rice = "밥"
    case noodles = "면"
    case soup = "국물"
    case fastfood = "패스트푸드"
    case friedFood = "튀김"

    static let dessert: [FoodType] = [.beverage, .bingsu, .bread, .icecream, .sweets, .cake]
    static let meal: [FoodType] = [.meat, .seafood, .rice, .noodles, .soup, .fastfood, .friedFood]
}

typealias Selections = [Selection]

struct Selection: Model {
    let foodType: FoodType
    let isChosen: Bool
}

#if DEBUG
extension Selections {
    static let stub: Self = [.init(foodType: .beverage, isChosen: true)]
}
#endif

// 매운음식
// 밥 면
// 국물 요리
// 한식
// 일식
// 중식
// 양식
// 디저트
// 고기
// 식사 후식
