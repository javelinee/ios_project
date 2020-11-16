//
//  BuyProductViewController.swift
//  Ujian
//
//  Created by Jesselyn Hartandi on 13/10/20.
//  Copyright © 2020 Jesselyn Hartandi. All rights reserved.
//

import UIKit

class BuyProductViewController: UIViewController {
    
    var novel = [Novel]()
    
    //footer
    @IBOutlet weak var novelTotalQty: UILabel!
    @IBOutlet weak var novelAllPrices: UILabel!
    
    //label novel pertama
    @IBOutlet weak var novelPertama: UILabel!
    @IBOutlet weak var qtyNovelpertama: UILabel!
    @IBOutlet weak var totalNovelPertama: UILabel!
    
    //label novel kedua
    @IBOutlet weak var novelKedua: UILabel!
    @IBOutlet weak var qtyNovelkedua: UILabel!
    @IBOutlet weak var totalNovelkedua: UILabel!
    
    //label novel ketiga
    @IBOutlet weak var novelKetiga: UILabel!
    @IBOutlet weak var qtyNovelketiga: UILabel!
    @IBOutlet weak var totalNovelketiga: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //novelPertama
        novelPertama.text = novel[0].name
        qtyNovelpertama.text = "\(novel[0].qty)x"
        totalNovelPertama.text = "\(novel[0].qty * novel[0].harga)"
        
        //novelKedua
        novelKedua.text = novel[1].name
        qtyNovelkedua.text = "\(novel[1].qty)x"
        totalNovelkedua.text = "\(novel[1].qty * novel[1].harga)"
        
        //novelKetiga
        novelKetiga.text = novel[2].name
        qtyNovelketiga.text = "\(novel[2].qty)x"
        totalNovelketiga.text = "\(novel[2].qty * novel[2].harga)"
        
        //footer
        novelTotalQty.text = "Total \(novel[0].qty + novel[1].qty + novel[2].qty) item(s)"
        novelAllPrices.text = "\((novel[0].qty * novel[0].harga) + (novel[1].qty * novel[1].harga) + (novel[2].qty * novel[2].harga))"
        
        // Do any additional setup after loading the view.
    }
    
    //klik-alert pas kelar
    @IBAction func btnCheckout(_ sender: Any) {
        buyAlert(title: "Success Buy", message: "Thankyou for purchasing our item(s)! Your total is Rp. \(novelAllPrices.text ?? "0")")
    }
    
    //alert
    func buyAlert(title: String, message: String){
        let alert_controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alert_action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        
        alert_controller.addAction(alert_action)
        present(alert_controller, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
     */
}
