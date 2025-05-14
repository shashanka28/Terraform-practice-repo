param (
    [string]$AppServiceName = "wordpress-app",
    [string]$ResourceGroup = "rg-wordpress"
)

Write-Output " Starting WordPress post-deployment tasks..."

# Optional: Restart the App Service (useful after plugin/theme uploads)
az webapp restart `
    --name $AppServiceName `
    --resource-group $ResourceGroup

# Optional: Re-configure app settings or environment variables (example)
# az webapp config appsettings set `
#     --name $AppServiceName `
#     --resource-group $ResourceGroup `
#     --settings WORDPRESS_DEBUG=false

Write-Output " WordPress App Service post-deployment completed."
