//
//  ValidationManager.swift
//  docLink
//
//  Created by Elhussian Mohamed on 27/04/2024.
//

import Foundation
class ValidationManager{
    private init(){}
    private static let sharedInstance = ValidationManager()
    static func shared() -> ValidationManager {
        return ValidationManager.sharedInstance
    }
    func isValidNationalID (nationalID: String) -> Bool {
        if nationalID.count == 14 {
            return true
        }
        return false
    }
func isValidJobID (jobID: String) -> Bool {
    if jobID.count == 6 {
        return true
    }
    return false
}
}
