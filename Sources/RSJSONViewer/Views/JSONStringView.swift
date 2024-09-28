//
//  JSONStringView.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

struct JSONStringView: @preconcurrency JSONElement {
    
    let value: String
    
    func render() -> AnyView {
        AnyView(
            Text("\"\(value)\"")
                .foregroundColor(.green)
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
                            Image(systemName: "text.redaction")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.secondary)
                            
                            Text("String")
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

struct JSONStringView_Preview: PreviewProvider {
    static var previews: some View {
        return NavigationView {
            JSONStringView(value: "Soldi").render()
        }
    }
}
