//
//  FieldsDecode.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/26/24.
//

import Foundation

struct Fields : Codable {
    var elements : [[String : String]] = [[:]]
}

struct JSONDecoding {
    public func getJSON() -> Fields {
        var data = Fields()
        do {
            let jsonFile = try String(contentsOfFile: Bundle.main.path(forResource: "Untitled", ofType: "json") ?? "")
            data = try! JSONDecoder().decode(Fields.self, from: jsonFile.data(using: .utf8) ?? Data())
            for i in data.elements {
                print(i)
            }
            return data
        }
        catch {
            print("error occured")
        }
        return data
    } 
    public func getArray(stringArray : String) -> [String] {
        var array : [String] = []
        for char in stringArray {
            var j = 0;
            if (char != Character(",")) {
                array[j].append(String(char))
            }
            else {
                j += 1
            }
        }
        return array
    }
}
