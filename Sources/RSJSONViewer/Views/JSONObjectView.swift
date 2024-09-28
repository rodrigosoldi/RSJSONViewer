//
//  JSONObjectView.swift
//  RSJSONViewer
//
//  Created by Rodrigo Soldi on 27/09/24.
//

import Foundation
import SwiftUI

struct JSONObjectView: @preconcurrency JSONElement {
    
    let properties: [(key: String, value: JSONElement)]
    
    @MainActor
    func render() -> AnyView {
        AnyView(
            List {
                ForEach(properties, id: \.key) { key, value in
                    value.renderCell(key: key)
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
                            Image(systemName: "list.bullet.rectangle")
                                .aspectRatio(contentMode: .fit)
                                .foregroundStyle(.placeholder)
                            
                            Text("Object")
                                .foregroundStyle(.placeholder)
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Text("\(properties.count) Key(s)")
                        .foregroundStyle(.orange)
                }
            }
        )
    }
    
}

struct JSONObjectView_Preview: PreviewProvider {
    static var previews: some View {
        let properties: [(key: String, value: JSONElement)] = [
            ("aaa", JSONStringView(value: "Soldi asijdhaishdaksj dajs hdashdiuashdiuawhidasoidhaosd oaisd oaisdoasi doias")),
            ("bbb", JSONNumberView(value: 777)),
            ("ccc", JSONArrayView(elements: [
                JSONNumberView(value: 1),
                JSONNumberView(value: 2),
                JSONNumberView(value: 3),
                JSONNumberView(value: 4),
                JSONNumberView(value: 5),
                JSONNumberView(value: 6),
                JSONNumberView(value: 7),
                JSONBoolView(value: false),
                JSONStringView(value: "Rodrigo")
            ])),
            ("dddd", JSONObjectView(properties: [
                ("fff", JSONStringView(value: "Rodrigo")),
                ("fff", JSONStringView(value: "Rodrigo")),
                ("fff", JSONStringView(value: "Rodrigo"))
            ])),
            ("eee", JSONBoolView(value: true))
        ]
        
        return NavigationView {
            JSONObjectView(properties: properties).render()
        }
    }
}
