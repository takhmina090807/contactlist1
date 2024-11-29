//
//  ViewController.swift
//  contactlist
//
//  Created by Тахмина on 28/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var namelabel: UILabel!
    
    
    @IBOutlet weak var surnamelabel: UILabel!
    
    
    @IBOutlet weak var phonelabel: UILabel!
    
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var surnametextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addContact(_ sender: Any) {
        let person = Person(name: nametextfield.text!, surname: surnametextfield.text!, phone: phonetextfield.text!)
        
        do {
            
            if let data = UserDefaults.standard.data(forKey: "Person") {
                var array = try JSONDecoder().decode([Person].self, from: data)
                array.append(person)
                let encodedata = try JSONEncoder().encode(array)
                
                UserDefaults.standard.set(encodedata, forKey: "Person")
            } else {
                let encodedate = try JSONEncoder().encode([person])
                UserDefaults.standard.set(encodedate, forKey:"Person")
            }
            
        } catch {
            print("unuble to encode\(error)")
        }
        nametextfield.text = ""
        surnametextfield.text = ""
        phonetextfield.text = ""
        
    }
    
}
