//
//  MainViewController.swift
//  NewProject
//
//  Created by yauheni prakapenka on 01.03.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var currentUser: User!
    private var currentError: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        guard let text = usernameTextField.text, !text.isEmpty else {
            currentError = HomeWorkError.enterUsername.rawValue
            performSegue(withIdentifier: StoryboardSegue.alertVC.rawValue, sender: nil)
            return
        }
        
        activityIndicator.startAnimating()
        
        NetworkManager.shared.getFollowers(user: usernameTextField.text!) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                print("this is \(user)")
                self.currentUser = user
                
                DispatchQueue.main.sync {
                    self.performSegue(withIdentifier: StoryboardSegue.userInfo.rawValue, sender: nil)
                    self.activityIndicator.stopAnimating()
                    self.usernameTextField.text = nil
                }
                
            case .failure(let error):
                print(error.rawValue)
                self.currentError = error.rawValue
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: StoryboardSegue.alertVC.rawValue, sender: nil)
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case StoryboardSegue.userInfo.rawValue:
            let userInfoVC = segue.destination as! UserInfoViewController
            userInfoVC.user = currentUser
        case StoryboardSegue.alertVC.rawValue:
            let alertVC = segue.destination as! AlertViewController
            alertVC.currentError = currentError
        default:
            break
        }
    }
}
