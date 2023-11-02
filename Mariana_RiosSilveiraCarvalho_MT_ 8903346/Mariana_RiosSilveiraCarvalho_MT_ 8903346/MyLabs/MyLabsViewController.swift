//
//  MyLabsViewController.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-02.
//

import UIKit

class MyLabsViewController: UIViewController {

    // MARK: - UI Components
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var hobby: UIImageView!

    // MARK: - UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    // MARK: - Private Functions
    private func setup() {
        self.setupProfile()
        self.setupHobby()
    }

    private func setupProfile() {
        self.profile.layer.cornerRadius = 64
    }

    private func setupHobby() {
        self.hobby.layer.cornerRadius = 16
    }
}
