//
//  Untitled.swift
//  SwiftUIGaleriaCuritibana
//
//  Created by user276508 on 22/05/25.
//
//  ViewModel responsável por gerenciar o estado das obras de arte e a lógica de busca.
//
import Foundation
import Combine

class ObraViewModel: ObservableObject {
    // MARK: - Publicações Observáveis
    // Lista de obras que será exibida na interface.
    @Published var obras: [ObraDeArte] 
    // Texto digitado pelo usuário no campo de busca.
    @Published var busca: String = ""

    // MARK: - Inicialização
    // Inicializador que carrega as obras do gerenciador de dados compartilhado.
    init() {
        self.obras = GerenciadorDados.compartilhado.obras
    }

    // MARK: - Obras Filtradas
    // Computed property que retorna as obras filtradas com base no texto de busca.
    var obrasFiltradas: [ObraDeArte] {
        if busca.isEmpty {
            return obras
        } else {
            return obras.filter {
                $0.titulo.localizedCaseInsensitiveContains(busca) ||
                $0.artista.localizedCaseInsensitiveContains(busca)
            }
        }
    }
}

