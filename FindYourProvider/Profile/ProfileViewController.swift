//
//  ProfileViewController.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    var profile:[String:Any] = [:]
    var jobs:[[String:Any]] = []
    var employment:[[String:Any]] = []
    @IBOutlet var uid: UILabel!
    @IBOutlet var uname: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var email: UILabel!
    
    @IBOutlet var JobTable: UITableView!
    @IBOutlet var EmploymentTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);

        getProfile()
        JobTable.reloadData()
        EmploymentTable.reloadData()
        setText()
    }
    
    func getProfile(){
        let ticket = UserDefaults.standard.string(forKey: "ticket")
        let strURL = "http://54.179.153.2:9000/me?ticket=" + ticket!
        
        let url = URL(string: strURL)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String : Any]
                    self.profile = parsedData["profile"] as! [String : Any]
                    self.jobs = parsedData["job"] as! [[String : Any]]
                    self.employment = parsedData["employment"] as! [[String : Any]]
                    self.JobTable.reloadData()
                    self.EmploymentTable.reloadData()
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
            }.resume()
    }
    
    func setText(){
        let ud = UserDefaults.standard
        uid.text = ud.string(forKey: "userid")
        uname.text = ud.string(forKey: "username")
        name.text = ud.string(forKey: "fullname")
        email.text = ud.string(forKey: "email")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == JobTable){
            return jobs.count
        }else{
            return employment.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == JobTable){
            let cell = tableView.dequeueReusableCell(withIdentifier: "jobcell", for: indexPath) as! ProfileEmploymentTableViewCell
            cell.jobLbl.text = jobs[indexPath.row]["name"] as! String
            cell.detailLbl.text = jobs[indexPath.row]["detail"] as! String
            cell.priceLbl.text = String(jobs[indexPath.row]["price"] as! Int)
            //DateFormatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: jobs[indexPath.row]["date"] as! String)
            
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "dd/MM/yyyy"
            let dStr = dateFormatter2.string(from: date!)
            cell.dateLbl.text = dStr
            cell.detailLbl.text = jobs[indexPath.row]["detail"] as! String
            cell.dateLbl.text = dStr
            if let a = jobs[indexPath.row]["customer"] as? String {
                cell.customerLbl.text = a
            }else{
                cell.customerLbl.text = ""
            }
            
            return cell

        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "employmentcell", for: indexPath) as! ProfileHireTableViewCell
            cell.nameLbl.text = employment[indexPath.row]["provider"] as! String
            cell.jobLbl.text = employment[indexPath.row]["name"] as! String
            cell.detailLbl.text = employment[indexPath.row]["detail"] as! String
            cell.priceLbl.text = String(employment[indexPath.row]["price"] as! Int)
            //DateFormatter
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: employment[indexPath.row]["date"] as! String)
            
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = "dd/MM/yyyy"
            let dStr = dateFormatter2.string(from: date!)
            cell.dateLbl.text = dStr
            
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
