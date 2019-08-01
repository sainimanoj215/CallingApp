//
//  CallingAppTests.swift
//  CallingAppTests
//
//  Created by Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import XCTest
@testable import CallingApp

class CallingAppTests: XCTestCase {

    var contactDetailVC: ContactDetailView!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        self.contactDetailVC = ContactDetailWireframe().view
        contactDetailVC.contact = dummyContact()
//        contactDetailVC.tableView.reloadData()
        XCTAssertNotNil(contactDetailVC.view)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func dummyContact() -> ContactModel {
        let contact = ContactModel()
        contact.firstName   = "Manoj"
        contact.lastName    = "Saini"
        contact.email       = "manoj@saini.com"
        contact.phoneNumber = "+918860458487"
        contact.favorite    = true
        return contact
    }

    func testFullName() {
        let cell = self.contactDetailVC.tableView(self.contactDetailVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProfileTableViewCell
        let fullName = cell.nameLbl.text
        XCTAssert(self.contactDetailVC.contact.getFullName() == fullName)
    }
    
    func testMobile() {
        let cell = self.contactDetailVC.tableView(self.contactDetailVC.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! ContactInfoTableViewCell
        let mobile = cell.textField.text
        XCTAssert(self.contactDetailVC.contact.phoneNumber == mobile)
        
        let profileCell = self.contactDetailVC.tableView(self.contactDetailVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProfileTableViewCell
        XCTAssert(profileCell.messageBtn.isUserInteractionEnabled && !profileCell.messageBtn.isHidden)
        XCTAssert(profileCell.callBtn.isUserInteractionEnabled && !profileCell.callBtn.isHidden)
        
        self.contactDetailVC.contact.phoneNumber = nil
        self.contactDetailVC.tableView.reloadData()
        
        // TODO: better way to put in wait
        UIView.animate(withDuration: 3.0, animations: {
        }, completion: {(finished) in
            XCTAssert(!profileCell.messageBtn.isUserInteractionEnabled)
            XCTAssert(!profileCell.callBtn.isUserInteractionEnabled)
        })
    }
    
    func testEmail() {
        let cell = self.contactDetailVC.tableView(self.contactDetailVC.tableView, cellForRowAt: IndexPath(row: 2, section: 0)) as! ContactInfoTableViewCell
        let email = cell.textField.text
        XCTAssert(self.contactDetailVC.contact.email == email)
        
        let profileCell = self.contactDetailVC.tableView(self.contactDetailVC.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ProfileTableViewCell
        XCTAssert(profileCell.emailBtn.isUserInteractionEnabled && !profileCell.emailBtn.isHidden)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
