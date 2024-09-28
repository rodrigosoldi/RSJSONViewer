//
//  File.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

struct JSONNullView: @preconcurrency JSONElement {
    
    @MainActor
    func render() -> AnyView {
        AnyView(
            Text("null")
                .foregroundColor(.purple)
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
                            Image(systemName: "lanyardcard.fill")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.secondary)
                            
                            Text("Null")
                                .foregroundStyle(.placeholder)
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    render()
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
            }
        )
    }
    
}
