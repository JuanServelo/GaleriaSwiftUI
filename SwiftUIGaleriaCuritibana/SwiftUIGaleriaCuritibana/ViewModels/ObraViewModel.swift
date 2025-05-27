//
//  Untitled.swift
//  SwiftUIGaleriaCuritibana
//
//  Created by user276508 on 22/05/25.
//

import Foundation
import Combine

class ObraViewModel: ObservableObject {
    @Published var obras: [ObraDeArte]
    @Published var busca: String = ""

    init() {
        // Carrega os dados do gerenciador centralizado
        self.obras = GerenciadorDados.compartilhado.obras
    }

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

