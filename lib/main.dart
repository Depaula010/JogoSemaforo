import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genius - Simon Says',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GeniusGame(),
    );
  }
}

class GeniusGame extends StatefulWidget {
  const GeniusGame({super.key});

  @override
  State<GeniusGame> createState() => _GeniusGameState();
}

class _GeniusGameState extends State<GeniusGame> {
  // Lista de cores do jogo (0=Vermelho, 1=Verde, 2=Azul, 3=Amarelo)
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  // Sequência gerada pelo jogo
  final List<int> _sequence = [];
  
  // Inputs do jogador
  final List<int> _playerInputs = [];
  
  // Estado do jogo
  bool _isShowingSequence = false;
  bool _gameStarted = false;
  int _currentScore = 0;
  
  // Controle de animação de brilho
  int _glowingButton = -1;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  // Inicia um novo jogo
  void _startNewGame() {
    setState(() {
      _sequence.clear();
      _playerInputs.clear();
      _currentScore = 0;
      _gameStarted = true;
      _glowingButton = -1;
    });
    _addToSequenceAndShow();
  }

  // Adiciona uma nova cor aleatória à sequência e mostra
  void _addToSequenceAndShow() async {
    setState(() {
      _isShowingSequence = true;
      _playerInputs.clear();
    });

    // Adiciona cor aleatória
    final random = Random();
    final newColor = random.nextInt(4);
    _sequence.add(newColor);
    
    // Debug: mostra a sequência no console
    final colorNames = ['🔴 Vermelho', '🟢 Verde', '🔵 Azul', '🟡 Amarelo'];
    print('═══════════════════════════════════════');
    print('🎮 NOVA RODADA - Sequência completa:');
    for (int i = 0; i < _sequence.length; i++) {
      print('  ${i + 1}. ${colorNames[_sequence[i]]}');
    }
    print('═══════════════════════════════════════');

    // Pequeno delay antes de começar a mostrar
    await Future.delayed(const Duration(milliseconds: 800));

    // Mostra toda a sequência
    for (int i = 0; i < _sequence.length; i++) {
      print('💡 Mostrando: ${colorNames[_sequence[i]]}');
      await _showButton(_sequence[i]);
      await Future.delayed(const Duration(milliseconds: 300));
    }

    // Libera para o jogador jogar
    setState(() {
      _isShowingSequence = false;
    });
    print('✅ Sua vez de jogar!');
  }

  // Mostra um botão piscando
  Future<void> _showButton(int buttonIndex) async {
    // Liga o brilho
    setState(() {
      _glowingButton = buttonIndex;
    });
    
    // Aguarda um frame para garantir que o setState foi processado
    await Future.delayed(const Duration(milliseconds: 50));
    
    // AQUI VOCÊ PODE ADICIONAR SOM:
    // await _playSound(buttonIndex);
    
    // Mantém o brilho aceso
    await Future.delayed(const Duration(milliseconds: 550));
    
    // Desliga o brilho
    setState(() {
      _glowingButton = -1;
    });
    
    // Aguarda um frame antes de continuar
    await Future.delayed(const Duration(milliseconds: 50));
  }

  // Quando o jogador clica em um botão
  void _onButtonPressed(int buttonIndex) async {
    // Bloqueia cliques durante a demonstração
    if (_isShowingSequence) return;

    // Adiciona o input do jogador ANTES da animação
    _playerInputs.add(buttonIndex);
    
    // Pega o índice atual para verificação
    final currentIndex = _playerInputs.length - 1;
    
    // Debug
    final colorNames = ['🔴 Vermelho', '🟢 Verde', '🔵 Azul', '🟡 Amarelo'];
    print('👆 Você clicou: ${colorNames[buttonIndex]}');
    print('   Esperado: ${colorNames[_sequence[currentIndex]]}');
    print('   Progresso: ${_playerInputs.length}/${_sequence.length}');

    // Feedback visual
    setState(() {
      _glowingButton = buttonIndex;
    });
    
    // AQUI VOCÊ PODE ADICIONAR SOM:
    // await _playSound(buttonIndex);
    
    await Future.delayed(const Duration(milliseconds: 300));
    
    setState(() {
      _glowingButton = -1;
    });

    // Verifica se o jogador errou
    if (_playerInputs[currentIndex] != _sequence[currentIndex]) {
      print('❌ ERROU! Game Over');
      await Future.delayed(const Duration(milliseconds: 200));
      _gameOver();
      return;
    }

    print('✅ Correto!');

    // Verifica se o jogador completou a sequência
    if (_playerInputs.length == _sequence.length) {
      print('🎉 Sequência completa! Próxima rodada...');
      setState(() {
        _currentScore = _sequence.length;
      });
      
      // Aguarda um pouco e adiciona nova cor
      await Future.delayed(const Duration(milliseconds: 1000));
      _addToSequenceAndShow();
    }
  }

  // Game Over
  void _gameOver() {
    setState(() {
      _gameStarted = false;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Game Over!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.sentiment_dissatisfied,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Pontuação Final: $_currentScore',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Você errou a sequência!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startNewGame();
              },
              child: const Text(
                'Jogar Novamente',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  // Constrói um botão colorido
  Widget _buildColorButton(int index, Color color) {
    final isGlowing = _glowingButton == index;
    
    return GestureDetector(
      onTap: () => _onButtonPressed(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isGlowing 
              ? color // Cor totalmente brilhante
              : color.withOpacity(0.5), // Cor mais escura quando não ativo
          borderRadius: BorderRadius.circular(16),
          border: isGlowing 
              ? Border.all(color: Colors.white, width: 4)
              : null,
          boxShadow: isGlowing
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.9),
                    blurRadius: 30,
                    spreadRadius: 8,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      appBar: AppBar(
        title: const Text(
          'Genius',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF16213e),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Placar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
              children: [
                const Text(
                  'PONTUAÇÃO',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$_currentScore',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                if (_isShowingSequence)
                  Column(
                    children: [
                      const Text(
                        'Observe a sequência...',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sequência de ${_sequence.length} ${_sequence.length == 1 ? 'cor' : 'cores'}',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                else if (_gameStarted)
                  Column(
                    children: [
                      const Text(
                        'Sua vez!',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Repita ${_sequence.length} ${_sequence.length == 1 ? 'cor' : 'cores'} | Progresso: ${_playerInputs.length}/${_sequence.length}',
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          
          // Grid de botões 2x2 - RESPONSIVO
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calcula o tamanho máximo para o grid (quadrado)
                final maxSize = constraints.maxWidth < constraints.maxHeight 
                    ? constraints.maxWidth 
                    : constraints.maxHeight;
                
                // Tamanho de cada botão (metade do grid menos espaçamento)
                final buttonSize = (maxSize - 48) / 2; // 48 = padding + gaps
                
                return Center(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: maxSize,
                      maxHeight: maxSize,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Primeira linha (Vermelho e Verde)
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildColorButton(0, _colors[0]),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _buildColorButton(1, _colors[1]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Segunda linha (Azul e Amarelo)
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildColorButton(2, _colors[2]),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _buildColorButton(3, _colors[3]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Botão de reiniciar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: _gameStarted ? null : _startNewGame,
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Novo Jogo',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                backgroundColor: const Color(0xFF0f3460),
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
