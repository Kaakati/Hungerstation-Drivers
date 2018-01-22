//
//  LoginViewControler+Extension.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setupViews() {
        view.backgroundColor = UIColor.Hungerstation.Yellow.Light
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func dismissLoginView() {
        self.dismiss(animated: true) {
            Singleton.shared.checkLoggedin = true
        }
    }
}
