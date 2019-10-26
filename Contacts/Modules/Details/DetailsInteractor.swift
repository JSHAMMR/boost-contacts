//
//  DetailsInteractor.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IDetailsInteractor: class {
	var parameters: [String: Any]? { get set }
}

class DetailsInteractor: IDetailsInteractor {
    var presenter: IDetailsPresenter?
    var manager: IDetailsManager?
    var parameters: [String: Any]?

    init(presenter: IDetailsPresenter, manager: IDetailsManager) {
    	self.presenter = presenter
    	self.manager = manager
    }
}
