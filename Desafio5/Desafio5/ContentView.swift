//
//  ContentView.swift
//  Desafio5
//
//  Created by Turma01-21 on 25/03/25.
//

import SwiftUI
import MapKit

struct localizacao: Hashable {
    var nome: String
    var foto: String
    var descricao: String
    var latitude: Double
    var longitude: Double
}

let locais: [localizacao] = [
    localizacao(
        nome: "Cristo Redentor",
        foto: "https://www3.al.sp.gov.br/repositorio/noticia/10-2011/cristo-redentor.jpg",
        descricao: "Uma das sete maravilhas do mundo moderno, o Cristo Redentor é uma estátua do Salvador localizada no Rio de Janeiro.",
        latitude: -22.9519,
        longitude: -43.2105
    ),
    localizacao(
        nome: "Iguaçu Falls",
        foto: "https://upload.wikimedia.org/wikipedia/commons/6/6e/Cataratas_do_Igua%C3%A7u_-_Panoramio.jpg",
        descricao: "As Cataratas do Iguaçu são um conjunto de quedas d'água situadas na fronteira entre Brasil e Argentina, em Foz do Iguaçu.",
        latitude: -25.6953,
        longitude: -54.4367
    ),
    localizacao(
        nome: "Amazônia",
        foto: "https://upload.wikimedia.org/wikipedia/commons/2/29/Amazon_rainforest.jpg",
        descricao: "A Amazônia é a maior floresta tropical do mundo, rica em biodiversidade e uma das principais fontes de oxigênio do planeta.",
        latitude: -3.4653,
        longitude: -62.2159
    ),
    localizacao(
        nome: "Pantanal",
        foto: "https://upload.wikimedia.org/wikipedia/commons/1/17/Pantanal_Mato_Grosso_Brasil.jpg",
        descricao: "O Pantanal é uma das maiores áreas úmidas do mundo e um dos melhores destinos para observação de fauna.",
        latitude: -16.5000,
        longitude: -56.0000
    ),
    localizacao(
        nome: "Lençóis Maranhenses",
        foto: "https://upload.wikimedia.org/wikipedia/commons/3/32/Lencois_Maranhenses_-_Dunas.jpg",
        descricao: "O Parque Nacional dos Lençóis Maranhenses é famoso por suas dunas de areia e lagoas de água doce que se formam durante a estação chuvosa.",
        latitude: -2.4786,
        longitude: -42.8031
    ),
    localizacao(
        nome: "Salvador",
        foto: "https://upload.wikimedia.org/wikipedia/commons/e/ed/Farol_da_Bahia.jpg",
        descricao: "A cidade de Salvador é famosa por sua cultura vibrante, arquitetura colonial e as festas de carnaval.",
        latitude: -12.9714,
        longitude: -38.5014
    ),
    localizacao(
        nome: "Ouro Preto",
        foto: "https://upload.wikimedia.org/wikipedia/commons/f/f3/Ouro_Preto_-_Panor%C3%A2mica_1.jpg",
        descricao: "Ouro Preto é uma cidade histórica de Minas Gerais, conhecida por sua arquitetura barroca e seu papel na história do Brasil colonial.",
        latitude: -20.3858,
        longitude: -43.5037
    )
]

struct ContentView: View {
    @State private var posicao = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -10.2350, longitude: -45.9253), span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
    )
    
    @State private var selectLocation = 0
    @State private var ativo = false
    @State private var localSelected : localizacao = locais[0]
    
    var body: some View {
        ZStack{
            
            
            

            ZStack(){
                    Rectangle()
                    .frame(width: 230, height: 70, alignment: .top)
                        .cornerRadius(20)
                        .foregroundColor(.brown)
                    
                    Picker(selection: $selectLocation, label: Text("Escolha a cidade")) {
                                ForEach(0..<locais.count, id: \.self) {
                                    Text(locais[$0].nome)
                              }
                    }.frame(width: 200)
                        .clipped()
                        .onChange(of: selectLocation) {
                            posicao = MapCameraPosition.region(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(latitude: locais[$0].latitude, longitude: locais[$0].longitude),
                                    span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
                            )
                        }
            }.offset(y: -340)
            .zIndex(1)
                
                
                Map(position: $posicao){
                    ForEach(locais, id: \.self){local in
                        Annotation(local.nome, coordinate: CLLocationCoordinate2D(latitude: local.latitude, longitude: local.longitude)){
                            
                            
                            Button{
                                ativo = true
                                localSelected = local
                            } label: {
                                Image(systemName: "mappin")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }.ignoresSafeArea()
                
                
            }.sheet(isPresented: $ativo){
                ZStack(alignment: .top){
                    Color.yellow.edgesIgnoringSafeArea(.all)
                    VStack(){
                        AsyncImage(url: URL(string: localSelected.foto)){ image in image
                                .resizable()
                                .frame(width: 200, height: 150)
                                .aspectRatio(contentMode: .fill)
                                .padding([.top], 30)
                        } placeholder: {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 200, height: 150)
                                .aspectRatio(contentMode: .fill)
                                .padding([.top], 30)
                        }
                        
                        VStack{
                            Text(localSelected.nome)
                                .padding(40)
                                .foregroundColor(.brown)
                        }
                        
                        ZStack{
                            
                            Rectangle()
                                .frame(width: 280, height: 400)
                                .foregroundColor(.brown)
                            
                            Text(localSelected.descricao)
                                .frame(width: 250, height: 380)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    
                }
            }
        
        
    }
}


#Preview {
    ContentView()
}
