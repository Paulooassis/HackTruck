//
//  Desafio.swift
//  TestePUC
//
//  Created by Turma01-21 on 20/03/25.
//

import SwiftUI

struct Desafio: View {
    @State private var distancia : Double = 0
    @State private var horas : Double = 0
    @State private var calcular : Double = 0.0
    @State private var imagem : String = "interrogacao"
    @State private var cor : Color = .gray
    @State private var bool: Bool = false
    
    var body: some View {
        ZStack{
            cor.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                
                Text("Digite a distancia (km):")
                TextField("\(distancia)", value: $distancia, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
                    .frame(width: 260)
                
                Text("Digite o tempo (h):")
                TextField("\(horas)", value: $horas, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
                    .frame(width: 260)
                
                Button("Calcular") {
                    if distancia == 0 || horas == 0 {
                        
                        calcular = 0
                        
                        bool = true
                        
                    }else{
                        calcular = distancia / horas
                    }
                    cor = alterarCor(valor: calcular)
                    imagem = alterarImagem(valor: calcular)
                    
                }.padding(13)
                    .foregroundColor(.orange)
                    .background(Color.black)
                    .cornerRadius(10)
                
                Spacer()
                
                // alert avisadno que os valores sao improprios
                .alert(isPresented: $bool){
                            Alert(title: Text("Valores improprios"), dismissButton: .cancel(Text("voltar")))
                }
                
                // VStack com o valor da velocidade
                VStack{
                    Spacer().frame(height: 25)
                    Text("\(calcular, specifier: "%.2f") km/h").font(.system(size: 44))
                    Spacer()
                }

            }
            
            // VStack com a foto
            VStack{
                Spacer().frame(height: 55)
                Image("\(imagem)")
                    .resizable()
                    .clipShape(Circle(), style: FillStyle())
                    .frame(width: 250 ,height: 250)
            }
            
            // escrevendo a legenda
            VStack{
                Spacer().frame(height: 500)
                ZStack{
                    Rectangle().frame(width: 300, height: 150)
                        .cornerRadius(20)
                    HStack{
                        VStack{
                            Text("TARTARUGA (0 - 9.9 km/h)").foregroundStyle(.white)
                            Text("ELEFANTE (10 - 29.9 km/h)").foregroundStyle(.white)
                            Text("AVESTRUZ (30 - 69.9 km/h)").foregroundStyle(.white)
                            Text("LEÃO (70 - 89.9 km/h)").foregroundStyle(.white)
                            Text("GUEPARDO (90 - 130.0 km/h)").foregroundStyle(.white)
                        }
                        VStack{
                            Circle().frame(width: 12, height: 12).foregroundColor(.verdeClaro).padding(2)
                            Circle().frame(width: 12, height: 12).foregroundColor(.azulClaro).padding(2)
                            Circle().frame(width: 12, height: 12).foregroundColor(.laranjaClaro).padding(2)
                            Circle().frame(width: 12, height: 12).foregroundColor(.amareloClaro).padding(2)
                            Circle().frame(width: 12, height: 12).foregroundColor(.vermelhoClaro).padding(2)
                        }
                    }
                }
            }
            
            
        }
        
    }
}

func alterarCor(valor: Double) -> Color {
    if valor < 10 && valor > 0 {
        return Color(.verdeClaro)
    }else if valor >= 10 && valor < 30 {
        return Color(.azulClaro)
    }else if valor >= 30 && valor < 70 {
        return Color(.laranjaClaro)
    } else if valor >= 70 && valor < 90 {
        return Color(.amareloClaro)
    } else if valor >= 90 && valor <= 130 {
        return Color(.vermelhoClaro)
    }
    return Color.gray
}

func alterarImagem(valor: Double) -> String{
    if valor < 10 && valor > 0 {
        return "tartaruga"
    }else if valor >= 10 && valor < 30 {
        return "elefante"
    }else if valor >= 30 && valor < 70 {
        return "avestruz"
    } else if valor >= 70 && valor < 90 {
        return "leao"
    } else if valor >= 90 && valor <= 130 {
        return "guepardo"
    }
    return "interrogacao"
}

#Preview {
    Desafio()
}
