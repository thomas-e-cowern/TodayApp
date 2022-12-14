//
//  CreateJournalViewController.swift
//  TodayAppUIKit
//
//  Created by Thomas Cowern on 8/22/22.
//

import UIKit
import RealmSwift
import Network

class CreateJournalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var setDateButton: UIButton!
    
    var date = Date()
    var imagePicker = UIImagePickerController()
    var images: [UIImage] = []
    var startWithCamera = false
    var entry = Entry()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.0)
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationBar.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        imagePicker.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if startWithCamera {
            startWithCamera = false
            cameraButtonTapped("")
        }
    }
    
    func updateDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d, yyyy"
        navigationBar.topItem?.title = formatter.string(from: date)
    }
    
    @objc func keyboardWillHide (notification: Notification) {
        changeKeyboardHeight(notification: notification)
    }
    
    @objc func keyboardWillShow (notification: Notification) {
        changeKeyboardHeight(notification: notification)
    }
    
    func changeKeyboardHeight (notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            print(keyboardFrame.cgRectValue.height)
            bottomConstraint.constant = keyboardHeight + 10
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let realm = try? Realm() {
            entry.text = textArea.text
            for image in images {
                let picture = Picture(image: image)
                entry.pictures.append(picture)
                picture.entry = entry
            }
            print(entry.pictures.count)
            try? realm.write {
                realm.add(entry)
            }
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func setDateTapped(_ sender: Any) {
        textArea.isHidden = false
        datePicker.isHidden = true
        setDateButton.isHidden = true
        date = datePicker.date
        updateDate()
    }
    
    @IBAction func calendarButtonTapped(_ sender: Any) {
        textArea.isHidden = true
        datePicker.isHidden = false
        setDateButton.isHidden = false
        datePicker.date = date
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            images.append(chosenImage)
           
            let imageView = UIImageView()
            
            imageView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
            
            imageView.image = chosenImage
            stackView.addArrangedSubview(imageView)
            imagePicker.dismiss(animated: true) {
                // animation coming soon
            }
        }
    }
}
