//
//  ViewController.swift
//  Ujian
//
//  Created by Jesselyn Hartandi on 12/10/20.
//  Copyright © 2020 Jesselyn Hartandi. All rights reserved.
//

//using iphone 8 simulator (?)
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var dateTxt: UITextField!
    @IBOutlet weak var monthTxt: UITextField!
    @IBOutlet weak var yearTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnRegister(_ sender: Any) {
        //nama-email-pw
        var user = usernameTxt.text!
        var email = emailTxt.text!
        var password = passwordTxt.text!
        
        //dob
        var date = dateTxt.text!
        var month = monthTxt.text!
        var year = yearTxt.text!
        
        //validate semua kosong
        if(user.isEmpty && email.isEmpty && password.isEmpty && date.isEmpty && month.isEmpty && year.isEmpty) {
            alertRegister(title: "Error", message: "All field must be filled!")
        }
        
        //validate salah satu kosong
        if(user.isEmpty || email.isEmpty || password.isEmpty || date.isEmpty || month.isEmpty || year.isEmpty) {
            alertRegister(title: "Error", message: "All field must be filled!")
        }
        
        //username
        if(user.count < 3 || user.count > 13) {
            alertRegister(title: "Error", message: "Username length must between 3 and 13")
        }
        
        //email
        if(!email.contains("@") || !email.contains(".com")) {
            alertRegister(title: "Error", message: "Email must contains '@' and '.com'")
        }
        
        //password
        if(password.count < 3 || password.count > 13) {
            alertRegister(title: "Error", message: "Password length must between 3 and 13")
        }
        
        //date
        if(date.count < 1 || date.count > 2) {
            alertRegister(title: "Error", message: "Date must between 1 and 31")
        }
        
        //month
        if(month.count < 1 || month.count > 2) {
            alertRegister(title: "Error", message: "Month must between 1 and 12")
        }
        
        //year
        if(year.count < 1 || year.count > 4) {
            alertRegister(title:"Error", message: "Year cannot detected")
        }
        
        //ke page home
        self.performSegue(withIdentifier: "homeSegue", sender: self)
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //kirim user ke home 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "homeSegue"){
            let home = segue.destination as! HomeViewController
            home.welcomingUser = (usernameTxt?.text)!
            home.email = (emailTxt?.text)!
            home.gender = segmentedControl.selectedSegmentIndex
            home.dob = (yearTxt?.text)! + "-" + (monthTxt?.text)! + "-" + (dateTxt?.text)!
        }
    }
    
    //alert
    func alertRegister(title: String, message: String){
        let alert_controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alert_action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
        alert_controller.addAction(alert_action)
        present(alert_controller, animated: true, completion: nil)
    }
}
