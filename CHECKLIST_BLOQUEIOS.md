# ✅ Checklist de Correção - Bloqueios Técnicos

## Status das Correções

### ✅ BLOQUEIO 1: Nome da Pasta (RESOLVIDO)
- [x] Pasta renomeada de `Assets` → `assets` (minúsculo)
- [x] Compatível com Android/Linux (case-sensitive)
- [x] `pubspec.yaml` já estava correto com `assets/sounds/`

**Teste**: Os sons devem funcionar no Android agora.

---

### ✅ BLOQUEIO 2: Package Name (RESOLVIDO)
- [x] `android/app/build.gradle.kts` atualizado
  - namespace: `br.com.depaula.genius`
  - applicationId: `br.com.depaula.genius`
- [x] `android/app/src/main/AndroidManifest.xml` atualizado
  - Nome do app: `Genius`
- [x] `MainActivity.kt` criado na nova estrutura
  - Localização: `kotlin/br/com/depaula/genius/MainActivity.kt`
  - Package: `br.com.depaula.genius`

**Teste**: O app deve compilar sem erros.

---

### ⚠️ BLOQUEIO 3: Assinatura Digital (PENDENTE)

**Status Atual**: Usando chave de debug (não publicável)

**O que precisa ser feito**:
1. [ ] Gerar keystore (.jks)
2. [ ] Criar arquivo `key.properties`
3. [ ] Atualizar `build.gradle.kts` para usar keystore
4. [ ] Fazer backup do keystore

**Guia Completo**: Veja `GUIA_KEYSTORE.md`

**Quando fazer**: Antes de publicar na Google Play Store

---

## 🧪 Testes Recomendados

### Teste 1: Compilação
```bash
flutter clean
flutter pub get
flutter build apk --debug
```

### Teste 2: Executar no Dispositivo
```bash
flutter run
```

### Teste 3: Sons
- Verifique se os sons tocam corretamente
- Teste em dispositivo Android real (se possível)

---

## 📋 Próximos Passos

### Antes de Publicar:
1. ✅ Resolver Bloqueio 3 (Keystore) - **OBRIGATÓRIO**
2. ✅ Testar em dispositivo Android real
3. ✅ Criar ícone do app personalizado
4. ✅ Criar screenshots para a Play Store
5. ✅ Preparar descrição do app

### Opcional (Melhorias):
- [ ] Adicionar efeitos sonoros de erro/acerto
- [ ] Adicionar níveis de dificuldade
- [ ] Adicionar modo multiplayer
- [ ] Adicionar conquistas
- [ ] Adicionar tema escuro/claro

---

## 🔗 Arquivos Importantes

- `GUIA_KEYSTORE.md` - Como gerar keystore de produção
- `CONFIGURACAO_SONS.md` - Como ajustar duração dos sons
- `COMO_ADICIONAR_SONS.md` - Como adicionar/substituir sons
- `GIT_GUIDE.md` - Guia de versionamento Git

---

## ⚠️ Avisos Importantes

### Keystore
- **NUNCA** commite o arquivo `.jks` no Git
- **NUNCA** commite o arquivo `key.properties` no Git
- **SEMPRE** faça backup do keystore em local seguro
- **NUNCA** compartilhe a senha do keystore

### Package Name
- **NÃO MUDE** o package name depois de publicar
- Se mudar, será considerado um app diferente
- Perderá todos os downloads e avaliações

---

**Última Atualização**: 15/12/2025
**Status Geral**: ✅ 2/3 Bloqueios Resolvidos
