//
//  ContentView.swift
//  SwiftUIGaleriaCuritibana
//
//  Created by user276508 on 20/05/25.
//
//  Tela principal que exibe a galeria de obras com funcionalidade de busca.
//
import SwiftUI

// MARK: - ContentView
// Estrutura principal da tela de exibição da galeria de arte.
// Exibe uma lista filtrada de obras, com busca e navegação para detalhes da obra.
struct ContentView: View {
  
  // MARK: - Propriedades
  // @StateObject é usado para criar e gerenciar o ciclo de vida do ViewModel.
  // Esse ViewModel contém os dados e a lógica necessária para exibir as obras.
  @StateObject private var viewModel = ObraViewModel()
  
  // Definindo a configuração das colunas do grid. A grid será adaptativa,
  // ou seja, o número de colunas se ajusta dependendo da largura da tela.
  let colunas = [
      GridItem(.adaptive(minimum: 120), spacing: 16)
  ]
  
  // MARK: - Corpo da View
  // A view principal da ContentView, que é exibida na tela.
  var body: some View {
      // Utilização do NavigationStack para possibilitar a navegação entre views.
      NavigationStack {
          
          // VStack para organizar os componentes verticalmente.
          VStack {
              
              // MARK: - Campo de Busca
              // Campo de texto para o usuário buscar por título ou artista.
              TextField("Buscar por título ou artista", text: $viewModel.busca)
                  .textFieldStyle(RoundedBorderTextFieldStyle()) // Aplica o estilo arredondado ao campo de texto.
                  .padding() // Adiciona um padding ao redor do campo para evitar que encoste nas bordas.
              
              // MARK: - Galeria de Obras
              // ScrollView permite a rolagem da galeria de obras de arte.
              ScrollView {
                  
                  // LazyVGrid exibe as obras em uma grid flexível.
                  // A grid se adapta ao tamanho da tela e mostra o número de colunas necessárias.
                  LazyVGrid(columns: colunas, spacing: 16) {
                      
                      // Itera sobre cada obra filtrada com base no valor da busca do viewModel.
                      ForEach(viewModel.obrasFiltradas) { obra in
                          
                          // NavigationLink cria uma navegação para a tela de detalhes da obra.
                          NavigationLink(destination: DetalhesObraView(obra: obra)) {
                              
                              // MARK: - Conteúdo da Célula de Obra
                              // Exibe o conteúdo de cada obra dentro da célula da grid.
                              VStack {
                                  
                                  // Exibe a imagem da obra de arte.
                                  Image(obra.imagemNome)
                                      .resizable() // Permite redimensionar a imagem.
                                      .scaledToFit() // A imagem mantém sua proporção original.
                                      .aspectRatio(1, contentMode: .fit) // A imagem ocupa o máximo possível, mantendo a proporção.
                                      .frame(minHeight: 100) // Define a altura mínima da imagem.
                                      .padding() // Adiciona um padding em volta da imagem para separar dos outros elementos.
                                      .background(Color.blue.opacity(0.1)) // Fundo azul sutil para dar destaque à imagem.
                                      .clipShape(RoundedRectangle(cornerRadius: 12)) // Canto arredondado na imagem.
                                      .shadow(radius: 2) // Sombra suave para dar um efeito de profundidade.
                                      .scaleEffect(1.0) // Não aplica alteração no fator de escala.
                                      .animation(.easeInOut(duration: 0.2), value: obra.id) // Animação suave ao alterar a obra.
                                  
                                  // Título da obra. Usando fonte de destaque para chamar atenção.
                                  Text(obra.titulo)
                                      .font(.headline) // Fonte de destaque.
                                      .multilineTextAlignment(.center) // Alinha o título ao centro.

                                  // Nome do artista da obra.
                                  Text(obra.artista)
                                      .font(.subheadline) // Fonte menor para o nome do artista.
                                      .foregroundColor(.secondary) // Cor de texto secundária para não competir com o título.
                              }
                              // Padding adicional ao redor do conteúdo da célula para melhorar o espaçamento.
                              .padding(4)
                          }
                      }
                  }
                  // Padding extra em torno da grid para criar um espaçamento confortável entre os elementos e as bordas da tela.
                  .padding()
              }
          }
          // Definindo o título de navegação da tela.
          .navigationTitle("Artistas Curitibanos")
      }
  }
}
