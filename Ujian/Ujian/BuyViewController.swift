//
//  BuyViewController.swift
//  Ujian
//
//  Created by Jesselyn Hartandi on 14/10/20.
//  Copyright © 2020 Jesselyn Hartandi. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {
    
    @IBOutlet weak var novelname: UILabel!
    @IBOutlet weak var novelqty: UILabel!
    @IBOutlet var totalprice: UIView!
    
    var name:String?
    var harga:Int?
    var qty:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        novelname.text = "\(name as! String)"
        
        // Do any additional setup after loading the view.
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
