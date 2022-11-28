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
    
    @State var project = RGBProject()
    
    
    var body: some View {
        
        NavigationSplitView(columnVisibility: $columnVisibility, sidebar: {
            SideBarView(scenes: $project.scenes)
                .toolbar {
                    ToolbarItem(placement:. navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                project.scenes.append(RGBScene())
                            }
                        }, label: {
                            Image(systemName: "plus.app")
                        })
                    }
                }
        }, detail: {
            VStack {
                
                HStack {
                    
                    
                    HStack {
                        EditorView()
                    }.frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .topLeading
                      )
                    
                    HStack {
                        InspectorView()
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
                  
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolBarView()
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
