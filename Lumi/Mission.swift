//
//  Mission.swift
//  Lumi
//
//  Created by Owais Shaikh on 08/08/22.
//

import Foundation


struct Mission: Codable, Identifiable{
    
    //Nested Struct
    struct CrewRole: Codable{
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var DisplayName: String{
        "Apollo \(id)"
    }
    
    var image: String{
        "apollo\(id)"
    }
    
    var FormattedDate: String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
}
