//
//  MessageField.swift
//  HHS MAD 2023
//
//  Created by Julian NTH on 3/11/23.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @Binding var messageArray: Array<String>
    @Binding var message: String

    var body: some View {
        HStack {
            // Custom text field created below
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
//                .frame(height: 52)
//                .disableAutocorrection(true)

            Button {
               
                messagesManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.green)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}


struct BugMessageField: View {
    @EnvironmentObject var messagesManager: BugManager
    @Binding var messageArray: Array<String>
    @Binding var message: String

    var body: some View {
        HStack {
            // Custom text field created below
            CustomTextField(placeholder: Text("Enter your message here"), text: $message)
//                .frame(height: 52)
//                .disableAutocorrection(true)

            Button {
               
                messagesManager.sendMessage(text: message)
                messagesManager.sendReceiveMessage(text: "Received! We will get look at your issue and update you as soon as possible.")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.green)
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

//struct MessageField_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageField()
//
//    }
//}

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            // If text is empty, show the placeholder on top of the TextField
            if text.isEmpty {
                placeholder
                .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
