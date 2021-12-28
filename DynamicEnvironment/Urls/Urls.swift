//
//  Urls.swift
//  DynamicEnvironment
//
//  Created by Hesham Aly on 26/12/2021.
//

import Foundation

enum Environment: String {
    case live
    case staging
}

public enum Urls {
    
    static var type: Environment {
        get {
            return WhereAmIRunning.shared.isRunningInAppStoreEnvironment()
                ? .live
                : Environment(rawValue: UserDefaults.standard.string(forKey: "EnvironmentType") ?? "live") ?? .live
        }
        set {}
    }
        
    //MARK: live
    private static var baseLive:String { "https://iamLive.com/" }
    
    //MARK: Staging
    private static var baseStage:String { "https://iamStaging.com/" }

    
    /*private*/ static var base: String {
        switch type {
        case .live:
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
