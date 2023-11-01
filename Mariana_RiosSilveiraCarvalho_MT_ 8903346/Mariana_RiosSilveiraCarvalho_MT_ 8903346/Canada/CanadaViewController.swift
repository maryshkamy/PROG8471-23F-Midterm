//
//  CanadaViewController.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-10-30.
//

import UIKit

class CanadaViewController: UIViewController {

    // MARK: - Private Variables
    private let viewModel: CanadaViewModelProtocol

    // MARK: - UI Components
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityTextField: UITextField!

    // MARK: - Initializer
    required init?(coder: NSCoder) {
        self.viewModel = CanadaViewModel()
        super.init(coder: coder)
    }

    // MARK: - UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Private Functions
    private func setup() {
        self.setupViewModel()
        self.setupTextField()
        self.setupGestures()
    }

    private func setupViewModel() {
        self.viewModel.delegate = self
    }

    private func setupTextField() {
        self.cityTextField.delegate = self
        self.cityTextField.addTarget(self, action: #selector(didTextChange(_:)), for: .editingChanged)
    }

    private func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    // MARK: - @objc Private Functions
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc private func didTextChange(_ sender: UITextField) {
        self.viewModel.update(city: sender.text ?? "")
    }

    // MARK: - IBActions Functions
    @IBAction func didTapFindMyCity(_ sender: UIButton) {
        self.viewModel.didTapFindMyCity()
        self.cityTextField.resignFirstResponder()
    }
}

// MARK: - UITextField Delegates
extension CanadaViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.endEditing(true)
        return false
    }
}

// MARK: - CanadaViewModel Delegates
extension CanadaViewController: CanadaViewModelDelegate {
    func updateImage(_ city: String) {
        if let image = UIImage(named: city) {
            self.cityImageView.image = image
        } else {
            self.cityImageView.image = UIImage(named: "Canada")
        }

        self.loadViewIfNeeded()
    }

    func showErrorMessage(_ city: String) {
        let alert = UIAlertController(title: "Error", message: "\(city) not found.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
