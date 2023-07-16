//
//  AddUserViewController.swift
//  RandomUser
//
//  Created by David Granger on 7/14/23.
//

import UIKit

class AddUserViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "addUser" else {return}
        
        let user = newUser(name: nameTF.text ?? "", uuid: UUID())
        UserManager.shared.createUser(user)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        return true
    }
    
}
