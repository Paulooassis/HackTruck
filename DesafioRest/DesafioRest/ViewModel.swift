//
//  ViewModel.swift
//  DesafioRest
//
//  Created by Turma01-21 on 26/03/25.
//

import Foundation

// traz os dados da api

class ViewModel: ObservableObject{
    
    @Published var personagens : [HaPo] = []
    
    func fatch(){
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let parsed = try JSONDecoder().decode([HaPo].self, from: data)
                
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
