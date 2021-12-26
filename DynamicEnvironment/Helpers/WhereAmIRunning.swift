//
//  WhereAmIRunning.swift
//  DynamicEnvironment
//
//  Created by Hesham Aly on 26/12/2021.
//


import Foundation

@objcMembers
class WhereAmIRunning:NSObject {
    
    // MARK: Public
    
    public static let shared = WhereAmIRunning()
    @objc
    func isRunningInTestFlightEnvironment() -> Bool{
        if isSimulator() {
            return false
        } else {
            if isAppStoreReceiptSandbox() && !hasEmbeddedMobileProvision() {
                return true
            } else {
                return false
            }
        }
    }
    @objc
    func isRunningInAppStoreEnvironment() -> Bool {
        if isSimulator(){
            return false
        } else {
            if isAppStoreReceiptSandbox() || hasEmbeddedMobileProvision() {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: Private
    
    private func hasEmbeddedMobileProvision() -> Bool{
        if let _ = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") {
            return true
        }
        return false
    }
    
    private func isAppStoreReceiptSandbox() -> Bool {
        if isSimulator() {
            return false
        } else {
            if let appStoreReceiptURL = Bundle.main.appStoreReceiptURL,
                appStoreReceiptURL.lastPathComponent == "sandboxReceipt" {
                return true
            }
            return false
        }
    }
    
    
    private func isSimulator() -> Bool {
        #if arch(i386) || arch(x86_64)
        return true
        #else
        return false
        #endif
    }
    
}
