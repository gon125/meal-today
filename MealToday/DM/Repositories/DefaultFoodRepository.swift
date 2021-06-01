//
//  DefaultFoodRepository.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/27.
//

import Combine

struct DefaultFoodRepository: FoodRepository {
    func getFood(from selections: Selections) -> AnyPublisher<[Food]?, Never> {
    
        let dbManager = DBManager()
        var query = ""
            
        for selection in selections.filter({ $0.value == true}) {
            switch selection.key.rawValue {
                case "튀김":
                    query = query + "SELECT name FROM fried UNION "
                case "패스트푸드":
                    query = query + "SELECT name FROM fastfood UNION "
                case "면":
                    query = query + "SELECT name FROM noodle UNION "
                case "고기":
                    query = query + "SELECT name FROM meat UNION "
                case "밥":
                    query = query + "SELECT name FROM rice UNION "
                case "국물":
                    query = query + "SELECT name FROM soup UNION "
                case "해산물":
                    query = query + "SELECT name FROM seafood UNION "
                case "케이크":
                    query = query + "SELECT name FROM cake UNION "
                case "빙수":
                    query = query + "SELECT name FROM bingsu UNION "
                case "빵":
                    query = query + "SELECT name FROM bread UNION "
                case "쿠키&초콜릿":
                    query = query + "SELECT name FROM sweats UNION "
                case "음료":
                    query = query + "SELECT name FROM beverage UNION "
                case "아이스크림":
                    query = query + "SELECT name FROM icecream UNION "
                default:
                    print(selection.key.rawValue)
            }
        }

        query.removeLast(7)
        return Just(dbManager.readData(query: query)).eraseToAnyPublisher()
    }
}
