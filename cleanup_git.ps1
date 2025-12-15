# Script para limpar arquivos desnecessários do Git
# Execute este script para remover arquivos que não deveriam ter sido commitados

Write-Host "🧹 Limpando repositório Git..." -ForegroundColor Cyan
Write-Host ""

# Remove pastas de plataforma do Git (mas mantém no disco)
Write-Host "📁 Removendo pastas de plataforma do histórico Git..." -ForegroundColor Yellow

git rm -r --cached android/
git rm -r --cached ios/
git rm -r --cached web/
git rm -r --cached windows/
git rm -r --cached linux/
git rm -r --cached macos/

Write-Host ""
Write-Host "✅ Arquivos removidos do Git (mas ainda estão no seu disco)" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Próximos passos:" -ForegroundColor Cyan
Write-Host "1. Verifique as mudanças: git status" -ForegroundColor White
Write-Host "2. Faça o commit: git commit -m 'chore: remove arquivos de plataforma gerados automaticamente'" -ForegroundColor White
Write-Host "3. Se necessário, force push: git push --force" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  ATENÇÃO: Se você já fez push para um repositório remoto compartilhado," -ForegroundColor Red
Write-Host "   coordene com sua equipe antes de fazer force push!" -ForegroundColor Red
