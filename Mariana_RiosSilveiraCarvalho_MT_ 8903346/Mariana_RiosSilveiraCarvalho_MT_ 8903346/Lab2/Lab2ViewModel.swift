//
//  Lab2ViewModel.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-02.
//

import Foundation

protocol Lab2ViewModelProtocol {
    func number() -> Int
    func decrease()
    func increase()
    func reset()
    func step()
}

class Lab2ViewModel: Lab2ViewModelProtocol {
    // MARK: Private Variables
    private var counter: Int
    private var stepValue: Int

    // MARK: Initializer
    init() {
        self.counter = 0
        self.stepValue = 1
    }

    // MARK: Actions Functions
    func number() -> Int {
        return self.counter
    }

    func decrease() {
        self.counter -= self.stepValue
    }

    func increase() {
        self.counter += self.stepValue
    }

    func reset() {
        self.counter = 0
        self.stepValue = 1
    }

    func step() {
        self.stepValue = 2
    }
}
