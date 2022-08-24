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

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
