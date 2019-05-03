//
//  HomeTableViewController.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    let typeList = ["All","Application","Architecture & Interior","Art & Drawing","Artist","Business","Content & Writing","Design","Graphic Design","Influenver","Language","Lifestyle","Marketing Plan","Marketing Strategy","Photo & Video","Self Improvement","Social Media","Technical","Voice & Sound","Website Development"]

    @IBOutlet var typeInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPickerView()
        setDoneBtn()
    }
    
    func setPickerView(){
        pickerView.delegate = self
        typeInput.inputView = pickerView
        
        //set Tap to quit
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(HomeTableViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "maincell", for: indexPath) as! HomeTableViewCell

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //pickerView init
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
        typeInput.text = "Job Type: " + typeList[row]
        tableView.reloadData()
    }

}
