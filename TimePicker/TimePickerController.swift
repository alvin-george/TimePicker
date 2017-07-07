//
//  TimePickerController.swift
//  TimePicker
//
//  Created by apple on 07/07/17.
//  Copyright © 2017 apple. All rights reserved.
//


import UIKit

protocol UITimePickerControllerDataDelegate {
    func getTimePickerData (selectedIndex : Int , selectedItem : String?)
}

class TimePickerController: UIViewController {

    @IBOutlet var timePicker:UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    var selectedTime:String?
    var selectedIndex: Int = 0
    
    var delegate:UITimePickerControllerDataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func initialUISetUp()
    {
        timePicker.datePickerMode = .time
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK:- TimePicker ValueChanged
    @IBAction func timePickerValueChanged(_ sender: Any) {
        
    }
    @IBAction func doneButtonClicked(_ sender: Any) {
        self.delegate.getTimePickerData(selectedIndex: selectedIndex, selectedItem: selectedTime)
        
        self.dismiss(animated: true)
        
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    
    //MARK:- Date and time
    
    func setDateAndTime() {
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        timeFormatter.timeStyle = DateFormatter.Style.short

    }
}
