//
//  UserdefualtManager.swift
//  docLink
//
//  Created by Elhussian Mohamed on 27/04/2024.
//

import Foundation
class UserdefualtManager {
    private init (){}
    private static let shardInstance = UserdefualtManager()
    static func shard() -> UserdefualtManager {
        return UserdefualtManager.shardInstance
    }
        func setLoggedIn (_ isLoggedin: Bool){
            let def = UserDefaults.standard
            def.set(isLoggedin, forKey: "isLoggedIn")
        }
    
        func getLoggedIn () -> Bool? {
            let def = UserDefaults.standard
            if let isLoggedIn = def.object(forKey: "isLoggedIn") as? Bool {
                if isLoggedIn {
                    return true
                }
                return false
            }
           return nil
        }
        func saveDoctorData(doctor: Doctor) {
            let encode = JSONEncoder()
            if let encodeDoctor = try? encode.encode(doctor) {
                let def = UserDefaults.standard
                def.set(encodeDoctor, forKey: "UserData")
            }
        }
        func loadDoctorData() -> Doctor? {
            let def = UserDefaults.standard
            if let savedDoctor = def.object(forKey: "UserData") as? Data {
                let decoder = JSONDecoder()
                if let loadDoctor = try? decoder.decode(Doctor.self, from: savedDoctor ) {
                    return loadDoctor
                }
            }
            return nil
        }
}
