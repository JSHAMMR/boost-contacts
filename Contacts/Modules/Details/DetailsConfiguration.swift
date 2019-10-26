//
//  DetailsConfiguration.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import Foundation
import UIKit

class DetailsConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = DetailsViewController()
        let router = DetailsRouter(view: controller)
        let presenter = DetailsPresenter(view: controller)
        let manager = DetailsManager()
        let interactor = DetailsInteractor(presenter: presenter, manager: manager)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
