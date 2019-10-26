//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit
import SwiftyJSON
import RealmSwift



class UserContact: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var email = ""
    @objc dynamic var phone = ""
    @objc dynamic var created = Date()
    override class func primaryKey() -> String? {
        return "id"
    }
}
enum FileLoadError: Error {
    case failedLoadingResource(String)
    case failedSerialization
    case failedRightNavBarImage
    
}
protocol IContactsViewController: class {
	var router: IContactsRouter? { get set }
}

class ContactsViewController: UIViewController {
	var interactor: IContactsInteractor?
	var router: IContactsRouter?
    fileprivate var defaults = UserDefaults.standard
    fileprivate var jsonData: Data?
    let realm = try! Realm()

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        self.title = "Contacts"

        do {
            // load json file
            
            try loadJsonFile(fileName: "data")
            
            
        } catch  {
            
        }
    }
    
    
    func loadJsonFile (fileName:String = "data", extensionfile : String = "json") throws -> Bool  {
        
        if defaults.bool(forKey: "fileLoaded") == false {
            
            
            
            if let file = Bundle.main.path(forResource: fileName, ofType: extensionfile) {
                jsonData = try? Data(contentsOf: URL(fileURLWithPath: file))
            } else {
                throw FileLoadError.failedLoadingResource(fileName)
            }
            
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) {
                
                let contact : Array =  JSON(jsonObject).arrayValue
                // saving data to local db
                contact.forEach({
                    
                    
                    print(" id == \($0["id"].stringValue)")
                    let contact = UserContact()
                    contact.id = $0["id"].stringValue
                    contact.firstName = $0["firstName"].stringValue
                    contact.lastName = $0["lastName"].stringValue
                    contact.email = $0["email"].stringValue
                    contact.phone = $0["phone"].stringValue
                    
                    try! realm.write {
                        realm.add(contact)
                    }
                    print("name of contact: \(contact.firstName)")
                    
                    
                })
                
                defaults.set(true, forKey: "fileLoaded")
                
                
            } else {
                throw FileLoadError.failedSerialization
                
            }
            print(defaults.dictionaryRepresentation().values)
            
            
        }
        
        return true
    }
    
}

extension ContactsViewController: IContactsViewController {
	// do someting...
}

extension ContactsViewController {
	// do someting...
}

extension ContactsViewController {
	// do someting...
}
