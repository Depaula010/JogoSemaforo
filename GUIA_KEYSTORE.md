# 🔐 Guia: Gerar Keystore para Publicação na Google Play

## ⚠️ IMPORTANTE: Keystore de Produção

Atualmente, o app está usando uma **chave de debug** (pública). Para publicar na Google Play Store, você PRECISA de uma **chave privada** (Keystore).

## 📋 Passo a Passo

### 1️⃣ Gerar o Keystore (.jks)

Execute este comando no PowerShell:

```powershell
keytool -genkey -v -keystore E:\Projetos\Projetos\JogoSemaforo\android\app\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

**O comando vai perguntar:**

1. **Senha do keystore**: Crie uma senha forte (ex: `Genius2025@Secure`)
2. **Confirme a senha**: Digite novamente
3. **Nome e sobrenome**: Seu nome (ex: `Rafael De Paula`)
4. **Unidade organizacional**: Nome da empresa ou "Desenvolvedor Independente"
5. **Organização**: Mesmo que acima
6. **Cidade**: Sua cidade
7. **Estado**: Seu estado (ex: `SP`)
8. **Código do país**: `BR`
9. **Confirme**: Digite `sim`
10. **Senha da chave**: Pressione ENTER (usa a mesma senha do keystore)

### 2️⃣ Criar arquivo key.properties

Crie o arquivo `android/key.properties` com este conteúdo:

```properties
storePassword=SUA_SENHA_AQUI
keyPassword=SUA_SENHA_AQUI
keyAlias=upload
storeFile=upload-keystore.jks
```

**Substitua `SUA_SENHA_AQUI`** pela senha que você criou no passo 1.

### 3️⃣ Atualizar build.gradle.kts

O arquivo `android/app/build.gradle.kts` precisa ser atualizado para usar o keystore.

**Adicione ANTES do bloco `android {`:**

```kotlin
// Carrega as propriedades do keystore
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}
```

**Dentro do bloco `android {`, ANTES de `defaultConfig {`:**

```kotlin
signingConfigs {
    create("release") {
        keyAlias = keystoreProperties["keyAlias"] as String
        keyPassword = keystoreProperties["keyPassword"] as String
        storeFile = file(keystoreProperties["storeFile"] as String)
        storePassword = keystoreProperties["storePassword"] as String
    }
}
```

**Dentro de `buildTypes { release {`:**

```kotlin
release {
    signingConfig = signingConfigs.getByName("release")
}
```

### 4️⃣ Verificar .gitignore

Certifique-se que o `.gitignore` contém:

```
# Keystore (NUNCA commitar!)
*.jks
*.keystore
key.properties
```

✅ Já está no seu `.gitignore`!

## 🔒 SEGURANÇA CRÍTICA

### ⛔ NUNCA faça isso:
- ❌ Commitar o arquivo `.jks` no Git
- ❌ Commitar o arquivo `key.properties` no Git
- ❌ Compartilhar a senha do keystore
- ❌ Perder o arquivo `.jks` (faça backup!)

### ✅ SEMPRE faça isso:
- ✅ Guarde o `.jks` em local seguro (Google Drive, pendrive, etc.)
- ✅ Anote a senha em local seguro (gerenciador de senhas)
- ✅ Faça backup do `.jks` em múltiplos locais
- ✅ Mantenha `key.properties` apenas local

## ⚠️ ATENÇÃO: Perda do Keystore

Se você perder o arquivo `.jks` ou a senha:
- ❌ **NÃO poderá mais atualizar o app na Play Store**
- ❌ Terá que publicar um app completamente novo
- ❌ Perderá todos os downloads e avaliações

**Faça backup AGORA!**

## 🧪 Testar a Configuração

Após configurar, teste com:

```bash
flutter build apk --release
```

Se funcionar sem erros, está tudo certo! ✅

## 📱 Publicar na Google Play

Depois de configurar o keystore:

1. Gere o App Bundle:
   ```bash
   flutter build appbundle --release
   ```

2. O arquivo estará em:
   ```
   build/app/outputs/bundle/release/app-release.aab
   ```

3. Faça upload na Google Play Console

## 🔗 Links Úteis

- [Documentação Flutter - Assinatura Android](https://docs.flutter.dev/deployment/android#signing-the-app)
- [Google Play Console](https://play.google.com/console)

---

**Status Atual**: ⚠️ Usando chave de debug (não publicável)
**Próximo Passo**: Gerar keystore seguindo este guia
