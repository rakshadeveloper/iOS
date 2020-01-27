//
//  DataModel.swift
//  TableView
//
//  Created by Raksha Singh on 27/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import Foundation
class State: Codable {
    let state: String
    let districts: [String]

    enum CodingKeys: String, CodingKey {
        case state
        case districts
    }

    init(state: String, districts: [String]) {
        self.state = state
        self.districts = districts
    }
}
