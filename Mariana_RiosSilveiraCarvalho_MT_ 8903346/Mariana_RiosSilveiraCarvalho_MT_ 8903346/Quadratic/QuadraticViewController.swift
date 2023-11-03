//
//  QuadraticViewController.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-01.
//

import UIKit

class QuadraticViewController: UIViewController {

    // MARK: - Private Variables
    private let viewModel: QuadraticViewModelProtocol

    // MARK: - UI Components
    @IBOutlet weak var aValueTextField: UITextField!
    @IBOutlet weak var bValueTextField: UITextField!
    @IBOutlet weak var cValueTextField: UITextField!

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var calculatedValue: UILabel!

    // MARK: - Initializer
    required init?(coder: NSCoder) {
        self.viewModel = QuadraticViewModel()
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
        self.setupLabels()
        self.setupTextFields()
        self.setupGestures()
    }

    private func setupViewModel() {
        self.viewModel.delegate = self
    }

    private func setupLabels() {
        self.message.text = ""
        self.calculatedValue.text = ""
    }

    private func setupTextFields() {
        self.aValueTextField.delegate = self
        self.bValueTextField.delegate = self
        self.cValueTextField.delegate = self

        self.aValueTextField.addTarget(self, action: #selector(didATextChange(_:)), for: .editingChanged)
        self.bValueTextField.addTarget(self, action: #selector(didBTextChange(_:)), for: .editingChanged)
        self.cValueTextField.addTarget(self, action: #selector(didCTextChange(_:)), for: .editingChanged)
    }

    private func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    // MARK: - @objc Private Functions
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc private func didATextChange(_ sender: UITextField) {
        self.viewModel.update(a: sender.text ?? "")
    }

    @objc private func didBTextChange(_ sender: UITextField) {
        self.viewModel.update(b: sender.text ?? "")
    }

    @objc private func didCTextChange(_ sender: UITextField) {
        self.viewModel.update(c: sender.text ?? "")
    }

    // MARK: - IBActions Functions
    @IBAction func didTapCalculate(_ sender: UIButton) {
        self.viewModel.didTapCalculate()
    }
    
    @IBAction func didTapClear(_ sender: UIButton) {
        self.aValueTextField.text = ""
        self.bValueTextField.text = ""
        self.cValueTextField.text = ""

        self.aValueTextField.resignFirstResponder()
        self.bValueTextField.resignFirstResponder()
        self.cValueTextField.resignFirstResponder()

        self.viewModel.didTapClear()

        self.loadViewIfNeeded()
    }
}

// MARK: - UITextField Delegate
extension QuadraticViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.endEditing(true)
        return false
    }
}

// MARK: - QuadraticViewModel Delegate
extension QuadraticViewController: QuadraticViewModelDelegate {
    func showErrorMessage(with message: String) {
        self.message.text = message
        self.calculatedValue.text = ""
    }

    func showResult(with title: String, message: String) {
        self.message.text = ""
        self.calculatedValue.text = "\(title)\n\(message)"
    }
}
