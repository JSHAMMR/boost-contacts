//
//  DetailsViewController.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit
import RealmSwift
import SkyFloatingLabelTextField
enum InteractorError: Error {
    case failedToLoadID
    
}
protocol IDetailsViewController: class {
	var router: IDetailsRouter? { get set }
}

class DetailsViewController: UIViewController {
	var interactor: IDetailsInteractor?
	var router: IDetailsRouter?
    fileprivate var itemId:String!
    fileprivate var itemAction:String!
    fileprivate var realm:Realm!
    @IBOutlet weak var txtFFirstName: SkyFloatingLabelTextFieldWithIcon! {
        didSet {
            txtFFirstName.delegate = self
        }
    }
    @IBOutlet weak var txtFLastName: SkyFloatingLabelTextFieldWithIcon! {
        didSet {
            txtFLastName.delegate = self
        }
    }
    @IBOutlet weak var txtFEmail: SkyFloatingLabelTextFieldWithIcon! {
        didSet {
            txtFEmail.delegate = self
        }
    }
    @IBOutlet weak var txtFPhone: SkyFloatingLabelTextFieldWithIcon! {
        didSet {
            txtFPhone.delegate = self
        }
    }
	override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        
        // fetch interactor data
        guard let _id = interactor?.parameters?["id"] as? String else { return }
        guard let _action = interactor?.parameters?["action"] as? String else { return }
        
        itemId = _id
        itemAction = _action
        // init db
        realm = try! Realm()
        
        // fetch item from local db
        let item = realm.objects(UserContact.self).filter("id = '\(_id)'").first
        
        //        print(item!.firstName as String)
        
        // feed ui ...
        
        
        if _action == Action.update {
            self.txtFFirstName.text = item!.firstName as String
            self.txtFLastName.text = item!.lastName as String
            self.txtFEmail.text = item!.email as String
            self.txtFPhone.text = item!.phone as String
            
        }
        
        
        do {
            try setRightNavigationBarItem()
            
        }
        catch {
            
        }
        
		// do someting...
    }
    
    func setRightNavigationBarItem() throws -> Bool {
        
        let rightButton = UIBarButtonItem(title: itemAction, style: UIBarButtonItem.Style.done, target: self, action:  #selector(self.save))
        
        
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        return true
    }
    
    @objc func save () {
        guard let firstName = self.txtFFirstName.text, firstName != "" else {
            self.txtFFirstName.errorMessage = "Please Enter First Name!"
            return
        }
        
        guard let lastName = self.txtFLastName.text,lastName != ""  else {
            self.txtFLastName.errorMessage = "Please Enter Last Name!"
            return
        }
        
        let email = self.txtFEmail.text
        let phone = self.txtFPhone.text
        
        
        insertToDB(firstName: firstName, lastName: lastName, email: email!, phone: phone!)
        
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func insertToDB (firstName:String, lastName:String, email:String = "" ,  phone:String = "") {
        
        
        
        
        let contact = UserContact()
        contact.id = itemId
        contact.firstName = firstName
        contact.lastName = lastName
        contact.email = email
        contact.phone = phone
        
        
        
        if itemAction == Action.add {
            try! realm.write {
                realm.add(contact, update: false)
            }
        }
        
        if itemAction == Action.update {
            try! realm.write {
                realm.add(contact, update: true)
            }
        }
        
        
        
        
    }
}




extension DetailsViewController: IDetailsViewController {
	// do someting...
}

extension DetailsViewController:UITextFieldDelegate {
    
}

extension DetailsViewController {
	// do someting...
}
