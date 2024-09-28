//
//  ContentView.swift
//  RSJSONViewerExample
//
//  Created by Rodrigo Soldi on 28/09/24.
//

import SwiftUI
import RSJSONViewer

let json = """
{
  "name": "John Doe",
  "age": 30,
  "isEmployed": true,
  "salary": 55000.75,
  "hobbies": ["reading", "traveling", "swimming"],
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "postalCode": 12345
  },
  "previousJobs": [
    {
      "title": "Software Developer",
      "years": 2,
      "company": "Tech Corp",
      "isRemote": false
    },
    {
      "title": "Web Designer",
      "years": 1,
      "company": "Design Studio",
      "isRemote": true
    }
  ],
  "certifications": null,
  "languages": ["English", "Spanish"],
  "metadata": {
    "createdDate": "2024-09-27T10:00:00Z",
    "updatedDate": null,
    "isVerified": true
  },
  "scores": [99, 87, 92.5, 88],
  "preferences": {
    "notifications": {
      "email": true,
      "sms": false,
      "push": true
    },
    "theme": "dark",
    "fontSize": 14
  }
}
"""

struct ContentView: View {
    var body: some View {
        RSJSONViewer(json: json)
    }
}

#Preview {
    ContentView()
}
