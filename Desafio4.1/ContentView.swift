//
//  ContentView.swift
//  Desafio4
//
//  Created by Turma01-21 on 24/03/25.
//

import SwiftUI
    

var musicas = [
    musica(id: 1, nome: "Bohemian Rhapsody", musico: "Queen", capa: "https://cdn-images.dzcdn.net/images/cover/8b8fc5d117f9357b79f0a0a410a170e8/500x500-000000-80-0-0.jpg"),
    musica(id: 2, nome: "Imagine", musico: "John Lennon", capa: "https://upload.wikimedia.org/wikipedia/pt/9/9c/John_Lennon_-_Imagine.jpg"),
    musica(id: 3, nome: "Shape of You", musico: "Ed Sheeran", capa: "https://upload.wikimedia.org/wikipedia/pt/thumb/3/35/Ed_Sheeran_-_Shape_of_You.png/440px-Ed_Sheeran_-_Shape_of_You.png"),
    musica(id: 4, nome: "Billie Jean", musico: "Michael Jackson", capa: "https://as2.ftcdn.net/jpg/01/25/64/11/1000_F_125641180_KxdtmpD15Ar5h8jXXrE5vQLcusX8z809.jpg"),
    musica(id: 5, nome: "Smells Like Teen Spirit", musico: "Nirvana", capa: "https://pt.wikipedia.org/wiki/Ficheiro:Smells_Like_Teen_Spirit.jpg"),
    musica(id: 6, nome: "Rolling in the Deep", musico: "Adele", capa: "https://s2-g1.glbimg.com/yyi94LJL7R007_TNou0xhAfwjBo=/0x0:300x400/1000x0/smart/filters:strip_icc()/s.glbimg.com/jo/g1/f/original/2012/04/11/simpsons2.jpg"),
    musica(id: 7, nome: "Like a Rolling Stone", musico: "Bob Dylan", capa: "https://tm.ibxk.com.br/2023/11/02/02090558160010.jpg?ims=704x264"),
    musica(id: 8, nome: "Hotel California", musico: "Eagles", capa: "https://upload.wikimedia.org/wikipedia/pt/a/a6/HotelCalifornia.jpg"),
    musica(id: 9, nome: "Hey Jude", musico: "The Beatles", capa: "https://upload.wikimedia.org/wikipedia/pt/thumb/a/a0/Hey_Jude_%28The_Beatles%29.png/300px-Hey_Jude_%28The_Beatles%29.png"),
    musica(id: 10, nome: "Stairway to Heaven", musico: "Led Zeppelin", capa: "https://upload.wikimedia.org/wikipedia/pt/thumb/7/7b/Led_Zeppelin_-_Stairway_to_Heaven.jpg/250px-Led_Zeppelin_-_Stairway_to_Heaven.jpg"),
    musica(id: 11, nome: "Smells Like Teen Spirit", musico: "Nirvana", capa: "https://upload.wikimedia.org/wikipedia/pt/6/60/Smells_Like_Teen_Spirit%2C_single%2C_Nirvana.jpg"),
    musica(id: 12, nome: "Back in Black", musico: "AC/DC", capa: "https://upload.wikimedia.org/wikipedia/pt/3/35/AC_DC_Back_in_Black.png"),
    musica(id: 13, nome: "Hallelujah", musico: "Leonard Cohen", capa: "https://upload.wikimedia.org/wikipedia/pt/0/0c/Hallelujah_%28Leonard_Cohen%29.jpg"),
    musica(id: 14, nome: "Let It Be", musico: "The Beatles", capa: "https://upload.wikimedia.org/wikipedia/pt/0/06/Let_It_Be_%28The_Beatles%29.jpg"),
    musica(id: 15, nome: "Bohemian Rhapsody", musico: "Queen", capa: "https://upload.wikimedia.org/wikipedia/pt/e/e0/Bohemian_Rhapsody_-_Queen.jpg")
]
    
struct ContentView : View {
    var body: some View {
        
        @State var albuns = [
            album(id:1, titulo: "The Dark Side of the Moon", capa: "https://upload.wikimedia.org/wikipedia/commons/a/a2/Pink_Floyd_-_The_Dark_Side_of_the_Moon.png"),
                album(id:2, titulo: "Abbey Road", capa: "https://upload.wikimedia.org/wikipedia/pt/e/e6/Abbey_Road_2019.jpg"),
                album(id:3, titulo: "Lemonade", capa: "https://upload.wikimedia.org/wikipedia/pt/e/e3/Beyonc%C3%A9_-_Lemonade.png"),
                album(id:4, titulo: "Born to Die", capa: "https://upload.wikimedia.org/wikipedia/pt/3/3c/Lana_Del_Rey_-_Born_to_Die.png"),
                album(id:5, titulo: "Random Access Memories", capa: "https://upload.wikimedia.org/wikipedia/commons/a/a7/Daft_Punk_-_Random_Access_Memories.png")
            ]
        
        NavigationStack{
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                ScrollView(){
                    VStack{
                    Image("truckzao")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .padding([.top], 40)
                    
                    Text("HackaFM")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading], 20)
                    
                    HStack{
                        Image("truckzao")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding([.leading, .bottom])
                        
                        Text("HackaSong")
                            .foregroundStyle(Color.white)
                            .padding([.bottom])
                        
                        Spacer()
                    }
                    
                    
                        VStack{
                            ForEach(musicas, id: \.id) {mus in
                                
                                NavigationLink(destination: tela2(item: mus)){
                                    HStack{
                                        AsyncImage(url: URL(string: mus.capa)) { image in
                                            image
                                                .resizable()
                                                .frame(width: 45, height: 45)
                                                .aspectRatio(contentMode: .fill)
                                                .padding([.leading])
                                        } placeholder: {
                                            Image(systemName: "photo.fill")
                                                .resizable()
                                                .foregroundColor(.white)
                                                .frame(width: 45, height: 45)
                                                .padding([.leading])
                                        }
                                        
                                        VStack{
                                            Text(mus.nome)
                                                .foregroundStyle(.white)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .bold()
                                            Text(mus.musico)
                                                .foregroundStyle(.white)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .font(.system(size: 15))
                                        }
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 2){
                                            Circle().frame(width: 5, height: 5).foregroundColor(.white)
                                            Circle().frame(width: 5, height: 5).foregroundColor(.white)
                                            Circle().frame(width: 5, height: 5).foregroundColor(.white)
                                        }.padding(10)
                                    }
                                }
                            }
                        }
                        
                        Text("Sugeridos")
                            .foregroundStyle(.white)
                            .font(.system(size:30))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.top], 40)
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(albuns, id: \.id) {alb in
                                    VStack{
                                        AsyncImage(url: URL(string: alb.capa)) { image in
                                            image
                                                .resizable()
                                                .frame(width: 140, height: 140)
                                                .aspectRatio(contentMode: .fill)
                                                .padding([.leading])
                                        } placeholder: {
                                            Image(systemName: "photo.fill")
                                                .resizable()
                                                .foregroundColor(.white)
                                                .frame(width: 140, height: 140)
                                                .padding([.leading])
                                        }
                                        
                                        Text("\(alb.id) -  \(alb.titulo)").foregroundStyle(.white)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.tint(.white)
    }
}


struct album : Identifiable {
    var id: Int
    var titulo: String
    var capa: String
}

struct musica : Identifiable{
    var id : Int
    var nome: String
    var musico: String
    var capa: String
}

#Preview {
    ContentView()
}
