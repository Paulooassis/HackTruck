//
//  Modo1.swift
//  Desafio3
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct Modo1: View {
    var body: some View {
        ZStack(alignment: .top){
            Color.azul.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Modulo 1")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                Spacer().frame(height: 250)
                
                ZStack(alignment: .center){
                    Rectangle().frame(width: 250, height: 100).foregroundColor(.pink).cornerRadius(12)
                    
                    VStack{
                        Text("Nome: Paulo").foregroundStyle(.white)
                        Text("Sobrenome: Assis").foregroundStyle(.white)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Modo1()
}
