//
//  Bundle-Decodable.swift
//  Lumi
//
//  Created by Owais Shaikh on 08/08/22.
//

import Foundation

extension Bundle{
    //<T> : short-hand placeholder for type.
    func decode<T: Codable>(_ file: String) -> T{
        //Find the file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //Load the file
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        //Date Formatting
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        
        //Decode the JSON File
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    
    }
}
