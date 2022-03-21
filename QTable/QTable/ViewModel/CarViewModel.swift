//
//  CarViewModel.swift
//  QTable
//
//  Created by Myca Miralles on 3/21/22.
//

import Foundation

class CarViewModel {
    public var datasource: [Cars]?
    init() {
        datasource = loadJson(filename: "car_list")
    }
    func loadJson(filename: String) -> [Cars]? {
        if let url = Bundle.main.url(forResource: filename, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)//try Data(contentsOf: urlData)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Cars].self, from: data)
                //print("march 17 a: \(jsonData)")
                return jsonData
            } catch {
                print("Error:\(error)")
            }
        }
        return nil
    }
}
