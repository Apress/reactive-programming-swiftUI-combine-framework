//
//  Form.swift
//  CombineMe
//
//  Created by Swift Developer on 8/9/20.
//

import SwiftUI

struct FormView: View {
    @State var username: String = ""
    @State var isPrivate: Bool = true
    
    @State var notificationsEnabled: Bool = false
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Username", text: $username)
                    Toggle(isOn: $isPrivate) {
                        Text("Private Account")
                    }
                }
                Section(header: Text("NOTIFICATIONS")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Text("Enabled")
                    }
                    Picker(selection: $previewIndex, label: Text("Show Previews")) {
                        ForEach(0 ..< previewOptions.count) {
                            Text(self.previewOptions[$0])
                        }
                    }
                }
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.2.1")
                    }
                }
                Section {
                    Button(action: {
                        print("Perform an action here...")
                    }) {
                        Text("Reset All Settings")
                    }
                }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FormView()
                .previewDevice("iPhone 12 Pro Max")
                .previewDisplayName("iPhone Big")
            
            FormView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
            
            FormView()
                .previewDevice("iPhone 12 mini")
                .previewDisplayName("iPhone mini")
                .environment(\.colorScheme, .dark)
        }
    }
}
