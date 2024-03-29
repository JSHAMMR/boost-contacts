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
enum NavigationError: Error {
    case failedRightNavBarImage
    
}
enum FileLoadError: Error {
    case failedLoadingResource(String)
    case failedSerialization
    case failedRightNavBarImage
    
}
enum TableViewError: Error {
    case failedRegisterCell
    
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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: DataProvider!

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        self.title = "Contacts"
        hideKeyboardWhenTappedAround()

        do {
            // load json file
            
            try loadJsonFile(fileName: "data")
            
            // register cell
            try! registerNibCell(nibNameString: "ContactCell", reuseIdentifier: "ContactCell")
            // router.navigateToDetails(id: "22")
            try! setRightNavigationBarItem(imageName: "accordion-plus")

            
            
        } catch  {
            
        }
    }
    func registerNibCell (nibNameString:String, reuseIdentifier: String) throws -> Bool{
        if let nib = try? UINib.init(nibName: nibNameString, bundle: nil) {
            self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
            
        } else {
            throw TableViewError.failedRegisterCell
            
        }
        
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // fetch data
        let userContacts = realm.objects(UserContact.self).sorted(byKeyPath: "created", ascending: false)
        userContacts.forEach({print($0.firstName)})
        
        
        
        // feed tablview
        
        dataProvider = DataProvider(toItems: userContacts, router: router!)
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        
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
    func setRightNavigationBarItem(imageName:String) throws -> Bool {
        guard let menuImage = UIImage(named: imageName) else {
            throw NavigationError.failedRightNavBarImage
        }
        
        let rightButton: UIBarButtonItem = UIBarButtonItem(image: menuImage, style: UIBarButtonItem.Style.done, target: self, action: #selector(self.navigateToDetails))
        
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        return true
    }
    
    
    
    @objc func navigateToDetails () {
        router?.navigateToDetails(id: randomString(length: 10), action: Action.add)
    }
    
    
    func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
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
