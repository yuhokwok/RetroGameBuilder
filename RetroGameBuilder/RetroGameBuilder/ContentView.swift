//
//  ContentView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 8/7/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var columnVisibility =
    NavigationSplitViewVisibility.doubleColumn
    
    @State var project = Project.sampleProject
    @State var editorState = EditorState()
    
    @State private var offset = CGSize(width: 50, height: 50)
    
    
    
    var body: some View {
        
        VStack {
            ToolBarView(editorState: $editorState)
            HStack {
   
                switch editorState.editorIndex {
                case 0:
                    GameWorldEditorView(project: $project).padding(0)
                case 5:
                    DialogueEditorView()
                default:
                    Text("Editor: \(editorState.editorIndex)")
                }
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
//
//        NavigationSplitView(columnVisibility: $columnVisibility, sidebar: {
//            SideBarView(project: $project)
//                .toolbar {
//                    ToolbarItem(placement:. navigationBarLeading) {
//                        Button(action: {
//                            withAnimation {
//                                //project.scenes.append($project)
//                            }
//                        }, label: {
//                            Image(systemName: "plus.app")
//                        })
//                    }
//                }
//        }, detail: {
//            VStack {
//
//                HStack {
//
//                    switch editorState.editorIndex {
//                    case 0:
//                        GameWorldEditorView(project: $project).padding(0)
//                    case 5:
//                        DialogueEditorView()
//                    default:
//                        Text("Editor: \(editorState.editorIndex)")
//                    }
//
//                }.frame(
//                    minWidth: 0,
//                    maxWidth: .infinity,
//                    minHeight: 0,
//                    maxHeight: .infinity,
//                    alignment: .topLeading
//                )
//
//            }.toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    ToolBarView(editorState: $editorState)
//                }
//            }
//        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
