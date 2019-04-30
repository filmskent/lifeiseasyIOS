//
//  ProfileViewController.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var JobTable: UITableView!
    @IBOutlet var EmploymentTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == JobTable){
            return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == JobTable){
            let cell = tableView.dequeueReusableCell(withIdentifier: "jobcell", for: indexPath) as! ProfileEmploymentTableViewCell
            
            // Configure the cell...
            
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "employmentcell", for: indexPath) as! ProfileHireTableViewCell
            
            // Configure the cell...
            
            return cell

        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(tableView == JobTable){
            return "Job History"
        }else{
            return "Employment History"
        }
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
