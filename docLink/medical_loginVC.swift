//
//  medical_loginVC.swift
//  docLink
//
//  Created by Elhussian Mohamed on 25/04/2024.
//

import UIKit

class medical_loginVC: UIViewController {

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var txtNationalID: UITextField!
    @IBOutlet weak var txtJobID: UITextField!
    @IBOutlet weak var lblNotHave: UILabel!
    var doctor: Doctor!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserdefualtManager.shard().setLoggedIn(false)
        if let doctor = UserdefualtManager.shard().loadDoctorData(){
            self.doctor = doctor
        } else {
            showAlert(titel:"Sorry", message: "Something is wrong ")
        }

        // Do any additional setup after loading the view.
    }
        func validateCredentials () -> Bool{
            if let nationalID = txtNationalID.text , !nationalID.trim.isEmpty , nationalID == self.doctor.nationalID , let jobID = txtJobID.text , !jobID.trim.isEmpty, jobID == self.doctor.jobID {
                return true
    
            }
              showAlert(titel: "Sorry", message: "please enter valid credentials!")
                    return false
        }
    func goToNextScreen(){
      let st = UIStoryboard(name: "Main" , bundle: nil)
      let TransformVC = st.instantiateViewController(withIdentifier: "TransformVC") as! TransformVC
        TransformVC.modalPresentationStyle = .fullScreen
      self.present(TransformVC , animated: true)
    }

    @IBAction func btnLogin(_ sender: Any) {
        if validateCredentials() {
             goToNextScreen()
        } else {
            showAlert(titel: "Sorry", message: "please enter valid credentials!")
        }
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        
    }
    

}
