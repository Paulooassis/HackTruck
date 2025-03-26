//
//  ContentView.swift
//  DesafioRest
//
//  Created by Turma01-21 on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.red.edgesIgnoringSafeArea(.all)
                VStack{
                    AsyncImage(url: URL(string: "https://wallpapers.com/images/high/gryffindor-emblem-harry-potter-laptop-p5v5rg8gfmsr0ju3.webp")){ image in image
                        
                            .resizable()
                            .frame(width: 395, height: 260)
                            .aspectRatio(contentMode: .fill)
                            .padding(.bottom, 10)
                            .edgesIgnoringSafeArea(.all)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 200, height: 150)
                            .aspectRatio(contentMode: .fill)
                    }
                    
                    ScrollView{
                        ForEach(viewModel.personagens, id: \.id){personagem in
                            
                            NavigationLink(destination: InfoView(perso: personagem)){
                                
                                
                                VStack(){
                                    HStack{
                                        AsyncImage(url: URL(string: personagem.image!)){
                                            img in
                                            
                                            img.resizable()
                                                .frame(width: 100, height: 100, alignment: .leading)
                                                .clipShape(Circle())
                                                .padding(10)
                                        } placeholder: {
                                            Image(systemName: "photo.fill")
                                                .resizable()
                                                .frame(width: 100, height: 100, alignment: .leading)
                                                .clipShape(Circle())
                                        }
                                        
                                        
                                        Text(personagem.name!)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(10)
                                    }.padding(.leading, 30)
                                    
                                }
                            }.tint(.black)
                        }
                    }
                }
            }.onAppear(){
                viewModel.fatch()
            }
        }
    }
}

#Preview {
    ContentView()
}
