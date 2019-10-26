//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit
import SwiftyJSON

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

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
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
