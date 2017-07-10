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
    
    @IBOutlet weak var pickerContainerView: UIView!
    @IBOutlet var timePicker:UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var selectedTime:String?
    var selectedIndex: Int = 0
    
    var minimumDate:NSDate?
    var maximumDate:NSDate?
    
    var delegate:UITimePickerControllerDataDelegate!
    
    var currentViewController : String =  String()
    var targetViewController :UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func initialUISetUp()
    {
        timePicker.datePickerMode = .time
        
    }
    
    
    // MARK:- TimePicker ValueChanged
    @IBAction func timePickerValueChanged(_ sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        selectedTime = formatter.string(from: sender.date)
        
    }
    @IBAction func doneButtonClicked(_ sender: Any) {
        
        if(selectedTime == nil)
        {
            getDefaultDateIfTimepickerValueNotChanged()
            self.delegate.getTimePickerData(selectedIndex: selectedIndex, selectedItem: selectedTime)
            
        }
        else {
            
            self.delegate.getTimePickerData(selectedIndex: selectedIndex, selectedItem: selectedTime)
        }
        
        self.dismiss(animated: true)
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    func getDefaultDateIfTimepickerValueNotChanged()
    {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        selectedTime = formatter.string(from: timePicker.date)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
