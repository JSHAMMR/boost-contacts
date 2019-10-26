//
//  ContactsPresenter.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IContactsPresenter: class {
	// do someting...
}

class ContactsPresenter: IContactsPresenter {	
	weak var view: IContactsViewController?
	
	init(view: IContactsViewController?) {
		self.view = view
	}
}
