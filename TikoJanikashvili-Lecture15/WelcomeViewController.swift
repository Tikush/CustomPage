//
//  WelcomeViewController.swift
//  TikoJanikashvili-Lecture15
//
//  Created by Tiko Janikashvili on 01.12.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    var name: String?
    
    // MARK: - IBOutlets
    private var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 24)
        label.textColor = .white
        return label
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(textLabel)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        textLabel.text = name ?? " "
    }
    
    // MARK: - Functions
    private func setupLayout() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
