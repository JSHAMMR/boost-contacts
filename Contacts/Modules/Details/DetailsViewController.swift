//
//  DetailsViewController.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright (c) 2019 Jamil. All rights reserved.


import UIKit

protocol IDetailsViewController: class {
	var router: IDetailsRouter? { get set }
}

class DetailsViewController: UIViewController {
	var interactor: IDetailsInteractor?
	var router: IDetailsRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension DetailsViewController: IDetailsViewController {
	// do someting...
}

extension DetailsViewController {
	// do someting...
}

extension DetailsViewController {
	// do someting...
}
