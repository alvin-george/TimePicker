//
//  ViewController.swift
//  TimePicker
//
//  Created by apple on 07/07/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var timePickerDelegate: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //textfield Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        textField.resignFirstResponder()
        
        showEZPickerView(currentViewControllerIdentifier : "viewController" ,pickerViewItems : ["Class 1","Class 2","Class 3","Class 4"])
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder();
        return true
    }
    //Custom Picker
    func showEZPickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        
        
        let customPickerView = UIStoryboard(name: STORYBOARD_TYPE.MAIN.rawValue, bundle: nil).instantiateViewController(withIdentifier: "pickerViewController") as! PickerViewController
        customPickerView.pickerViewItems = pickerViewItems
        customPickerView.currentViewController = currentViewControllerIdentifier!
        customPickerView.delegate =  self
        
        customPickerView.modalPresentationStyle = .overCurrentContext
        self.present(customPickerView, animated: true, completion: nil)
    }
    //Custom Delegates
    func getPickerData(selectedIndex: Int, selectedItem: String?) {
        
        self.view.endEditing(true)
        //selectedClass =  selectedItem
        //searchClassTextField.text =  selectedClass
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

