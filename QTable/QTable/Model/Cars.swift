//
//  Cars.swift
//  QTable
//
//  Created by Myca Miralles on 3/21/22.
//

import Foundation
import UIKit

struct Cars: Codable {
    
    enum CodingKeys: String, CodingKey {
        case consList       = "consList"
        case customerPrice  = "customerPrice"
        case make           = "make"
        case marketPrice    = "marketPrice"
        case model          = "model"
        case prosList       = "prosList"
        case rating         = "rating"
    }
    
    var consList: [String]
    var customerPrice: Double
    var make: String
    var marketPrice: Double
    var model: String
    var prosList: [String]
    var rating: Int
    
    func carModelAndMake() -> String {
        return make + " " + model
    }
    
    func carDisplayPrice() -> String {
        let intPrice = Int((customerPrice/1000))
        return "Price : " + String(intPrice) + "k"
    }
    
    func carRating() -> String {
        var star = "★"
        let spacePlusStar = " " + star
        for _ in 1..<rating {
            star.append(spacePlusStar)
        }
        return star
    }
    
    func carProsHide() -> Bool {
        return prosList.count == 0 ? true: false
    }
    
    func carConsHide() -> Bool {
        return consList.count == 0 ? true: false
    }

    func carImage() -> UIImage {
        
        switch CarImages(rawValue: make) {
        case .bmw :
            return CarImages.bmw.pngImage
        case .mercedes:
            return CarImages.mercedes.pngImage
        case .rangeRover:
            return CarImages.rangeRover.pngImage
        case .alpine:
            return CarImages.alpine.pngImage
        case .toyota:
            return CarImages.toyota.pngImage
        default:
            return UIImage()
        }
    }
}
