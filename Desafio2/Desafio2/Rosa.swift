//
//  Rosa.swift
//  Desafio2
//
//  Created by Turma01-21 on 21/03/25.
//

import SwiftUI

struct Rosa: View {
    var body: some View {
        
        ZStack{
            Color.rosa.ignoresSafeArea(.all, edges: .top)
            
            Circle()
                .fill(Color.black)
                .frame(width: 300, height: 300)
            
            Image(systemName: "paintbrush")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(Color.rosa)
            
        }
        
    }
}

#Preview {
    Rosa()
}
