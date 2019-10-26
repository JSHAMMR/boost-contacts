//
//  ContactsInteractor.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IContactsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class ContactsInteractor: IContactsInteractor {
    var presenter: IContactsPresenter?
    var manager: IContactsManager?
    var parameters: [String: Any]?

    init(presenter: IContactsPresenter, manager: IContactsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
