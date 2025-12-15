# 🔊 Guia: Como Adicionar Sons Reais ao Jogo

## Status Atual

✅ **Implementado**:
- Pacote `audioplayers` instalado
- Função `_playSound()` criada e integrada
- Sons tocam quando:
  - CPU mostra a sequência
  - Jogador clica nos botões

⚠️ **Pendente**:
- Arquivos de áudio MP3 (atualmente apenas simulação)

## Como Adicionar Arquivos de Som

### Opção 1: Gerar Sons Online (Mais Fácil)

1. **Acesse um gerador de tons**:
   - https://www.szynalski.com/tone-generator/
   - https://onlinetonegenerator.com/

2. **Gere cada som**:
   - **Vermelho**: 329.63 Hz (Mi - E4) - 0.3 segundos
   - **Verde**: 277.18 Hz (Dó# - C#4) - 0.3 segundos
   - **Azul**: 220.00 Hz (Lá - A3) - 0.3 segundos
   - **Amarelo**: 164.81 Hz (Mi - E3) - 0.3 segundos

3. **Baixe como MP3** e renomeie:
   - `red.mp3`
   - `green.mp3`
   - `blue.mp3`
   - `yellow.mp3`

4. **Coloque na pasta**:
   ```
   assets/sounds/red.mp3
   assets/sounds/green.mp3
   assets/sounds/blue.mp3
   assets/sounds/yellow.mp3
   ```

### Opção 2: Usar Audacity (Grátis e Profissional)

1. **Baixe Audacity**: https://www.audacityteam.org/

2. **Para cada cor**:
   - Gerar > Tom...
   - Forma de onda: **Senoidal**
   - Frequência: (veja acima)
   - Amplitude: **0.8**
   - Duração: **0.3** segundos
   - Arquivo > Exportar > Exportar como MP3

### Opção 3: Usar Sons Prontos

Baixe sons de "beep" ou "bip" de sites como:
- https://freesound.org/
- https://mixkit.co/free-sound-effects/
- https://www.zapsplat.com/

Procure por: "beep", "tone", "button click"

## Atualizar o Código

Depois de adicionar os arquivos MP3, atualize a função `_playSound`:

```dart
Future<void> _playSound(int colorIndex) async {
  try {
    final sounds = ['red.mp3', 'green.mp3', 'blue.mp3', 'yellow.mp3'];
    await _audioPlayer.play(AssetSource('sounds/${sounds[colorIndex]}'));
  } catch (e) {
    print('Erro ao tocar som: $e');
  }
}
```

## Testar

1. Adicione os arquivos MP3
2. Execute `flutter pub get`
3. Execute `flutter run`
4. Os sons devem tocar automaticamente!

## Dicas

- **Volume**: Ajuste com `_audioPlayer.setVolume(0.5)` (0.0 a 1.0)
- **Duração**: Sons de 0.2-0.4 segundos funcionam melhor
- **Formato**: MP3 funciona em todas as plataformas
- **Tamanho**: Mantenha arquivos pequenos (< 50KB cada)

## Troubleshooting

**Sons não tocam?**
1. Verifique se os arquivos estão em `assets/sounds/`
2. Verifique se `pubspec.yaml` tem:
   ```yaml
   flutter:
     assets:
       - assets/sounds/
   ```
3. Execute `flutter clean` e `flutter pub get`
4. Reinicie o app

**Sons atrasados?**
- Reduza a duração dos arquivos
- Use formato MP3 (mais leve)
- Pré-carregue os sons no `initState()`

---

**Nota**: Por enquanto, o jogo funciona sem sons reais (apenas logs no console). Adicione os arquivos MP3 quando quiser o efeito sonoro completo!
