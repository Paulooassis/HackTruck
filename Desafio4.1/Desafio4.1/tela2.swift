//
//  tela2.swift
//  Desafio4.1
//
//  Created by Turma01-21 on 24/03/25.
//

import SwiftUI

struct tela2: View {
    var item: musica
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                AsyncImage(url: URL(string: item.capa)) { image in
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fill)
                        .padding([.leading])
                } placeholder: {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .padding([.leading])
                }
                
                Text(item.nome)
                    .foregroundStyle(.white)
                    .bold()
                    .font(.system(size: 23))
                Text(item.musico)
                    .foregroundStyle(.white)
                
                HStack(spacing: 25){
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }.padding(70)
                .font(.system(size: 45))
                    .foregroundColor(.white)
            }
            
           
            
        }
    }
}

#Preview {
    tela2(item : musicas[0])
}
