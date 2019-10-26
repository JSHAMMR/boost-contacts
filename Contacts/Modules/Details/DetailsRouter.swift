//
//  DetailsRouter.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IDetailsRouter: class {
	// do someting...
}

class DetailsRouter: IDetailsRouter {	
	weak var view: DetailsViewController?
	
	init(view: DetailsViewController?) {
		self.view = view
	}
}
