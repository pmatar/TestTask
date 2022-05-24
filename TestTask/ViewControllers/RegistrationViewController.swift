//
//  RegistrationViewController.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passConfirmTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint

        
    }
    
    
    private func saveButtonPressed(){
        guard !nameTF.isEmpty, !emailTF.isEmpty, !passwordTF.isEmpty, !passConfirmTF.isEmpty else {
            showAlert(title: "Not all fields are filled", message: "Please fill all fields")
            return
        }
        
        guard let email = emailTF.text, email.isValid(.email) else {
            showAlert(title: "Not valid email format", message: "Please fill the existing email")
            return
        }
        
        guard let password = passwordTF.text, password.isValid(.password) else {
            showAlert(title: "Wrong password format", message: " Password should be at least 7 characters with 1 capital letter, one number, and one special characte")
            return
        }
        
        guard passwordTF.text == passConfirmTF.text else {
            showAlert(title: "Passwords do not match", message: "Please confirm your password")
            return
        }
        
        showAlert(title: "Registered", message: "You are registered", completion: dismissWithAlert(alert:))
//        dismiss(animated: true)
        print("pressed")
    }
    
    func dismissWithAlert(alert: UIAlertAction) {
        dismiss(animated: true)
    }
    
    private func showAlert(title: String, message: String, completion: ((UIAlertAction)->Void)?=nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .cancel)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: completion)
        alert.addAction(action)
        present(alert, animated: true)
    }
}


    // MARK: - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTF:
            emailTF.becomeFirstResponder()
        case emailTF:
            passwordTF.becomeFirstResponder()
        case passwordTF:
            passConfirmTF.becomeFirstResponder()
        default:
            saveButtonPressed()
        }
        return true
    }
}


