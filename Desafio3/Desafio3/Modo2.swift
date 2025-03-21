//
//  Modo2.swift
//  Desafio3
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct Modo2: View {
    @State var nome = ""
    
    var body: some View {
        ZStack(alignment: .top){
            Color.azul.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Modulo 2")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(30)
                
                Spacer().frame(height: 250)
                
                ZStack(alignment: .center){
                    Rectangle().frame(width: 250, height: 150).foregroundColor(.pink).cornerRadius(12)
                    
                    VStack{
                        Text("Bem Vindo, \(nome)").foregroundStyle(.white)
                            .font(.system(size: 20))
                            .padding(5)
                        TextField("Digite o nome: ", text: $nome).multilineTextAlignment(.center)
                            
                        
                        ZStack{
                            Rectangle().frame(width: 130, height: 40)
                                .cornerRadius(20).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                            NavigationLink(destination: Modo3(nome: nome)){
                                Text("Acessar tela").foregroundStyle(.white)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Modo2()
}
