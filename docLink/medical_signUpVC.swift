//
//  medical_signUpVC.swift
//  docLink
//
//  Created by Elhussian Mohamed on 25/04/2024.
//

import UIKit

class medical_signUpVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtNationalID: UITextField!
    @IBOutlet weak var txtJobID: UITextField!
    @IBOutlet weak var lblHaveAccount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        txtNationalID.delegate = self
        txtJobID.delegate = self
        view.endEditing (true)
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == txtUsername {
        txtUsername.becomeFirstResponder()
        }else{
            
        }
        return true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing (true)
    }
        func isValidNationalID(nationalID: String) -> Bool {
            if !nationalID.trim.isEmpty {
                if !ValidationManager.shared().isValidNationalID(nationalID: nationalID) {
                     showAlert(titel: "Sorry", message: "The nationalID is required ")
                    return false
                }
                return true
            } else {
                showAlert(titel: "Sorry", message: "The nationalID should be contains 14 charachters ")
                return false
            }
        }
        func isValidJobID(jobID: String) -> Bool {
            if !jobID.trim.isEmpty {
                if !ValidationManager.shared().isValidJobID (jobID: jobID) {
                     showAlert(titel: "Sorry", message: "The JobID is required ")
                    return false
                }
                return true
            } else {
                showAlert(titel: "Sorry", message: "The JobID should be contains 6 charachters ")
                return false
            }
        }
       
        func validateFields() -> Bool {
            if let nationalID = txtNationalID.text , isValidNationalID(nationalID: nationalID),
               let jobID = txtJobID.text ,isValidJobID(jobID: jobID) {
                return true
            }
            return false
        }
        func goToLoginScreen(){
          let st = UIStoryboard(name: "Main" , bundle: nil)
          let medical_loginVC = st.instantiateViewController(withIdentifier: "medical_loginVC") as! medical_loginVC
          medical_loginVC.modalPresentationStyle = .fullScreen
          self.present(medical_loginVC , animated: true)
        }

    @IBAction func btnSignUp(_ sender: Any) {
      
        if validateFields() {
            guard let nationalID = txtNationalID.text , let jobID =                txtJobID.text  else {return}
            let doctor = Doctor (nationalID: nationalID, jobID: jobID)
            UserdefualtManager.shard().saveDoctorData(doctor: doctor)
        }
        goToLoginScreen()
    }
    @IBAction func btnLogin(_ sender: Any) {
        goToLoginScreen()
    }
}
