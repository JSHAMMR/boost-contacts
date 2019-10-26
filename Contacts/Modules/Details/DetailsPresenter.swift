//
//  DetailsPresenter.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IDetailsPresenter: class {
	// do someting...
}

class DetailsPresenter: IDetailsPresenter {	
	weak var view: IDetailsViewController?
	
	init(view: IDetailsViewController?) {
		self.view = view
	}
}
