//
//  ObraDeArte.swift
//  SwiftUIGaleriaCuritibana
//
//  Created by user276508 on 22/05/25.
//
//  Define o modelo de dados para representar uma obra de arte.
//
import Foundation
// Struct que representa uma obra de arte.
struct ObraDeArte: Identifiable {
    let id = UUID()// Identificador único gerado automaticamente
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}
