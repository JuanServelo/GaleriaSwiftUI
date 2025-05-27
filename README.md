# 🎨 SwiftUIGaleriaCuritibana

Uma galeria de arte interativa desenvolvida em **SwiftUI**, com foco na valorização de artistas **Curitibanos**. O app apresenta uma interface moderna e responsiva, com recursos de busca e navegação detalhada entre obras.

## 📱 Objetivo

Desenvolver um aplicativo iOS com **SwiftUI** que apresente uma galeria visual de obras de arte utilizando **LazyVGrid**, promovendo a produção artística local de **Curitiba**.

---

## 🖌️ Tema: *Artistas Curitibanos*

As obras exibidas são de artistas nascidos, residentes ou fortemente ligados à cidade de **Curitiba**, abrangendo diferentes estilos e épocas da arte paranaense.

---

## ✅ Funcionalidades Implementadas

- Exibição de obras de arte em **grade adaptativa** com uso de `LazyVGrid`.
- **Navegação** para detalhes completos da obra.
- **Barra de busca** para filtrar por título ou artista.
- Layout **responsivo e estilizado** para diferentes tamanhos de tela.
- Uso de **animações suaves** e estilizações modernas.

---

## 🧱 Estrutura de Dados

```swift
struct ObraDeArte: Identifiable {
    let id = UUID()
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}
