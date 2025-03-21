//
//  ContentView.swift
//  Desafio2
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            TabView{
                Rosa()
                    .badge(1)
                    .tabItem { Label("Rosa", systemImage: "paintbrush.fill")
                    }
                Azul()
                    .badge(1)
                    .tabItem { Label("Azul", systemImage:"paintbrush.pointed.fill") }
                Cinza()
                    .badge(1)
                    .tabItem { Label("Cinza", systemImage:"paintpalette") }
                Lista()
                    .badge(1)
                    .tabItem { Label("Lista", systemImage:"list.bullet") }
            }
        }
    }
}

#Preview {
    ContentView()
}
