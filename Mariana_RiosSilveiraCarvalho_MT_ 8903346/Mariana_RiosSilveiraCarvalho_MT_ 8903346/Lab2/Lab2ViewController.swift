//
//  Lab2ViewController.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-02.
//

import UIKit

class Lab2ViewController: UIViewController {

    // MARK: Private Variables
    private let viewModel: Lab2ViewModelProtocol = Lab2ViewModel()

    // MARK: UI Components
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!

    // MARK: UIViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateNumberLabel()
    }

    // MARK: IBActions
    @IBAction func decreaseButtonAction(_ sender: Any) {
        self.viewModel.decrease()
        self.updateNumberLabel()
    }

    @IBAction func increaseButtonAction(_ sender: Any) {
        self.viewModel.increase()
        self.updateNumberLabel()
    }

    @IBAction func resetButtonAction(_ sender: Any) {
        self.viewModel.reset()
        self.updateNumberLabel()
    }

    @IBAction func stepButtonAction(_ sender: Any) {
        self.viewModel.step()
        self.updateNumberLabel()
    }

    // MARK: Private Functions
    private func updateNumberLabel() {
        self.numberLabel.text = "\(self.viewModel.number())"
    }
}
