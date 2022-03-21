//
//  DataModel.swift
//  ExpandableTableViewExample
//
//  Created by John Codeos on 09/30/20.
//  Copyright © 2020 John Codeos. All rights reserved.
//

import Foundation

class DataModel {
    var question: String?
    var answer: String?

    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
    
    /*
    var consList: [String]
    var customerPrice: Double?
    var make: String?
    var marketPrice: Double?
    var model: String?
    var prosList: [String]
    var rating: Int?
    
    init(consList: [String], customerPrice: Double, make: String, marketPrice: Double, model: String, prosList: [String],rating: Int) {
        self.consList = consList
        self.customerPrice = customerPrice
        self.make = make
        self.marketPrice = marketPrice
        self.model = model
        self.customerPrice = customerPrice
        self.prosList = prosList
        self.rating = rating
    }
     */
}
