//
//  HomeViewController.swift
//  Ujian
//
//  Created by Jesselyn Hartandi on 13/10/20.
//  Copyright © 2020 Jesselyn Hartandi. All rights reserved.
///Users/jesselyn/Desktop/Ujian/Ujian/BuyProductViewController.swift

import UIKit

class HomeViewController: UIViewController {
    
    var novelList = [Novel]()
    
    //view controller buat qty
    var objectPertama:NovelViewController?
    var objectKedua:NovelViewController?
    var objectKetiga:NovelViewController?
    
    @IBOutlet weak var greetings: UILabel!
    
    //tampungan data dari register
    var welcomingUser:String?
    var dob:String?
    var gender:Int?
    var email:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //label welcome
        greetings?.text = "Welcome, " + welcomingUser!
        // Do any additional setup after loading the view.
    }
    
    //isi novel-nya
    func NovelList() {
        novelList.append(Novel(name: "Tokyo", image: "ilanaTan", harga: 15000, qty: 0))
        novelList.append(Novel(name: "Pancreas", image: "pancreas", harga: 50000, qty: 0))
        novelList.append(Novel(name: "Hujan", image: "hujan", harga: 30000, qty: 0))
    }
    
    //button-buy
    @IBAction func buyButton(_ sender: Any) {
        novelList[0].qty = Int((objectPertama?.qtyTxt.text)!)!
        novelList[1].qty = Int((objectKedua?.qtyTxt.text)!)!
        novelList[2].qty = Int((objectKetiga?.qtyTxt.text)!)!
        
        //mesti beli 1 item
        if novelList[0].qty == 0 ||  novelList[1].qty == 0 || novelList[2].qty == 0 {
            let alert = UIAlertController(title: "Error", message: "Item must be bought at least 1 novel", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
        } else {
            //pindah ke buy
            performSegue(withIdentifier: "buySegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? NovelViewController
        
        //tampilan container-view novel
        NovelList()
        if segue.identifier == "novelPertama" {
            objectPertama = destination
            destination?.image = novelList[0].image
            destination?.name = novelList[0].name
            destination?.harga = novelList[0].harga
            destination?.qty = novelList[0].qty
        } else if segue.identifier == "novelKedua" {
            objectKedua = destination
            destination?.image = novelList[1].image
            destination?.name = novelList[1].name
            destination?.harga = novelList[1].harga
            destination?.qty = novelList[1].qty
        } else if segue.identifier == "novelKetiga" {
            objectKetiga = destination
            destination?.image = novelList[2].image
            destination?.name = novelList[2].name
            destination?.harga = novelList[2].harga
            destination?.qty = novelList[2].qty
        } else if segue.identifier == "profileSegue" {
            //parsing ke profile
            let profile = segue.destination as! ProfileViewController
            profile.username = welcomingUser!
            profile.email = email!
            profile.dob = dob!
            profile.gender = gender
        } else if segue.identifier == "buySegue" {
            //parsing ke buy
            let buy = segue.destination as! BuyProductViewController
            buy.novel = novelList
        }
    }
    
    //keluar dr home
    @IBAction func logoutBtn(_ sender: Any) {
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
