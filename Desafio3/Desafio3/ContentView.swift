//
//  ContentView.swift
//  Desafio3
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var ativo = false
    var body: some View {
        NavigationStack{
            ZStack{
                Color.azul.edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack(alignment: .center){
                        Rectangle().frame(width: 250, height: 100).foregroundColor(.pink).cornerRadius(12)
                        NavigationLink(destination: Modo1()){
                            Text("Modulo 1").foregroundStyle(.white)
                        }
                    }
                    
                    ZStack(alignment: .center){
                        Rectangle().frame(width: 250, height: 100).foregroundColor(.pink).cornerRadius(12)
                        NavigationLink(destination: Modo2()){
                            Text("Modulo 2").foregroundStyle(.white)
                        }
                    }
                    
                    ZStack(alignment: .center){
                        Rectangle().frame(width: 250, height: 100).foregroundColor(.pink).cornerRadius(12)
                        
                        Button (action: {ativo = true}){
                            Text("Modulo 3")
                        }.foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $ativo){
                ModalView()
            }
        }
        
    }
}

struct ModalView : View{
    var body : some View{
        ZStack(alignment: .top){
            Color.azul.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Sheet View")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(30)
                    .font(.system(size: 25))
                
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
    ContentView()
}
