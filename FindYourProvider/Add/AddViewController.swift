//
//  AddViewController.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {

    var datePicker = UIDatePicker()
    let pickerView = UIPickerView()
    let typeList = ["Application","Architecture & Interior","Art & Drawing","Artist","Business","Content & Writing","Design","Graphic Design","Influenver","Language","Lifestyle","Marketing Plan","Marketing Strategy","Photo & Video","Self Improvement","Social Media","Technical","Voice & Sound","Website Development"]
    
    @IBOutlet var dateInput: UITextField!
    @IBOutlet var typeInput: UITextField!
    @IBOutlet var priceInput: UITextField!
    @IBOutlet var detailLbl: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.title = "Add Job"
        setPickerView()
        setDatePicker()
    }
    
    func setPickerView(){
        pickerView.delegate = self
        typeInput.inputView = pickerView
        
        //set Tap to quit
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        setDoneBtn()
    }
    
    func setDoneBtn(){
        let accessory: UIView = {
            let accessoryView = UIView(frame: .zero)
            accessoryView.backgroundColor = .lightGray
            accessoryView.alpha = 0.6
            return accessoryView
        }()
        let sendButton: UIButton! = {
            let sendButton = UIButton(type: .custom)
            sendButton.setTitleColor(.blue, for: .normal)
            sendButton.setTitle("DONE", for: .normal)
            sendButton.setTitleColor(.white, for: .disabled)
            sendButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
            sendButton.showsTouchWhenHighlighted = true
            sendButton.isEnabled = true
            return sendButton
        }()
        
        accessory.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 45)
        accessory.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        typeInput.inputAccessoryView = accessory
        dateInput.inputAccessoryView = accessory

        accessory.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo:
                accessory.trailingAnchor, constant: -20),
            sendButton.centerYAnchor.constraint(equalTo:
                accessory.centerYAnchor)
            ])
    }
    
    @objc func doneButtonTapped(){
        view.endEditing(true)
    }
    
    func setDatePicker(){
        //Set DatePicker in Text
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        dateInput.inputView = datePicker
        
        //Set Tap to quit
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateInput.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return typeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typeList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeInput.text = typeList[row]
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        //DateFormatter
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd/MM/yyyy"
        let dStr = dateFormatter2.date(from: dateInput.text!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: dStr!)
        
//        // prepare json data
//        let json: [String: Any] = ["name": typeInput.text! , "price": Int(priceInput.text!)! , "detail": detailLbl.text! , "date": date]
//
        let parameters: Parameters = [
            "name": typeInput.text! , "price": Int(priceInput.text!)! , "detail": detailLbl.text! , "date": date
        ]
        
        let ticket = UserDefaults.standard.string(forKey: "ticket")
        
        Alamofire.request("http://54.179.153.2:9000/job?ticket=" + ticket!, method: .post, parameters: parameters, encoding: JSONEncoding.default)
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
