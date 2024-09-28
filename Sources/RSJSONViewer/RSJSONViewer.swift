// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct RSJSONViewer: View {
    
    private let jsonData: Data
    private let navigationTitle: String
    
    public init(json: String, navigationTitle: String = "RSJSONViewer") {
        self.jsonData = json.data(using: .utf8) ?? Data()
        self.navigationTitle = navigationTitle
    }
    
    public var body: some View {
        NavigationView {
            if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []),
               let element = JSONElementFactory.create(from: jsonObject) {
                element.render()
                    .navigationTitle(navigationTitle)
            } else {
                Text("Invalid JSON")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
    
}

#Preview {
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
    RSJSONViewer(json: json)
}
