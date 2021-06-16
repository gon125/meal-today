//
//  SelectionViewMOdel.swift
//  MealToday
//
//  Created by Geonhyeong LIm on 2021/05/26.
//

import SwiftUI
import Combine

extension SelectionView2 {
    final class ViewModel: ObservableObject {
        @Published var query: String = ""
        @Published var foodType: FoodType = FoodType.dessertOrMeal
        @Injected private var selectionUseCase: SelectionUseCase
        @Injected private var appState: AppState
        
        private var selectedA: Int = 0
        private var selectedB: Int = 0

        init() {
            getNextQuery()
        }

        func onYes1() {
            if(selectedA == 0) {
                self.selectedA = selectedA + 1
            }
            selectionUseCase.addChoice(for: foodType, isChosen: true)
            if(self.selectedA == 1 && self.selectedB == 1) {
                resetSelectedValue()
                getNextQuery()
            }
        }

        func onNo1() {
            if(selectedA == 0) {
                self.selectedA = selectedA + 1
            }
            selectionUseCase.addChoice(for: foodType, isChosen: false)
            if(self.selectedA == 1 && self.selectedB == 1) {
                resetSelectedValue()
                getNextQuery()
            }
        }
        
        func onYes2() {
            if(selectedB == 0) {
                self.selectedB = selectedB + 1
            }
            selectionUseCase.addChoice(for: foodType, isChosen: true)
            if(self.selectedA == 1 && self.selectedB == 1) {
                print("All selected")
                resetSelectedValue()
                getNextQuery()
            }
        }

        func onNo2() {
            if(selectedB == 0) {
                self.selectedB = selectedB + 1
            }
            selectionUseCase.addChoice(for: foodType, isChosen: false)
            if(self.selectedA == 1 && self.selectedB == 1) {
                resetSelectedValue()
                getNextQuery()
            }
        }
        
        func resetSelectedValue() {
            self.selectedA = 0
            self.selectedB = 0
        }

        // MARK: - Private
        private var cancelBag = Set<AnyCancellable>()

        private func getNextQuery() {
            selectionUseCase.getNextQuery().sink { [weak self] type in
                if let type = type {
                    self?.foodType = type
                    self?.query = type.rawValue
                } else {
                    self?.appState.viewRouting = .resultView
                }
            }.store(in: &cancelBag)
        }
    }
}
