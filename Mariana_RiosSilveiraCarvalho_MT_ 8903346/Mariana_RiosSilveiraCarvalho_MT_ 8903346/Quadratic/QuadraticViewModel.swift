//
//  QuadraticViewModel.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-01.
//

import Foundation

protocol QuadraticViewModelDelegate: AnyObject {
    func showErrorMessage(with message: String)
    func showResult(with title: String, message: String)
}

protocol QuadraticViewModelProtocol: AnyObject {
    var delegate: QuadraticViewModelDelegate? { get set }
    func update(a: String)
    func update(b: String)
    func update(c: String)
    func didTapCalculate()
    func didTapClear()
}

class QuadraticViewModel: QuadraticViewModelProtocol {

    // MARK: - Private Variables
    private var a: Double?
    private var b: Double?
    private var c: Double?

    private var aText: String
    private var bText: String
    private var cText: String

    private var errors: [String]

    // MARK: - Protocol Variables
    weak var delegate: QuadraticViewModelDelegate?

    // MARK: - Initializer
    init() {
        self.aText = ""
        self.bText = ""
        self.cText = ""
        self.errors = []
    }

    // MARK: - Protocol Functions
    func update(a: String) {
        self.aText = a
        self.a = Double(self.aText)
    }

    func update(b: String) {
        self.bText = b
        self.b = Double(self.bText)
    }

    func update(c: String) {
        self.cText = c
        self.c = Double(self.cText)
    }

    func didTapCalculate() {
        self.errors = []
        self.checkFields()
        self.checkValue(text: aText, value: a, errorMessage: "The value you entered for A is invalid.")
        self.checkValue(text: bText, value: b, errorMessage: "The value you entered for B is invalid.")
        self.checkValue(text: cText, value: c, errorMessage: "The value you entered for C is invalid.")
        self.checkErrors()
        self.calculate()
    }

    func didTapClear() {
        self.a = 0
        self.b = 0
        self.c = 0
        self.aText = ""
        self.bText = ""
        self.cText = ""
        self.errors = []
    }

    // MARK: - Private Functions
    private func checkFields() {
        if aText.isEmpty || bText.isEmpty || cText.isEmpty {
            self.errors.append("Enter a value for A, B and C to find X.")
        }
    }

    private func checkValue(text: String, value: Double?, errorMessage: String) {
        if !text.isEmpty, value == nil {
            self.errors.append(errorMessage)
        }
    }

    private func checkErrors() {
        if !errors.isEmpty {
            self.delegate?.showErrorMessage(with: errors.joined(separator: "\n"))
        }
    }

    private func calculate() {
        guard let a = a, let b = b, let c = c else { return }

        let discriminant: Double = pow(b, 2) - (4 * a * c)
        let x1: Double = (-b + sqrt(fabs(discriminant))) / (2 * a)
        let x2: Double = (-b - sqrt(fabs(discriminant))) / (2 * a)

        if discriminant < 0 {
            self.delegate?.showResult(with: "", message: "There are no results since the discriminant is less than zero.")
        } else if discriminant > 0 {
            self.delegate?.showResult(with: "There are two values for X", message: "X = {\(x1.toString()), \(x2.toString())}")
        } else {
            self.delegate?.showResult(with: "There is only one value for X", message: "X = {\(x1.toString())}")
        }
    }
}
