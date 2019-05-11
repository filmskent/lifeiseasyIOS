//
//  PostData.swift
//  FindYourProvider
//
//  Created by revarof on 6/5/2562 BE.
//  Copyright © 2562 revarof. All rights reserved.
//

import Foundation
struct PostData: Codable {
    let name: String
    let price: Int
    let date: Date
    let id: String
}

class Job{
    let name: String
    let job: String
    let price: Int
    let date: Date
    
    init(name: String, job: String, price: Int , date: Date) {
        self.name = name
        self.job = job
        self.date = date
        self.price = price
    }
}

