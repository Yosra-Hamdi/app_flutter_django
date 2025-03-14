# Utiliser une image Python officielle comme base
FROM python:3.10-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers de requirements.txt dans le conteneur
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le projet Django dans le conteneur
COPY . .

# Exposer le port 8000 pour l'application Django
EXPOSE 8000

# Commande pour exécuter l'application Django
CMD ["gunicorn", "project.wsgi:application", "--bind", "0.0.0.0:8000"]
