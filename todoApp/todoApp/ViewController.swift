//
//  ViewController.swift
//  todoApp
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import UIKit
import Eureka
import Alamofire
import SwiftyJSON

class ViewController: FormViewController {
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the login form
        form +++ Section()
        form +++ Section()
        form +++ Section()
            <<< EmailRow() { row in
                row.placeholder = "E-mail"
                row.tag = "email"
        }
        form +++ Section()
            <<< PasswordRow {
                $0.placeholder = "Password"
                $0.tag = "password"
        }
        form +++ Section()
            <<< ButtonRow() { row in
                row.title = "Login"
                row.onCellSelection({ (_, _) in
                    let emailRow: EmailRow? = self.form.rowBy(tag: "email")
                    let email = emailRow!.value!
                    
                    let passwordRow: PasswordRow? = self.form.rowBy(tag: "password")
                    let password = passwordRow!.value!
                    
                    self.performLogin(email, password)
                })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func performLogin(_ email: String, _ password: String) {
        print(email)
        print(password)
        var parameters: Parameters = ["grant_type": "password"]
        parameters["client_id"] = "BdSdpV7le9YoYrk7lL2DC9TNtOAK3nx3Al9Wwi4Q"
        parameters["client_secret"] = "Itgh1jK1BpZEP4FOHRBFvRNgMRb5VD3WzFv7UdkRppRW3hpnSlKYgX9syW2rAf3KCObBo58LMG8Gtc1K1B37eJz8iolGrcnWUZuyWHv3PHMn4frZXvYu4YcSXlYSOY6a"
        parameters["username"] = email
        parameters["password"] = password
        
        Alamofire.request("http://localhost:8000/api/oauth/token/", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
                let jsonObject = JSON(json)
                let accessToken = jsonObject["access_token"].stringValue
                let refreshToken = jsonObject["refresh_token"].stringValue
                self.defaults.set(accessToken, forKey: "accessToken")
                self.defaults.set(refreshToken, forKey: "refreshToken")
                self.performSegue(withIdentifier: "mainSegue", sender: nil)
            }
        }
    }
    
}

