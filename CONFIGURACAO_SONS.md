# ⏱️ Configuração de Duração dos Sons

## 🎵 Como Funciona

O jogo agora **corta automaticamente** os arquivos de áudio após um tempo configurado, criando o efeito de "bip" curto característico do Genius.

## 🔧 Como Ajustar a Duração

### No Código

Edite a constante `_soundDurationMs` em `lib/main.dart`:

```dart
// Duração do som em milissegundos
// Valores sugeridos: 300-500ms
// Genius original usa ~400ms
static const int _soundDurationMs = 400; // ← AJUSTE AQUI
```

### Valores Sugeridos

| Duração | Efeito | Quando Usar |
|---------|--------|-------------|
| **200ms** | Muito rápido | Sequências longas, jogo difícil |
| **300ms** | Rápido | Boa velocidade, ainda audível |
| **400ms** | Padrão | Equilíbrio perfeito (Genius original) |
| **500ms** | Longo | Mais fácil de ouvir, iniciantes |
| **600ms** | Muito longo | Modo treino/aprendizado |

## 🎮 Impacto no Jogo

### Som Mais Curto (200-300ms)
- ✅ Jogo mais rápido e desafiador
- ✅ Sequências longas ficam mais ágeis
- ❌ Pode ser difícil distinguir as notas

### Som Padrão (400ms)
- ✅ Equilíbrio perfeito
- ✅ Fiel ao Genius original
- ✅ Bom para todos os níveis

### Som Mais Longo (500-600ms)
- ✅ Mais fácil de ouvir cada nota
- ✅ Melhor para iniciantes
- ❌ Jogo pode ficar lento em sequências longas

## 🔊 Como o Corte Funciona

```dart
// 1. Toca o áudio
await _audioPlayer.play(AssetSource('sounds/red.mp3'));

// 2. Agenda parada após X milissegundos
Future.delayed(Duration(milliseconds: _soundDurationMs), () {
  _audioPlayer.stop(); // ← Corta o áudio aqui
});
```

## 💡 Dicas

1. **Teste diferentes valores**: Jogue algumas rodadas com cada configuração
2. **Considere o público**: Iniciantes preferem sons mais longos
3. **Sequências longas**: Sons mais curtos evitam que o jogo fique muito lento
4. **Ajuste fino**: Incremente de 50 em 50ms até achar o ideal

## 🎯 Recomendações por Nível

- **Iniciante**: 500ms
- **Intermediário**: 400ms (padrão)
- **Avançado**: 300ms
- **Expert**: 200ms

## 🔄 Aplicar Mudanças

Após alterar o valor:
1. Salve o arquivo
2. Faça **Hot Reload** (pressione `r` no terminal)
3. Teste jogando algumas rodadas

---

**Configuração atual**: 400ms (Genius original) ⚡
