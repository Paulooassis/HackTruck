//  ContentView.swift
//  desafioRedNode
//
//  Created by Turma01-21 on 27/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.paises, id: \.self) { pais in
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: pais.foto!)) { image in
                                switch image {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 40)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 60, height: 40)
                                        .foregroundColor(.gray)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text(pais.nome!)
                                    .font(.headline)
                                    .foregroundColor(.black)
                                
                                Text(pais.descricao!)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                            }
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(radius: 2)
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.fatch()
            }
        }
    }
}

#Preview {
    ContentView()
}
