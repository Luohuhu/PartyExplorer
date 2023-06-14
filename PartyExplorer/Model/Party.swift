//
//  Party.swift
//  PartyExplorer
//
//  Created by 罗贤甫 on 6/13/23.
//

import Foundation

struct Party : Identifiable{
    var id: Int
    let name: String
    let imgURL: String
    let price: Double
    let startDate: Date
    let endDate: Date?
}
