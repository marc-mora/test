#!/bin/bash

# Array con los nombres aleatorios
names=(
    "index" "images" "download" "2006" "news" "crack" "serial" "warez" "full" "12"
    "contact" "about" "search" "spacer" "privacy" "11" "logo" "blog" "new" "10"
    "cgi-bin" "faq" "rss" "home" "img" "default" "2005" "products" "sitemap" "archives" "1"
    "09" "links" "01" "08" "06" "2" "07" "login" "articles" "support" "05"
    "keygen" "article" "04" "03" "help" "events" "archive" "02" "register" "en"
    "forum" "software" "downloads" "3" "security" "13" "category" "4" "content"
    "14" "main" "15" "press" "media" "templates" "services" "icons" "resources"
    "info" "profile" "16" "2004" "18" "docs" "contactus" "html" "features" "files"
    "20" "21" "5" "22" "page" "6" "misc" "19" "partners" "24" "terms"
    "2007" "23" "i" "17" "27" "26" "top" "9" "legal" "30" "banners"
    "xml" "29" "28" "7" "tools" "projects" "25" "0" "user" "feed" "themes"
    "linux" "forums" "jobs" "business" "8" "video" "email" "books" "banner"
    "reviews" "view" "graphics" "research" "feedback" "print"
)

# Función para generar un nombre aleatorio
random_name() {
    echo "${names[$((RANDOM % ${#names[@]}))]}"
}

# Función para crear los directorios y subdirectorios
create_directories() {
    local level=$1
    local max_levels=5
    local num_dirs=10
    
    # Crear directorios en el nivel actual
    for ((i=1; i<=num_dirs; i++)); do
        dir_name=$(random_name)
        mkdir -p "$dir_name"
        cd "$dir_name"
        
        # Llamar recursivamente a la función para crear subdirectorios si no hemos alcanzado el máximo de niveles
        if [ $level -lt $max_levels ]; then
            create_directories $((level+1))
        fi
        
        cd ..
    done
}

# Cambiar al directorio /var/www/html/
cd /var/www/html/

# Llamar a la función para comenzar la creación de directorios y subdirectorios
create_directories 1

echo "¡Directorios creados con éxito!"
