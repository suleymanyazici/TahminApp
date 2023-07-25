//
//  Tahmin.swift
//  Tahmin
//
//  Created by Suleyman YAZICI on 21.07.2023.
//

import UIKit

class Tahmin: UIViewController {
    @IBOutlet weak var hakLabel: UILabel!
    @IBOutlet weak var yardımTextLabel: UILabel!
    @IBOutlet weak var tahminTextLabel: UITextField!
    var gelenVeri : Int?
    var randomSayi : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tahmin Et"
        hakLabel.text = "Kalan Hak Sayısı = \(gelenVeri!)"
        randomSayi = Int.random(in: 0...50)
        print("Random sayı : \(randomSayi!)")
        let klavye = UITapGestureRecognizer(target: self, action: #selector(klavyeKapat))
        view.addGestureRecognizer(klavye)
    }
    @IBAction func tahmin(_ sender: Any) {
        self.yardımTextLabel.isHidden = false
        if gelenVeri != 1{
            gelenVeri = gelenVeri! - 1
            hakLabel.text = "Kalan Hak Sayısı = \(gelenVeri!)"
            if let veri = tahminTextLabel.text{
                if let tahmin = Int(veri){
                    if tahmin == randomSayi! {
                        self.alertOlustur(title: "Kazandınız!!!", message: "Tebrikler Kazandınız...")
                    }else if tahmin > randomSayi!{
                        yardımTextLabel.text = "Lütfen daha alçak tahminde bulununuz"
                    }else{
                        yardımTextLabel.text = "Lütfen daha yüksek tahminlerde bulununuz"
                    }
                }
            }
            self.tahminTextLabel.text = nil


        }else{
            self.alertOlustur(title: "Tekrar Deneyin...", message: "Kaybettiniz ama üzülmeyin tekrar deneyebilirsiniz")
        }
        
    }
    
    func alertOlustur(title : String, message : String){
        let allertMessage = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)//Bir alert mesaj pop-up ı oluşturduk
        
        let repeatButton = UIAlertAction(title: "Tekrar Dene...", style: UIAlertAction.Style.default){(_) in
            self.difficultyAllert()
            self.zorlukSecilince()
            self.randomSayi = Int.random(in: 0...50)
            print(self.randomSayi!)


        }//Bu pop-up üzerindeki butonları yapıyoruz
        
        let cancelButton = UIAlertAction(title: "Anasayfaya Dön", style: UIAlertAction.Style.default){(_) in
            self.performSegue(withIdentifier: "toAnasayfaVC", sender: nil )
        }
        allertMessage.addAction(repeatButton)
        allertMessage.addAction(cancelButton)
        self.present(allertMessage, animated: true, completion: nil)
    }
    
    func difficultyAllert(){
        let allertMessage = UIAlertController(title: "Zorluk Seçim Ekranı", message: "Aşağıdaki Zorluklardan Birini Seçiniz.", preferredStyle: UIAlertController.Style.alert)
        
        let easyButton = UIAlertAction(title: "Kolay (8)", style: UIAlertAction.Style.default){(_) in
            self.gelenVeri = 8
            self.hakLabel.text = "Kalan Hak Sayısı = \(self.gelenVeri!)"
        }
        let middleButton = UIAlertAction(title: "Orta (5)" , style: UIAlertAction.Style.default){(_) in
            self.gelenVeri = 5
            self.hakLabel.text = "Kalan Hak Sayısı = \(self.gelenVeri!)"
        }
        let hardButton = UIAlertAction(title: "Zor (3)", style: UIAlertAction.Style.default){(_) in
            self.gelenVeri  = 3
            self.hakLabel.text = "Kalan Hak Sayısı = \(self.gelenVeri!)"
        }
        let cancelButton = UIAlertAction(title: "İptal", style: .default){(_) in
            self.performSegue(withIdentifier: "toAnasayfaVC", sender: nil )

        }
        
        allertMessage.addAction(easyButton)
        allertMessage.addAction(middleButton)
        allertMessage.addAction(hardButton)
        allertMessage.addAction(cancelButton)

        self.present(allertMessage, animated: true, completion: nil)
    }
    func zorlukSecilince() {
        self.hakLabel.text = "Kalan Hak Sayısı = \(gelenVeri!)"
    }
    @IBAction func yardımButton(_ sender: Any) {
        self.yardımTextLabel.isHidden = true
    }
    @objc func klavyeKapat(){
        view.endEditing(true)
    }
}
    

