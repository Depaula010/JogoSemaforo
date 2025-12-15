# 📋 Guia de Versionamento Git

## ✅ Arquivos que DEVEM ser versionados

### Código Fonte
- `lib/` - Todo o código Dart do aplicativo
- `test/` - Testes unitários e de widget

### Configuração do Projeto
- `pubspec.yaml` - Dependências e metadados do projeto
- `pubspec.lock` - Versões exatas das dependências (recomendado para apps)
- `analysis_options.yaml` - Regras de análise estática
- `.metadata` - Metadados do Flutter

### Plataformas (estrutura base)
- `android/` - Configuração Android (exceto builds)
- `ios/` - Configuração iOS (exceto builds)
- `web/` - Configuração Web
- `windows/` - Configuração Windows (exceto arquivos gerados)
- `linux/` - Configuração Linux (exceto arquivos gerados)
- `macos/` - Configuração macOS (exceto builds)

### Documentação
- `README.md` - Documentação do projeto
- `.gitignore` - Regras de exclusão do Git
- `.gitattributes` - Configuração de line endings

## ❌ Arquivos que NÃO devem ser versionados

### Builds e Arquivos Gerados
- `build/` - Arquivos compilados
- `.dart_tool/` - Cache do Dart
- `*.g.dart` - Arquivos gerados (ex: JSON serialization)
- `*.freezed.dart` - Arquivos gerados pelo Freezed
- Arquivos de build do Android/iOS/Windows/Linux/macOS

### IDEs e Editores
- `.idea/` - IntelliJ/Android Studio
- `.vscode/` - Visual Studio Code (opcional)
- `*.iml` - Arquivos do IntelliJ

### Dependências
- `.packages` - Lista de pacotes (gerado automaticamente)
- `.flutter-plugins` - Plugins Flutter (gerado)
- `.flutter-plugins-dependencies` - Dependências de plugins (gerado)

### Outros
- `.DS_Store` - Arquivos do macOS
- `*.log` - Logs
- Coverage reports

## 🚀 Comandos Git Úteis

### Primeiro Commit
```bash
git add .
git commit -m "🎮 Initial commit: Jogo Genius (Simon Says) em Flutter"
```

### Verificar o que será commitado
```bash
git status
git diff --cached
```

### Ver arquivos ignorados
```bash
git status --ignored
```

### Limpar arquivos não rastreados
```bash
git clean -fd
```

## 📝 Estrutura Recomendada de Commits

Use commits semânticos:
- `feat:` - Nova funcionalidade
- `fix:` - Correção de bug
- `docs:` - Documentação
- `style:` - Formatação
- `refactor:` - Refatoração
- `test:` - Testes
- `chore:` - Tarefas de manutenção

Exemplos:
```bash
git commit -m "feat: adiciona animação de brilho nos botões"
git commit -m "fix: corrige bug de game over imediato"
git commit -m "docs: atualiza README com instruções de instalação"
```

## 🔍 Verificação Final

Antes de fazer push, verifique:
1. ✅ Nenhum arquivo sensível (chaves, senhas)
2. ✅ Nenhum arquivo de build
3. ✅ Nenhum arquivo IDE desnecessário
4. ✅ `.gitignore` está configurado corretamente

---

**Nota**: O arquivo `pubspec.lock` é versionado porque este é um aplicativo (não uma biblioteca). Isso garante que todos os desenvolvedores usem as mesmas versões das dependências.
