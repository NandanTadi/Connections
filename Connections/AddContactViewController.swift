//
//  AddContactViewController.swift
//  Connections
//
//  Created by Nandan Tadi on 3/29/21.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var addContactDelegate: ContactDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func validateEntries() -> Bool{
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return false
        }
        return true
    }
    @IBAction func didTapAddContactButton(_ sender: Any) {
        if(!validateEntries()){
            return
        }
        let name = (nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let phone = (phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let email = (emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        let profileImage = profileImageView.image!
        
        let newContact = Contact(name: name, phone: phone, email: email, image: profileImage)
        
        addContactDelegate!.addNewContact(contact: newContact)
        self.dismiss(animated: true, completion: nil)
    }
}
