//
//  Datajson.swift
//  TableView
//
//  Created by Raksha Singh on 27/01/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import Foundation
class TblData: Codable {
    let states: [State]

    enum CodingKeys: String, CodingKey {
        case states
    }

    init(states: [State]) {
        self.states = states
    }
}
