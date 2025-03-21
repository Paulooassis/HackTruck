//
//  Modo3.swift
//  Desafio3
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct Modo3: View {
    var nome = ""

    
    var body: some View {
        ZStack(alignment: .top){
            Color.azul.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Modulo 2")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Spacer().frame(height: 250)
                
                ZStack(alignment: .center){
                    Rectangle().frame(width: 250, height: 100).foregroundColor(.pink).cornerRadius(12)
                    
                    VStack{
                        Text("Volte,  \(nome)").foregroundStyle(.white)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Modo3(nome: "")
}
