//
//  ScenesEditorView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 1/12/2022.
//

import SwiftUI

struct GameWorldEditorView : View {
    
    @Binding var project : Project
    
    var body: some View {
        
        HStack {
            
            HStack {
                SideBarView(project: $project)
            }.frame(
                minWidth: 0,
                maxWidth: 200,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background()
            
            HStack {
                
                SceneEditorView(project: $project).padding(0)
                
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
            HStack {
                ScenesInspectorView()
            }.frame(
                minWidth: 0,
                maxWidth: 200,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background()
            
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        
    }
}

