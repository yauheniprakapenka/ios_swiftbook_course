//
//  UserInfoViewController.swift
//  NewProject
//
//  Created by yauheni prakapenka on 01.03.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet var avatarImageVIew: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var followerLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchImage()
        usernameLabel.text = user.login
        followerLabel.text = "\(user.followers) followers"
    }
    
    private func fetchImage() {
        guard let url = URL(string: user.avatarUrl) else {
            activityIndicator.stopAnimating()
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let self = self else { return }
            
            if let error = error {
                self.activityIndicator.stopAnimating()
                print(error)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.avatarImageVIew.image = image
                    self.activityIndicator.stopAnimating()
                }
            }
        }.resume()
    }
}
