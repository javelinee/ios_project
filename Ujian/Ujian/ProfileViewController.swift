//
//  ProfileViewController.swift
//  Ujian
//
//  Created by Jesselyn Hartandi on 13/10/20.
//  Copyright © 2020 Jesselyn Hartandi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userGender: UILabel!
    @IBOutlet weak var userDOB: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    //data dari homepage
    var username:String?
    var dob:String?
    var gender:Int?
    var email:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var jenisKelamin:String?
        
        //cek index gender
        if gender == 0 {
            jenisKelamin = "Male"
        } else if gender == 1 {
            jenisKelamin = "Female"
        }

        userName?.text = "Username : " + username!
        userGender?.text = "Gender : \(jenisKelamin ?? "")"
        userDOB?.text = "Date of Birth : " + dob!
        userEmail?.text = "Email : " + email!
        
        // Do any additional setup after loading the view.
    }

    //balik-home
    @IBAction func buttonBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     */


}
