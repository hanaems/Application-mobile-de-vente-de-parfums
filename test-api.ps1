$uri = "http://192.168.11.105:3000/api/admin/parfums"

# Créer les données du formulaire
$form = @{
    nom = "Test Parfum"
    marque = "Test Marque"
    categorie = "femme"
    prix = "99.99"
    stock = "10"
    description = "Test description"
}

try {
    Write-Host "Envoi de la requête à $uri"
    Write-Host "Données: $($form | ConvertTo-Json)"
    
    $response = Invoke-RestMethod -Uri $uri -Method Post -Form $form -ContentType "multipart/form-data"
    Write-Host "Succès!"
    Write-Host ($response | ConvertTo-Json -Depth 3)
} catch {
    Write-Host "Erreur:"
    Write-Host $_.Exception.Message
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $responseBody = $reader.ReadToEnd()
        Write-Host "Réponse du serveur: $responseBody"
    }
}