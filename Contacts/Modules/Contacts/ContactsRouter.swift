//
//  ContactsRouter.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.



import UIKit

protocol IContactsRouter: class {
    // do someting...
    func navigateToDetails(id:String, action:String)
}

class ContactsRouter: IContactsRouter {
    weak var view: ContactsViewController?
    
    init(view: ContactsViewController?) {
        self.view = view
    }
    
    func navigateToDetails (id:String, action:String){
        
        view?.navigate(module: GeneralRoute.detail(parameter: ["id":id,"action":action]))
    }
}

