//
//  JSONArrayView.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

struct JSONArrayView: @preconcurrency JSONElement {
    
    let elements: [JSONElement]
    
    @MainActor
    func render() -> AnyView {
        AnyView(
            List {
                ForEach(Array(zip(elements.indices, elements)), id: \.0) { index, value in
                    value.renderCell(key: "[\(index)]")
                }
            }
            .listStyle(InsetGroupedListStyle())
        )
    }
        
    @MainActor
    func renderCell(key: String) -> AnyView {
        
        AnyView (
            NavigationLink(destination: render().navigationTitle(key)) {
                HStack {
                    VStack {
                        Text("\(key)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            Image(systemName: "square.stack")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.secondary)
                            
                            Text("Array")
                                .foregroundStyle(.placeholder)
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Text("[\(elements.count)] Item(s)")
                        .foregroundStyle(.brown)
                }
            }
        )
    }
    
}
