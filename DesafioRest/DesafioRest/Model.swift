//
//  Model.swift
//  DesafioRest
//
//  Created by Turma01-21 on 26/03/25.
//

import Foundation

// struct com as informacoes que serao recebidas

struct HaPo : Decodable, Identifiable{
    let id: String
    let name: String?
    let house: String?
    let wand: Wand
    let image: String?
}

struct Wand: Codable{
    let wood: String?
    let core: String?
    let length: Double?
}
