@echo off
echo ========================================
echo   APPLICATION MOBILE DE VENTE DE PARFUMS
echo ========================================
echo.
echo Demarrage du projet complet...
echo.

echo [1/3] Demarrage du serveur backend...
cd backend
start "Backend Server" cmd /k "node server.js"
cd ..

echo [2/3] Ouverture du panel d'administration...
start admin/index.html

echo [3/3] Demarrage de l'application mobile...
start "Mobile App" cmd /k "expo start"

echo.
echo ========================================
echo   PROJET LANCE AVEC SUCCES !
echo ========================================
echo.
echo Backend Server: http://20.30.0.161:3000
echo Panel Admin: Ouvert dans le navigateur
echo App Mobile: Scanner le QR code avec Expo Go
echo.
echo Connexion Admin:
echo Email: admin@parfums.com
echo Password: admin123
echo.
echo Appuyez sur une touche pour fermer...
pause >nul