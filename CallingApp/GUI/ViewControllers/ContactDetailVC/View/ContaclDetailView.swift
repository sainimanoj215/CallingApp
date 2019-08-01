//
//  ContactDetailView.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import UIKit
import MessageUI

class ContactDetailView: UIViewController, ContactDetailViewProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	var presenter: ContactDetailPresenterProtocol?
    var contact : ContactModel!    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView?.register(UINib(nibName: kProfileTableViewCell, bundle: nil), forCellReuseIdentifier: kProfileTableViewCell)
            tableView?.register(UINib(nibName: kContactInfoTableViewCell, bundle: nil), forCellReuseIdentifier: kContactInfoTableViewCell)
            tableView?.register(UINib(nibName: kAddProfilePicTableViewCell, bundle: nil), forCellReuseIdentifier: kAddProfilePicTableViewCell)
            tableView.tableFooterView = UIView()
        }
    }
    var editBarItem : UIBarButtonItem!
    var cancelBarItem : UIBarButtonItem!
    var addNewContact = false
    var editContact = false
    let imagePicker = UIImagePickerController()
    var tmpContact : ContactModel!

    // MARK: - View Life Cycle Methods
	override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
        if !addNewContact {
            self.getContactInfo()
            editBarItem = UIBarButtonItem.init(title: "Edit", style: .done, target: self, action: #selector(didTapEdit))
            cancelBarItem = UIBarButtonItem.init(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))
            self.navigationItem.rightBarButtonItem = editBarItem
        }
        else {
            self.contact = ContactModel.init()
            self.tmpContact = ContactModel.init(fromDictionary: self.contact.toDictionary())
            self.tableView.reloadData()
        }
    }
       
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @objc func didTapEdit() {
        if !self.editContact {
            DispatchQueue.main.async {
                self.editContact = true
                self.tmpContact = ContactModel.init(fromDictionary: self.contact.toDictionary())
                self.navigationItem.leftBarButtonItem = self.cancelBarItem
                self.editBarItem.title = "Done"
                self.tableView.reloadData()
                self.loader.stopAnimating()
            }
        }
        else {
            self.view.endEditing(true)
            if self.addNewContact {
                self.createNewContact()
            }
            else {
                self.updateContact()
            }
        }
    }
    
    @objc func didTapCancel() {
        self.view.endEditing(true)
        if !self.addNewContact {
            DispatchQueue.main.async {
                self.editContact = false
                self.editBarItem.title = "Edit"
                self.navigationItem.leftBarButtonItem = nil
                self.tableView.reloadData()
                self.loader.stopAnimating()
            }
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func getContactInfo(){
        self.loader.startAnimating()
        self.presenter?.getContactInfo(forContact: "\(self.contact!.id ?? 0)", completion: { (contactInfo) in
            if contactInfo != nil {
                self.contact = contactInfo
            }
            self.tableView.reloadData()
            self.loader.stopAnimating()
        })
    }
    
    @objc func didTapMessage(sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            controller.body = "Hello \(contact.firstName ?? "")!"
            controller.messageComposeDelegate = self
            controller.recipients = [(contact.phoneNumber ?? "")]
            self.present(controller, animated: true, completion: nil)
        }
        else {
            self.showAlert(title: "Sorry, you can't send message", message: "", okayButtonTitle: "Close", buttonAction: {})
        }
    }
    
    @objc func didTapCamera(sender: UIButton) {
        self.selectProfilePhoto()
    }
    
    @objc func didTapCall(sender: UIButton) {
        guard let number = URL(string: "tel://" + (contact.phoneNumber ?? "")) else { return }
        UIApplication.shared.open(number)
    }
    
    @objc func didTapEmail(sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([(contact.email ?? "")])
            mail.setMessageBody("Hello \(contact.firstName ?? "")!", isHTML: false)
            present(mail, animated: true)
        }
        else {
            self.showAlert(title: "Device not configured to send emails", message: "", okayButtonTitle: "Close", buttonAction: {})
        }
    }
    
    @objc func didTapFav(sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    
    func selectProfilePhoto() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { [weak self] _ in
            self?.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { [weak self] _ in
            self?.openGallary()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickedImage : UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! ProfileTableViewCell
                cell.profileImgVIew.image = pickedImage
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showErrorAtert(msg:String) {
        self.showAlert(title: "Oopss!", message: msg, okayButtonTitle: "OK") {
        }
    }
    
    private func validateContact() -> Bool {
        if self.tmpContact.firstName?.isEmptyString() ?? true {
            self.showErrorAtert(msg: "First name can't be empty.")
            return false
        }
        else if self.tmpContact.lastName?.isEmptyString() ?? true  {
            self.showErrorAtert(msg: "Last name can't be empty.")
            return false
        }
        else if !(self.tmpContact.phoneNumber?.isValidMobile() ?? true)  {
            self.showErrorAtert(msg: "Enter valid phone number.")
            return false
        }
        else if !(self.tmpContact.email?.isValidEmail() ?? true)  {
            self.showErrorAtert(msg: "Enter valid email.")
            return false
        }
        return true
    }
    
    private func createNewContact() {
        if validateContact() {
            self.loader.startAnimating()
            let param = NSMutableDictionary()
            param.setValue(tmpContact.firstName, forKey: "first_name")
            param.setValue(tmpContact.lastName, forKey: "last_name")
            param.setValue(tmpContact.email, forKey: "email")
            param.setValue(tmpContact.phoneNumber, forKey: "phone_number")
            param.setValue(tmpContact.favorite ?? false, forKey: "favorite")
            self.presenter?.createContact(contactParam: param, completion: { (contact) in
                self.contact = contact
                self.addNewContact = false
                self.editContact = false
                self.didTapCancel()
            })
        }
    }
    
    private func updateContact() {
        if validateContact() {
            self.loader.startAnimating()
            let param = NSMutableDictionary()
            if tmpContact.firstName != contact.firstName {
                param.setValue(tmpContact.firstName, forKey: "first_name")
            }
            if tmpContact.lastName != contact.lastName {
                param.setValue(tmpContact.lastName, forKey: "last_name")
            }
            if tmpContact.email != contact.email {
                param.setValue(tmpContact.email, forKey: "email")
            }
            if tmpContact.phoneNumber != contact.phoneNumber {
                param.setValue(tmpContact.phoneNumber, forKey: "phone_number")
            }
            if tmpContact.favorite != contact.favorite {
                param.setValue(tmpContact.favorite ?? false, forKey: "favorite")
            }
            if param.allKeys.count == 0 {
                self.loader.stopAnimating()
                return
            }
            self.presenter?.editContact(contactId:"\(self.contact.id ?? 0)", param: param, completion: { (contact) in
                self.contact = contact
                self.addNewContact = false
                self.editContact = false
                self.didTapCancel()
            })
        }
    }
}

// MARK: - MFMailComposeViewControllerDelegate
extension ContactDetailView : MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        case MFMailComposeResult.failed.rawValue:
            print("Error: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ContactDetailView : MFMessageComposeViewControllerDelegate{
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MessageComposeResult.sent.rawValue:
            print("Sent")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ContactDetailView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text ?? ""
        switch textField.tag {
        case 0:
            if !text.isEmptyString() {
                tmpContact.firstName = text
            }
            else {
                self.showErrorAtert(msg: "First name can't be empty.")
            }
            break
        case 1:
            if !text.isEmptyString() {
                tmpContact.lastName = text
            }
            else {
                self.showErrorAtert(msg: "Last name can't be empty.")
            }
            break
        case 2:
            if text.isValidMobile() {
                tmpContact.phoneNumber = text
            }
            else {
                self.showErrorAtert(msg: "Enter valid phone number.")
            }
            break
        case 3:
            if text.isValidEmail() {
                tmpContact.email = text
            }
            else {
                self.showErrorAtert(msg: "Enter valid email.")
            }
            break
        default:
            break
        }
    }
}
