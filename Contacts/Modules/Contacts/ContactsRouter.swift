//
//  ContactsRouter.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IContactsRouter: class {
	// do someting...
}

class ContactsRouter: IContactsRouter {	
	weak var view: ContactsViewController?
	
	init(view: ContactsViewController?) {
		self.view = view
	}
}
