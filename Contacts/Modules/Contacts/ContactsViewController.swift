//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IContactsViewController: class {
	var router: IContactsRouter? { get set }
}

class ContactsViewController: UIViewController {
	var interactor: IContactsInteractor?
	var router: IContactsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
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
