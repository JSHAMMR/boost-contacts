//
//  ContactsConfiguration.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import Foundation
import UIKit

class ContactsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ContactsViewController()
        let router = ContactsRouter(view: controller)
        let presenter = ContactsPresenter(view: controller)
        let manager = ContactsManager()
        let interactor = ContactsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
