// Configuration API centralisée
// Utiliser l'adresse IP WiFi pour téléphone physique
export const API_CONFIG = {
  // Adresse IP WiFi de votre PC (pour téléphone physique)
  BASE_URL: 'http://20.30.0.161:3000',
  API_URL: 'http://20.30.0.161:3000/api'
};

// Fonction utilitaire pour construire les URLs d'images
export const getImageUrl = (imageUrl) => {
  if (!imageUrl) return 'https://via.placeholder.com/150?text=Parfum';
  if (imageUrl.startsWith('http')) return imageUrl;
  return `${API_CONFIG.BASE_URL}${imageUrl}`;
};