//
//  Singleton.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import UIKit

final class Singleton {
    static let shared = Singleton()
    
    // Themes
    let HungerstationBoldFont = UIFont.boldSystemFont(ofSize: 18)
    let HungerstationLightFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
    
    //
    var checkLoggedin : Bool = false
    
    // Remove Navigationbar Bottom Border
    func removeNavigationBarBorder(forView: UIViewController) {
        forView.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        forView.navigationController?.navigationBar.shadowImage = UIImage()
    }
 
    // MARK: Away Driver AlertView
    func handleAwayDriver(title: String, message: String, presentIn: UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
        }

        alertController.addAction(okAction)
        presentIn.present(alertController, animated: true, completion: nil)
    }
    
    // Logout User
    func logoutUser(isLoggedin:Bool, inView: UIViewController, title: String, message: String) {
        if(isLoggedin){
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
                inView.present(LoginViewController(), animated: true, completion: nil)
                self.checkLoggedin = false
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("Cancel")
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            
            
            inView.present(alertController, animated: true, completion: nil)
        }
        else{
            inView.present(LoginViewController(), animated: true, completion: nil)
            self.checkLoggedin = true
        }
    }
    
    
    
}
