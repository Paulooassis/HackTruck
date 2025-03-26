//
//  InfoView.swift
//  DesafioRest
//
//  Created by Turma01-21 on 26/03/25.
//

import SwiftUI

struct InfoView: View {
    @State var perso: HaPo
    
    var body: some View {
        
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            
            VStack{
                AsyncImage(url: URL(string: perso.image!)){
                    img in
                    
                    img.resizable()
                        .frame(width: 200 ,height: 200)
                } placeholder: {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .leading)
                        .clipShape(Circle())
                }
                
                Text(perso.name!)
                
                Text(perso.house!)
            }
        }
        
    }
}
