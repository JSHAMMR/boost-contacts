//
//  ContactsTests.swift
//  ContactsTests
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//
import XCTest
import RealmSwift
@testable import Contacts

class ContactsTests: XCTestCase {
    
    var contact : ContactsViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        contact = ContactsViewController ()
        _ = contact.view
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testInitTableView() {
        XCTAssertNotNil(contact.tableView)
    }
    
    func testLoadingResource() {
        XCTAssertTrue(try contact.loadJsonFile())
        XCTAssertTrue(try contact.loadJsonFile(fileName: "data", extensionfile: "json"))
    }
    
    func testRightNavigationItem() {
        XCTAssertTrue(try contact.setRightNavigationBarItem(imageName: "accordion-plus"))
        
    }
    //
    func testRegisterCell() {
        XCTAssertTrue(try contact.registerNibCell(nibNameString: "ContactCell", reuseIdentifier: "ContactCell"))
        
    }
    
    
}
