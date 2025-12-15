# 🎮 Genius - Simon Says Game

Jogo estilo "Simon Says" (Genius) desenvolvido em Flutter usando apenas widgets nativos.

## 📋 Características Implementadas

### ✅ Layout
- Tela dividida em 4 grandes botões coloridos (Vermelho, Verde, Azul, Amarelo)
- Grid 2x2 responsivo
- Interface moderna com tema escuro

### ✅ Mecânica de Jogo
- Jogo começa com sequência de 1 cor
- Botões piscam para mostrar a sequência
- Jogador repete a sequência clicando nos botões
- A cada acerto, adiciona uma nova cor aleatória
- Dificuldade progressiva
- Game Over ao errar com pontuação final

### ✅ Feedback Visual
- Animação de brilho (glow) quando botão é pressionado
- Mudança de opacidade e sombra
- Indicadores visuais de estado ("Observe a sequência..." / "Sua vez!")
- Dialog de Game Over estilizado

### ✅ Controle de Estado
- Gerenciamento com `setState`
- Bloqueio de toques durante demonstração da CPU
- Controle de sequência e inputs do jogador

### 🔊 Sons (Preparado para implementação)
O código está preparado com comentários indicando onde adicionar sons:
```dart
// AQUI VOCÊ PODE ADICIONAR SOM:
// await _playSound(buttonIndex);
```

## 🚀 Como Executar

1. Certifique-se de ter o Flutter instalado
2. No terminal, navegue até a pasta do projeto
3. Execute:
```bash
flutter pub get
flutter run
```

## 🎯 Como Jogar

1. O jogo inicia automaticamente mostrando a primeira cor
2. Observe atentamente a sequência de cores que pisca
3. Quando aparecer "Sua vez!", repita a sequência clicando nos botões
4. A cada acerto, uma nova cor é adicionada à sequência
5. Continue até errar!

## 🛠️ Tecnologias

- Flutter SDK 3.0+
- Dart
- Material Design 3
- Widgets nativos (sem game engines)

## 📝 Estrutura do Código

O jogo está contido em um único arquivo `lib/main.dart` para facilitar testes:

- **MyApp**: Widget raiz da aplicação
- **GeniusGame**: Widget principal do jogo (StatefulWidget)
- **_GeniusGameState**: Gerencia todo o estado e lógica do jogo
  - `_sequence`: Lista da sequência gerada
  - `_playerInputs`: Lista dos inputs do jogador
  - `_isShowingSequence`: Bloqueia toques durante demonstração
  - `_addToSequenceAndShow()`: Adiciona cor e mostra sequência
  - `_onButtonPressed()`: Processa clique do jogador
  - `_gameOver()`: Exibe dialog de fim de jogo

## 🎨 Personalização

Você pode facilmente personalizar:
- **Cores dos botões**: Modifique a lista `_colors`
- **Velocidade das animações**: Ajuste os `Duration` nos `Future.delayed`
- **Tema**: Altere as cores no `backgroundColor` e `AppBar`
- **Dificuldade inicial**: Modifique a lógica em `_startNewGame()`

## 📱 Compatibilidade

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

---

Desenvolvido com ❤️ em Flutter
