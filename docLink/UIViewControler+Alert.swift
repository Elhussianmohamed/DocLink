//
//  UIViewControler+Alert.swift
//  docLink
//
//  Created by Elhussian Mohamed on 27/04/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(titel: String , message: String){
        let alert = UIAlertController(title: titel, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"ok" , style: .default))
            self.present(alert, animated: true)
    }
}
