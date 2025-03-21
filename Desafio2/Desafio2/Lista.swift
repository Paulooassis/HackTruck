//
//  Lista.swift
//  Desafio2
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct Lista: View {
    var body: some View {
        NavigationStack{
            List{
                HStack{
                    NavigationLink(destination: Rosa()){
                        Text("Rosa")
                    }
                    
                    Spacer()
                    Image(systemName: "paintbrush")
                    
                }
                HStack{
                    NavigationLink(destination: Azul()){
                        Text("Azul")
                    }
                    Spacer()
                    Image(systemName: "paintbrush.pointed")
                }
                HStack{
                    NavigationLink(destination: Cinza()){
                        Text("Cinza")
                    }
                    Spacer()
                    Image(systemName: "paintpalette")
                }
            }.navigationTitle("Lista")
        }
    }
}

#Preview {
    Lista()
}
