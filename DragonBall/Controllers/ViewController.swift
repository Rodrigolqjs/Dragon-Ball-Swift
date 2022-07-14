//
//  ViewController.swift
//  DragonBall
//
//  Created by Rodrigo Latorre on 4/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onLoginTap(_ sender: Any) {
        //Auth
        let model = NetworkModel.shared
//        let user = userTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
          let user = "rodrigo.latorre@outlook.com"
          let password = "rlq12345"
        
        guard !user.isEmpty, !password.isEmpty else {
            return
        }
        
        loginButton.isEnabled = false
        activityIndicator.startAnimating()
        
        model.login(user: user, password: password) { [weak self] token, error in
            DispatchQueue.main.async {
                self?.loginButton.isEnabled = true
                self?.activityIndicator.stopAnimating()
                
                guard let token = token, !token.isEmpty else {
                    return
                }
                
                self?.performSegue(withIdentifier: "AuthSegue", sender: nil)
            }
        }
    }
}

