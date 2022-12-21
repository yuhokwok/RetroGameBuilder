//
//  DialogueEditor.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 1/12/2022.
//

import SwiftUI

struct DialogueEditorView : View {
    var body: some View {
        VStack {
            VStack {
                Text("Dialogue Review")
                Text("66 Lines")
                Text("310 Words")
            }
            VStack {
                Text("310 Words")
                Text("310 Words")
                Text("310 Words")
                Text("310 Words")
                Spacer()
            }.background(.gray)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
