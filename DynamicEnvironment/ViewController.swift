//
//  ViewController.swift
//  DynamicEnvironment
//
//  Created by Hesham Aly on 26/12/2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var environmentLabel: UILabel!
    @IBOutlet weak var swapBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleJailBroken()
        print("We are " + Urls.type.rawValue + " now.")
    }
    
    func handleJailBroken(){
        if UIDevice.isJailBroken{
            let blockerView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 1000, height: 1000)))
            blockerView.backgroundColor = .black
            self.view.addSubview(blockerView)
        }
    }
    
    @IBAction func swapEnvironmentAction(_ sender: Any) {
        
        let isProduction = WhereAmIRunning.shared.isRunningInAppStoreEnvironment()
        
        if isProduction{
            print("Do Something on Production")
        }else{
            let isJailBroken = UIDevice.isJailBroken
            if !isJailBroken{
                self.swapEnvironment()
            }
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
            Urls.type = .production
            UserDefaults.standard.set("production", forKey: "EnvironmentType")
            self.goToHome()
        })
        
        // Add Action Buttons Into Alert
        alert.addAction(Urls.type == .production ? stagingAction : productionAction)
        
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

