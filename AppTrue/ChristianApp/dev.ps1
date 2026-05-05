#!/usr/bin/env pwsh
# SkelPhone dev script — esegui con: .\dev.ps1
# Oppure da Claude: ! .\dev.ps1

param(
    [string]$cmd = "build"
)

Set-Location $PSScriptRoot

function Run-Flutter([string]$args) {
    Write-Host "`n>> flutter $args" -ForegroundColor Cyan
    flutter $args
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERRORE (exit $LASTEXITCODE)" -ForegroundColor Red
        exit $LASTEXITCODE
    }
}

switch ($cmd) {

    "build" {
        Write-Host "=== GENERA FILE (build_runner) ===" -ForegroundColor Yellow
        Run-Flutter "pub get"
        Run-Flutter "pub run build_runner build --delete-conflicting-outputs"
        Write-Host "`nOK — file generati. Ora puoi usare: .\dev.ps1 run" -ForegroundColor Green
    }

    "run" {
        Write-Host "=== AVVIA APP (Windows) ===" -ForegroundColor Yellow
        Run-Flutter "run -d windows"
    }

    "android" {
        Write-Host "=== AVVIA APP (Android) ===" -ForegroundColor Yellow
        Run-Flutter "run -d android"
    }

    "ios" {
        Write-Host "=== AVVIA APP (iOS - solo Mac) ===" -ForegroundColor Yellow
        Run-Flutter "run -d ios"
    }

    "web" {
        Write-Host "=== FULL CLEAN + BUILD WEB + RUN (PORT 8080) ===" -ForegroundColor Yellow
        Run-Flutter "clean"
        Run-Flutter "pub get"
        Run-Flutter "build web"
        Run-Flutter "run -d chrome --web-port 8080"
    }

    "watch" {
        Write-Host "=== WATCH MODE (rigenera su modifica) ===" -ForegroundColor Yellow
        Run-Flutter "pub run build_runner watch --delete-conflicting-outputs"
    }

    "clean" {
        Write-Host "=== PULIZIA BUILD ===" -ForegroundColor Yellow
        Run-Flutter "clean"
        Run-Flutter "pub get"
        Run-Flutter "pub run build_runner build --delete-conflicting-outputs"
        Write-Host "`nOK — pulizia completata." -ForegroundColor Green
    }

    "commit" {
        param([string]$msg = "")
        if (-not $msg) {
            $msg = Read-Host "Messaggio commit"
        }
        Write-Host "=== COMMIT + PUSH ===" -ForegroundColor Yellow
        git add .
        git status -sb
        git commit -m $msg
        git push origin main
        git log origin/main -n 3 --oneline --decorate
    }

    default {
        Write-Host @"

UTILIZZO: .\dev.ps1 [comando]

  build    — flutter pub get + build_runner (PRIMO STEP)
  run      — avvia app su Windows
  android  — avvia app su Android
  ios      — avvia app su iOS (solo Mac)
  web      — full clean + build release + run su porta 8080
  watch    — build_runner in watch mode
  clean    — pulizia completa + rebuild
  commit   — git add + commit + push su main

ESEMPI:
  .\dev.ps1 build
  .\dev.ps1 run
  .\dev.ps1 watch
"@ -ForegroundColor White
    }
}
