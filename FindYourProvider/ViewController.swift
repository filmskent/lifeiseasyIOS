//
//  ViewController.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let ticket = defaults.string(forKey: "ticket")
        print("\(String(describing: ticket))");
        if(ticket != nil){
            print("not nil")
//            performSegue(withIdentifier: "loginSegue", sender: nil)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let newViewController = storyBoard.instantiateViewController(withIdentifier: "main") as! HomeTabBarController
//            self.present(newViewController, animated: true, completion: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "main")
            self.navigationController?.pushViewController(newViewController, animated: true)
            
        }
        else{
            print("no ticket")
        }
    }
    
    
    @IBAction func loginSSO(_ sender: Any) {
        let url = URL(string: "https://account.it.chula.ac.th/login?service=jj%3A%2F%2Flogin.sso");
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    

}

