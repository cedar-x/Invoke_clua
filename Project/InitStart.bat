
@echo off
cd /d %~dp0

if not exist jit (mkdir jit)
if not exist Out (mkdir Out)

echo "hello TeamCity" > jit/hello.lua