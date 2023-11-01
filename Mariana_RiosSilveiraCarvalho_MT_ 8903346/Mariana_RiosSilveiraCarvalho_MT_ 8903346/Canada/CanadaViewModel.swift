//
//  CanadaViewModel.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-10-31.
//

import Foundation

protocol CanadaViewModelDelegate: AnyObject {
    func updateImage(_ city: String)
    func showErrorMessage(_ city: String)
}

protocol CanadaViewModelProtocol: AnyObject {
    var delegate: CanadaViewModelDelegate? { get set }
    func update(city: String)
    func didTapFindMyCity()
}

class CanadaViewModel: CanadaViewModelProtocol {

    // MARK: - Private Variables
    private var city: String
    private var cities: [String]

    // MARK: - Protocol Variables
    weak var delegate: CanadaViewModelDelegate?

    // MARK: - Initializer
    init() {
        self.city = ""
        self.cities = ["Calgary", "Halifax", "Montreal", "Toronto", "Vancouver", "Winnipeg"]
    }

    // MARK: - Protocol Functions
    func update(city: String) {
        self.city = city.capitalized.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func didTapFindMyCity() {
        if cities.contains(city) {
            self.delegate?.updateImage(city)
        } else {
            self.delegate?.showErrorMessage(city)
        }
    }
}
