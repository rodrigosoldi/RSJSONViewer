//
//  JSONNumberView.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

struct JSONNumberView: @preconcurrency JSONElement {
    
    let value: Double
    
    func render() -> AnyView {
        AnyView(
            Text("\(value)")
                .foregroundColor(.blue)                
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
                            Image(systemName: "numbers.rectangle")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.secondary)
                            
                            Text("Number")
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
