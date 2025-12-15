# 📋 Guia de Versionamento Git - Flutter

## ✅ Arquivos que DEVEM ser versionados

### Código Fonte
- `lib/` - Todo o código Dart do aplicativo ✅
- `test/` - Testes unitários e de widget ✅

### Configuração do Projeto
- `pubspec.yaml` - Dependências e metadados do projeto ✅
- `pubspec.lock` - Versões exatas das dependências ✅
- `analysis_options.yaml` - Regras de análise estática ✅
- `.metadata` - Metadados do Flutter ✅

### Configuração Git
- `.gitignore` - Regras de exclusão ✅
- `.gitattributes` - Configuração de line endings ✅

### Documentação
- `README.md` - Documentação do projeto ✅
- Outros arquivos `.md` de documentação ✅

### Plataformas (APENAS configurações essenciais)
⚠️ **IMPORTANTE**: As pastas de plataforma são **geradas automaticamente** pelo Flutter!

**Android** - Versionar APENAS:
- `android/app/build.gradle`
- `android/app/src/main/AndroidManifest.xml`
- `android/build.gradle`
- `android/gradle.properties`
- `android/settings.gradle`

**iOS** - Versionar APENAS:
- `ios/Runner/Info.plist`
- `ios/Runner.xcodeproj/project.pbxproj`

**Web, Windows, Linux, macOS** - ❌ **NÃO versionar**
- Essas pastas são geradas pelo comando `flutter create`
- Podem ser recriadas a qualquer momento

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

## � Como Corrigir Repositório com Arquivos Desnecessários

Se você já commitou arquivos que não deveria (como pastas `android/`, `ios/`, `web/`, `windows/`, `linux/`, `macos/` completas):

### Opção 1: Usar o Script Automático
```powershell
.\cleanup_git.ps1
```

### Opção 2: Comandos Manuais
```bash
# Remove as pastas do Git (mas mantém no disco)
git rm -r --cached android/
git rm -r --cached ios/
git rm -r --cached web/
git rm -r --cached windows/
git rm -r --cached linux/
git rm -r --cached macos/

# Commit as mudanças
git commit -m "chore: remove arquivos de plataforma gerados automaticamente"

# Se necessário, force push (CUIDADO!)
git push --force
```

### ⚠️ IMPORTANTE
- Os arquivos continuarão no seu disco, apenas serão removidos do Git
- Se você já fez push para um repositório compartilhado, coordene com a equipe antes de fazer force push
- Após limpar, o `.gitignore` impedirá que sejam adicionados novamente

## �📝 Estrutura Recomendada de Commits

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
