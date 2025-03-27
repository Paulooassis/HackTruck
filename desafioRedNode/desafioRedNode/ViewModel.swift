//
//  ViewModel.swift
//  desafioRedNode
//
//  Created by Turma01-21 on 27/03/25.
//

import Foundation

class ViewModel: ObservableObject{
    
    @Published var paises : [Paises] = []
    
    func fatch(){
        guard let url = URL(string: "http://127.0.0.1:1880/getPaulo") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([Paises].self, from: data)
                
                DispatchQueue.main.async {
                    self?.paises = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
