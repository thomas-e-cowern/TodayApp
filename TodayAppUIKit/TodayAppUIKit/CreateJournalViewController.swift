//
//  CreateJournalViewController.swift
//  TodayAppUIKit
//
//  Created by Thomas Cowern on 8/22/22.
//

import UIKit

class CreateJournalViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var bottomRestraint: NSLayoutConstraint!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var setDateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.0)
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        navigationBar.backgroundColor = UIColor(red: 0.298, green: 0.757, blue: 0.988, alpha: 1.0)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func setDateTapped(_ sender: Any) {
        
    }
    
    @IBAction func calendarButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
        
    }
}
