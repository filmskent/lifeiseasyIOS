//
//  InfoViewController.swift
//  FindYourProvider
//
//  Created by revarof on 30/4/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class InfoViewController: UIViewController {


    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var jobLbl: UILabel!
    @IBOutlet var detailLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ud = UserDefaults.standard
        nameLbl.text = ud.string(forKey: "nameStr")
        jobLbl.text = ud.string(forKey: "jobStr")
        priceLbl.text = ud.string(forKey: "priceStr")
        detailLbl.text = ud.string(forKey: "detailStr")
        dateLbl.text = ud.string(forKey: "dateStr")
        print(ud.string(forKey:"jobid"))
        
        //delete
        ud.removeObject(forKey: "nameStr")
        ud.removeObject(forKey: "jobStr")
        ud.removeObject(forKey: "priceStr")
        ud.removeObject(forKey: "detailStr")
        ud.removeObject(forKey: "dateStr")


    }

    @IBAction func hireBtn(_ sender: Any) {
        
        let parameters: Parameters = [
            "id": UserDefaults.standard.string(forKey: "jobid")
        ]
        
        let ticket = UserDefaults.standard.string(forKey: "ticket")
        
        Alamofire.request("http://54.179.153.2:9000/employ?ticket=" + ticket!, method: .post, parameters: parameters, encoding: JSONEncoding.default)
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
