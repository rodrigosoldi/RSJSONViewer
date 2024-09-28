//
//  JSONElementFactory.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation

struct JSONElementFactory {
    static func create(from object: Any) -> JSONElement? {
        if let dictionary = object as? [String: Any] {
            let properties = dictionary.map { (key: $0.key, value: create(from: $0.value)!) }
            return JSONObjectView(properties: properties)
        } else if let array = object as? [Any] {
            let elements = array.compactMap { create(from: $0) }
            return JSONArrayView(elements: elements)
        } else if let string = object as? String {
            return JSONStringView(value: string)
        } else if let bool = object as? Bool {
            return JSONBoolView(value: bool)
        } else if let number = object as? Double {
            return JSONNumberView(value: number)
        } else if object is NSNull {
            return JSONNullView()
        } else {
            return nil
        }
    }
}
