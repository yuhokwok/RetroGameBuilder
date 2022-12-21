//
//  ToolBarView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 16/11/2022.
//

import SwiftUI

struct ToolBarView : View {

    
    @Binding var editorState : EditorState

    @State var searchText = ""
    
    var body: some View {
        HStack {
            
            Picker(selection: $editorState.editorIndex, content: {
                Text("Game World").tag(0)
                Text("Sprites").tag(1)
                Text("Backgrounds").tag(2)
                Text("Music").tag(3)
                Text("Palettes").tag(4)
                Text("Dialogue Review").tag(5)
                Text("Build & Run").tag(6)
                Text("Settings").tag(7)
            }, label: { Text("選擇角色") } )
            .pickerStyle(.menu)
            .frame(width: 200)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
            }
            
            
            Picker(selection: $editorState.zoomIndex, content: {
                Text("25%").tag(0)
                Text("50%").tag(1)
                Text("75%").tag(2)
                Text("100%").tag(3)
                Text("125%").tag(4)
                Text("150%").tag(5)
                Text("200%").tag(6)
                Text("300%").tag(7)
                Text("400%").tag(8)
                Text("Fit Slide").tag(9)
            }, label: { Text("Scale") } )
            .pickerStyle(.menu)
            .frame(width: 150)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.1))
            }

            Spacer()
            
            TextField("Search", text: $searchText)
                .frame(width: 200)
                .textFieldStyle(.roundedBorder)
            
            
            Button(action: { }, label: {
                Image(systemName: "folder")
            })
            .buttonStyle(.bordered)

            Button(action: { }, label: {
                Image(systemName: "square.and.arrow.up")
            })
            .buttonStyle(.bordered)
            
            Button(action: { }, label: {
                Image(systemName: "play.fill")
            })
            .buttonStyle(.bordered)
            .padding(5)
            .padding([.leading, .trailing])
        }.padding()
    }
}

struct ToolBarView_Preview : PreviewProvider {
    @State static var editorState = EditorState()
    static var previews: some View {
        return ToolBarView(editorState: $editorState )
    }
}
