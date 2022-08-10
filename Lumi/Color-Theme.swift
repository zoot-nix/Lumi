//
//  Color-Theme.swift
//  Lumi
//
//  Created by Owais Shaikh on 10/08/22.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBG: Color {
        Color(red: 23/255, green: 23/255, blue: 23/255)
    }

    static var lightBG: Color {
        Color(red: 68/255, green: 68/255, blue: 68/255)
    }
    
    static var mainFont: Color {
        Color(red: 237/255, green: 237/255, blue: 237/255)
    }
    
    static var secondaryFont: Color {
        Color(red: 202/255, green: 62/255, blue: 71/255)
    }
}

