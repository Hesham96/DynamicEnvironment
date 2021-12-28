//
//  ViewController.swift
//  DynamicEnvironment
//
//  Created by Hesham Aly on 26/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var environmentLabel: UILabel!
    @IBOutlet weak var swapBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("We are " + Urls.type.rawValue + " now.")
    }
    
    @IBAction func swapEnvironmentAction(_ sender: Any) {
        
        let isProduction = WhereAmIRunning.shared.isRunningInAppStoreEnvironment()
        
        if isProduction{
            print("Do Something Live")
        }else{
            self.swapEnvironment()
        }
        
    }
    
    
    
    func swapEnvironment(){
        let alert = UIAlertController(title: "We are " + Urls.type.rawValue + " now." , message: "Swap  your environment Now.", preferredStyle: .actionSheet)
       
        let stagingAction = UIAlertAction(title: "Staging", style: .default, handler: { _ in
            Urls.type = .staging
            UserDefaults.standard.set("staging", forKey: "EnvironmentType")
            self.goToHome()
        })
        
        
        let productionAction = UIAlertAction(title: "Production", style: .default, handler: { _ in
            Urls.type = .live
            UserDefaults.standard.set("live", forKey: "EnvironmentType")
            self.goToHome()
        })
        
        // Add Action Buttons Into Alert
        if Urls.type != .live {
            alert.addAction(productionAction)
        }
        if Urls.type != .staging {
            alert.addAction(stagingAction)
        }
        
        // Add Action Button Into Alert
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        // Present Alert View Controller
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToHome(){
        print("Navigate to home OR UNAUTHENTICATE USER..")
        print("Current BaseURL IS: ",Urls.base)
        environmentLabel.text = "We are " + Urls.type.rawValue + " now."
    }
    
}

