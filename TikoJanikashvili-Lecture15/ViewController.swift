//
//  ViewController.swift
//  TikoJanikashvili-Lecture15
//
//  Created by Tiko Janikashvili on 30.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    private var logInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log In"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 30)
        return label
    }()
    
    private var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemPurple.cgColor
        button.layer.cornerRadius = 7
        button.setTitle("Log In", for: .normal)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        view.addSubview(logInLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(logInButton)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        addTapGesture()
    }
    
    // MARK: - Functions
    @objc private func onLogIn() {
        if usernameTextField.text == "Tiko" && passwordTextField.text == "123" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController {
                vc.name = "\(usernameTextField.text ?? "")"
                present(vc, animated: true)
            }
        } else {
            alert()
        }
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onLogIn))
        tapGesture.numberOfTapsRequired = 2
        logInButton.addGestureRecognizer(tapGesture)
    }
    
    private func alert() {
        let alert = UIAlertController(title: "შეცდომა", message: "გთხოვთ შეიყვანოთ სწორი მონაცემები", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: " დახურვა", style: .cancel))
        present(alert, animated: true)
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            logInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            logInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            logInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logInLabel.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logInLabel.bottomAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            usernameTextField.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logInButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

