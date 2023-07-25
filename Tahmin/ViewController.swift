//
//  ViewController.swift
//  Tahmin
//
//  Created by Suleyman YAZICI on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ANASAYFA"
    }

    @IBAction func tahminEtButton(_ sender: Any) {
        let allertMessage = UIAlertController(title: "Zorluk Seçimi", message: "Listelenen Zorluklardan Birini Seçiniz", preferredStyle: UIAlertController.Style.alert)//Bir alert mesaj pop-up ı oluşturduk
        
        let easyButton = UIAlertAction(title: "Kolay (8)", style: UIAlertAction.Style.default){(_) in
            self.performSegue(withIdentifier: "toTahminVC", sender: 8 )

        }
        let middleButton = UIAlertAction(title: "Orta (5)" , style: UIAlertAction.Style.default){(_) in
            self.performSegue(withIdentifier: "toTahminVC" , sender: 5 )
        }
        let hardButton = UIAlertAction(title: "Zor (3)", style: UIAlertAction.Style.default){(_) in
            self.performSegue(withIdentifier: "toTahminVC", sender: 3 )
            }
        let cancelButton = UIAlertAction(title: "İptal", style: .cancel, handler: nil)

        allertMessage.addAction(cancelButton)
        allertMessage.addAction(easyButton)
        allertMessage.addAction(middleButton)
        allertMessage.addAction(hardButton)
        self.present(allertMessage, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTahminVC"{
            if let difficulty = sender as? Int{
                if let destinayionVC = segue.destination as? Tahmin{
                    destinayionVC.gelenVeri = difficulty
                }
            }
        }
    }
}

