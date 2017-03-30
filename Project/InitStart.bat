
@echo off
cd /d %~dp0

if not exist dir (mkdir jit)
if not exist Out (mkdir Out)