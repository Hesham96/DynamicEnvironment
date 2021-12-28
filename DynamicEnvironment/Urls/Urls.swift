//
//  Urls.swift
//  DynamicEnvironment
//
//  Created by Hesham Aly on 26/12/2021.
//

import Foundation

enum Environment: String {
    case production
    case staging
}

public enum Urls {
    
    static var type: Environment {
        get {
            return WhereAmIRunning.shared.isRunningInAppStoreEnvironment()
                ? .production
                : Environment(rawValue: UserDefaults.standard.string(forKey: "EnvironmentType") ?? "production") ?? .production
        }
        set {}
    }
        
    //MARK: live
    private static var baseLive:String { "https://iamProduction.com/" }
    
    //MARK: Staging
    private static var baseStage:String { "https://iamStaging.com/" }

    
    /*private*/ static var base: String {
        switch type {
        case .production:
            return baseLive
        case .staging:
            return baseStage
        }
    }
    
    
    //MARK: Api base link
    private static var api: String {
        return  base + "api/"
    }
    
    //MARK:- Auth Requests
    static var signup: String {
        return api + "register"
    }
    
}
