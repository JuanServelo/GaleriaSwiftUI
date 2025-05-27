//
//  ObraDeArte.swift
//  SwiftUIGaleriaCuritibana
//
//  Created by user276508 on 22/05/25.
//

import Foundation

struct ObraDeArte: Identifiable {
    let id = UUID()
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}
