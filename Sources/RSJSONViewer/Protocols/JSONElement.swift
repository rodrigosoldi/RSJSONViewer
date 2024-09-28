//
//  JSONElement.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

protocol JSONElement {    
    @ViewBuilder func render() -> AnyView
    @ViewBuilder func renderCell(key: String) -> AnyView
}
