//
//  MapUseCase.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/06/01.
//

import Foundation
import UIKit

protocol MapUseCase: UseCase {
    func routeToMap(with: Food)
}

#if DEBUG
struct StubMapUseCase: MapUseCase {
    func routeToMap(with: Food) {

        let string = "https://m.map.kakao.com/actions/searchView?q="+"치킨"
        guard let string2 = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url=URL(string: string2) else {
            print("error : URL is nil")
            return }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("error : cannot open safari or kakaomap")
        }
    }
}
#endif

struct DefaultMapUseCase: MapUseCase {
    func routeToMap(with: Food) {
        //
        let string = "https://m.map.kakao.com/actions/searchView?q="+with.name
        guard let string2 = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url=URL(string: string2) else {
            print("error : URL is nil")
            return }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("error : cannot open safari or kakaomap")
        }
    }
}
