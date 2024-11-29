//
//  PersonViewController.swift
//  contactlist
//
//  Created by Тахмина on 28/11/2024.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var namelabel: UILabel!
    
    @IBOutlet weak var surnamelabel: UILabel!
    
    @IBOutlet weak var phonelabel: UILabel!
    
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var surnametextfield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    
    var person = Person(name: "", surname: "", phone: "")
    
    var index = 0
    
    var arrayPerson: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nametextfield.text = person.name
        surnametextfield.text = person.surname
        phonetextfield.text = person.phone
    }
    @IBAction func editContact(_ sender: Any) {
        let newPerson = Person(name: nametextfield.text!, surname: surnametextfield.text!, phone: phonetextfield.text!)
        arrayPerson[index] = newPerson
        
        do {
            let encodedata = try JSONEncoder().encode(arrayPerson)
            UserDefaults.standard.set(encodedata,forKey: "Person")
            
        } catch {
            print("unuble to encode\(error)")
        }
        nametextfield.text = ""
        surnametextfield.text = ""
        phonetextfield.text = ""
    }
    
}
