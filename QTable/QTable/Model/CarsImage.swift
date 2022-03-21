//
//  CarsImage.swift
//  QTable
//
//  Created by Myca Miralles on 3/21/22.
//

import Foundation
import UIKit

public enum CarImages: String {
    case bmw        = "BMW"
    case mercedes   = "Mercedes Benz"
    case alpine     = "Alpine"
    case rangeRover = "Land Rover"
    case toyota     = "Toyota"

    public var pngImage: UIImage {
        
        var imageName: String!
        
        switch self {
        case .mercedes:
            imageName = "Mercedez_benz_GLC"
        case .bmw:
            imageName = "BMW_330i"
        case .toyota:
            imageName = "Tacoma"
        case .rangeRover:
            imageName = "Range_Rover"
        case .alpine:
            imageName = "Alpine_roadster"
        }
        return UIImage(named: imageName) ?? UIImage()
    }
}
