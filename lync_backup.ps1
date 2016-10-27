Import-Module lync

# Création repertoire de sauvegarde avec la date en nom de fichier.
$BakDir = New-Item -ItemType Directory -Path "C:\LyncBackup\$((Get-Date).ToString('yyyy-MM-dd'))"

# Export de la topologie, des politiques et des fichiers de configuration 
Export-CsConfiguration -FileName "$BakDir\CoreConfig.zip"

# Export de la configuration Enhanced 9-1-1
Export-CsLisConfiguration -FileName "$BakDir\E911Config.zip"

# Export des données utilisateur
Export-CsUserData -PoolFQDN FQDN_Du_Serveur_SfB -FileName "$BakDir\UserData.zip"
