//
//  JSONBoolView.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

struct JSONBoolView: @preconcurrency JSONElement {
    
    let value: Bool
    
    func render() -> AnyView {
        AnyView(
            Text("\(value)")
                .foregroundColor(.red)
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
                            Image(systemName: "circle.grid.2x1.left.filled")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.secondary)
                            
                            Text("Bool")
                                .foregroundStyle(.placeholder)
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    render()
                }
            }
        )
    }
    
}
