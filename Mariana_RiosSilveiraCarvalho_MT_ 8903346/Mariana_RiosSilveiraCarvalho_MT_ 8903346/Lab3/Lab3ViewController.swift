//
//  Lab3ViewController.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-02.
//

import UIKit

class Lab3ViewController: UIViewController {

    // MARK: Private Variables
    private var viewModel: Lab3ViewModelProtocol

    // MARK: UI Components
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var ageField: UITextField!

    @IBOutlet weak var informationView: UITextView!

    @IBOutlet weak var messageLabel: UILabel!

    // MARK: Initializer
    required init?(coder: NSCoder) {
        self.viewModel = Lab3ViewModel()
        super.init(coder: coder)
    }

    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: Buttons IBActions
    @IBAction func didTapAdd(_ sender: Any) {
        self.viewModel.didTapAdd()
        self.updateLayout()
    }

    @IBAction func didTapSubmit(_ sender: Any) {
        self.viewModel.didTapSubmit()
        self.messageLabel.text = self.viewModel.message
    }

    @IBAction func clearButton(_ sender: Any) {
        self.clearFields()
        self.viewModel.didTapClear()
        self.updateLayout()
    }

    // MARK: Private Functions
    private func setup() {
        self.setupTextFields()
        self.setupGestures()
        self.updateLayout()
    }

    private func setupTextFields() {
        self.firstNameField.delegate = self
        self.lastNameField.delegate = self
        self.countryField.delegate = self
        self.ageField.delegate = self

        self.firstNameField.addTarget(self, action: #selector(didTextChange(_:)), for: .editingChanged)
        self.lastNameField.addTarget(self, action: #selector(didTextChange(_:)), for: .editingChanged)
        self.countryField.addTarget(self, action: #selector(didTextChange(_:)), for: .editingChanged)
        self.ageField.addTarget(self, action: #selector(didTextChange(_:)), for: .editingChanged)
    }

    private func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    private func clearFields() {
        self.firstNameField.text = ""
        self.lastNameField.text = ""
        self.countryField.text = ""
        self.ageField.text = ""
    }

    private func updateLayout() {
        self.informationView.text = self.viewModel.information
        self.messageLabel.text = self.viewModel.message

    }

    // MARK: @objc Private Functions
    @objc private func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @objc private func didTextChange(_ sender: UITextField) {
        switch (sender.tag) {
        case 0:
            self.viewModel.update(name: sender.text ?? "")
        case 1:
            self.viewModel.update(lastName: sender.text ?? "")
        case 2:
            self.viewModel.update(country: sender.text ?? "")
        case 3:
            self.viewModel.update(age: sender.text ?? "")
        default:
            return
        }
    }
}

// MARK: UITextField Delegates
extension Lab3ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch (textField.tag) {
        case 0...2:
            if let nextResponder = textField.superview!.viewWithTag(textField.tag + 1) as? UITextField {
                nextResponder.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        default:
            textField.endEditing(true)
        }

        return false
    }
}
