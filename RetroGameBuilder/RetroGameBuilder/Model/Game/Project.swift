//
//  Project.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 17/11/2022.
//

import Foundation

struct RGBProject : Codable {
    //basic parameter of the object
    var name : String
    var author : String
    var version : String
    var release : String
    
    var scenes : [RGBScene] = []
    
    init(){
        self.name = "Test"
        self.author = "Test Author"
        self.version = "0.0.1"
        self.release = "1"
    }
}



struct RGBScene : Codable, Identifiable {
    var id : String = UUID().uuidString
}


struct Model {
    private static let encoder =  JSONEncoder()
    private static let decoder = JSONDecoder()
    /// Copy and return any Codable Data Structure
    /// - Parameter anyCodable: any codable object
    /// - Returns: an identifical copy of the input
    static func copy<T : Codable>(_ anyCodable : T ) -> T? {
        do {
            let data = try encoder.encode(anyCodable)
            let identicalCopy = try decoder.decode(T.self, from: data)
            return identicalCopy
        } catch _ {
            return nil
        }
    }
}
