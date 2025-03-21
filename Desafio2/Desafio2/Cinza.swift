//
//  Cinza.swift
//  Desafio2
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct Cinza: View {
    var body: some View {
        ZStack{
            Color.cinza.ignoresSafeArea(.all, edges: .top)
            
            Circle()
                .fill(Color.black)
                .frame(width: 300, height: 300)
            
            Image(systemName: "paintpalette")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(Color.cinza)
            
        }
    }
}

#Preview {
    Cinza()
}
