//
//  DetalhesObraView.swift
//  SwiftUIGaleriaCuritibana
//
//  Created by user276508 on 22/05/25.
//

import SwiftUI

/// View responsável por exibir os detalhes de uma obra de arte selecionada.
struct DetalhesObraView: View {
    // Objeto do tipo ObraDeArte a ser exibido
    let obra: ObraDeArte

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Imagem da obra com estilo visual aprimorado
                Image(obra.imagemNome)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity) // Permite que a imagem ocupe toda a largura disponível
                    .padding()
                    .background(Color.gray.opacity(0.1)) // Fundo leve para destacar a imagem
                    .clipShape(RoundedRectangle(cornerRadius: 16)) // Bordas arredondadas

                // Título da obra
                Text(obra.titulo)
                    .font(.largeTitle)
                    .bold()

                // Nome do artista
                Text("Artista: \(obra.artista)")
                    .font(.title3)

                // Ano de criação
                Text("Ano: \(obra.ano)")
                    .font(.title3)

                // Estilo artístico da obra
                Text("Estilo: \(obra.estilo)")
                    .font(.title3)

                // Separador visual
                Divider()

                // Descrição detalhada da obra ou do artista
                Text(obra.descricao)
                    .font(.body)
                    .multilineTextAlignment(.leading) // Alinhamento à esquerda para melhor leitura
            }
            .padding() // Espaçamento interno para todo o conteúdo
        }
        .navigationTitle("Detalhes da Obra") // Título da tela na barra de navegação
        .transition(.opacity.combined(with: .move(edge: .trailing))) // Animação de transição suave
    }
}
