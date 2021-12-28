//
//  UIDevice+Extenstion.swift
//  DynamicEnvironment
//
//  Created by Hesham Aly on 28/12/2021.
//

import Foundation
import UIKit

extension UIDevice {
    var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
    //Ref: https://stackoverflow.com/questions/49194968/detect-jailbroken-in-ios-11-or-later/49195580#49195580
    static var isJailBroken: Bool {
        get {
            if UIDevice.current.isSimulator { return false }
            if JailBrokenHelper.hasCydiaInstalled() { return true }
            if JailBrokenHelper.isContainsSuspiciousApps() { return true }
            if JailBrokenHelper.isSuspiciousSystemPathsExists() { return true }
            return JailBrokenHelper.canEditSystemFiles()
        }
    }
}
