//
//  NovelViewController.swift
//  Ujian
//
//  Created by Jesselyn Hartandi on 13/10/20.
//  Copyright © 2020 Jesselyn Hartandi. All rights reserved.
//

import UIKit

class NovelViewController: UIViewController {
    
    @IBOutlet weak var novelThumbnail: UIImageView!
    @IBOutlet weak var namaTxt: UILabel!
    @IBOutlet weak var hargaTxt: UILabel!
    @IBOutlet weak var qtyTxt: UILabel!
    
    //tampungan novel
    var image:String?
    var name:String?
    var harga:Int?
    var qty:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //nampilin di viewcontroller
        novelThumbnail.image = UIImage(named: image as! String)
        namaTxt.text = "\(name as! String)"
        hargaTxt.text = "\(harga as! Int)"
        qtyTxt.text = "\(qty as! Int)"

        // Do any additional setup after loading the view.
    }
    
    //steppernya "+/-"
    @IBAction func stepperQty(_ sender: UIStepper) {
        qtyTxt.text = Int(sender.value).description
    }
}
