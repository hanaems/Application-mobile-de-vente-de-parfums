# 🏗️ ARCHITECTURE TECHNIQUE DÉTAILLÉE
## Application Mobile de Vente de Parfums

---

## 📋 SOMMAIRE
1. [Vue d'ensemble de l'architecture](#architecture-globale)
2. [Structure des dossiers](#structure-dossiers)
3. [Backend Node.js - Analyse du code](#backend-nodejs)
4. [Frontend Mobile React Native](#frontend-mobile)
5. [Panel d'administration Web](#panel-admin)
6. [Base de données MySQL](#base-donnees)
7. [API REST - Endpoints détaillés](#api-endpoints)
8. [Sécurité et authentification](#securite)
9. [Gestion des états et contextes](#gestion-etats)
10. [Services et utilitaires](#services)

---

## 🏛️ ARCHITECTURE GLOBALE {#architecture-globale}

### Pattern Architectural: **MVC + Services**
```
┌─────────────────────────────────────────────────────────────┐
│                    COUCHE PRÉSENTATION                     │
├─────────────────────┬───────────────────────────────────────┤
│   APP MOBILE        │        PANEL ADMIN WEB              │
│   React Native      │        HTML/CSS/JavaScript          │
│   - Screens         │        - Dashboard                  │
│   - Components      │        - CRUD Interfaces            │
│   - Navigation      │        - Statistics                 │
└─────────────────────┴───────────────────────────────────────┘
                              │
                    ┌─────────▼─────────┐
                    │   COUCHE MÉTIER   │
                    │   Services Layer  │
                    │   - AuthService   │
                    │   - ParfumService │
                    │   - PanierService │
                    └─────────┬─────────┘
                              │
                    ┌─────────▼─────────┐
                    │  COUCHE CONTRÔLE  │
                    │   API REST        │
                    │   Node.js/Express │
                    │   - Routes        │
                    │   - Middleware    │
                    │   - Validation    │
                    └─────────┬─────────┘
                              │
                    ┌─────────▼─────────┐
                    │  COUCHE DONNÉES   │
                    │   MySQL Database  │
                    │   - Tables        │
                    │   - Relations     │
                    │   - Indexes       │
                    └───────────────────┘
```

## 📁 STRUCTURE DES DOSSIERS {#structure-dossiers}

```
myApp/
├── 📱 app/                          # Application Mobile React Native
│   ├── (tabs)/                     # Navigation par onglets
│   │   ├── accueil.js              # Écran d'accueil avec collections
│   │   ├── list-parfums.js         # Liste des parfums avec filtres
│   │   ├── profile.js              # Profil utilisateur
│   │   ├── panier.js               # Gestion du panier
│   │   ├── MesCommandes.js         # Historique des commandes
│   │   ├── wishlist.js             # Liste de souhaits
│   │   ├── promotions.js           # Promotions actives
│   │   ├── smart-recommendations.js # Recommandations IA
│   │   └── avis-simple.js          # Système d'avis clients
│   ├── login.js                    # Authentification
│   ├── register.js                 # Inscription
│   ├── ConfirmationCommande.js     # Validation commande
│   ├── PaiementEnLigne.js          # Paiement sécurisé
│   └── _layout.js                  # Layout principal
│
├── 🧩 components/                   # Composants réutilisables
│   ├── BottomNavBar.js             # Navigation inférieure
│   ├── AnimatedButton.js           # Boutons animés
│   ├── AnimatedCard.js             # Cartes produits
│   ├── AnimatedLoader.js           # Indicateurs de chargement
│   ├── AnimatedModal.js            # Modales animées
│   └── AnimatedNotification.js     # Notifications toast
│
├── 🔧 services/                     # Couche de services métier
│   ├── AuthService.js              # Authentification utilisateur
│   ├── ParfumService.js            # Gestion des parfums
│   ├── PanierService.js            # Logique du panier
│   ├── CommandeService.js          # Gestion des commandes
│   ├── WishlistService.js          # Liste de souhaits
│   ├── AvisService.js              # Système d'avis
│   ├── SmartRecommendationService.js # Recommandations
│   ├── NotificationService.js      # Notifications
│   ├── SearchService.js            # Recherche avancée
│   └── SupportService.js           # Support client
│
├── 🎨 contexts/                     # Gestion d'état globale
│   ├── AuthContext.js              # Contexte d'authentification
│   └── ThemeContext.js             # Thème et couleurs
│
├── ⚙️ config/                       # Configuration
│   └── api.js                      # URLs et configuration API
│
├── 🖼️ assets/                       # Ressources statiques
│   ├── index.png                   # Image d'accueil
│   ├── femme.jpg                   # Collection femmes
│   └── homme.jpg                   # Collection hommes
│
├── 🎨 styles/                       # Styles globaux
│   └── globalStyles.js             # Styles partagés
│
├── 🖥️ admin/                        # Panel d'administration Web
│   ├── index.html                  # Page principale admin
│   ├── app.js                      # Logique JavaScript admin
│   ├── styles.css                  # Styles CSS admin
│   ├── README.md                   # Documentation admin
│   └── GUIDE_FR.md                 # Guide utilisateur français
│
├── 🔙 backend/                      # Serveur Node.js
│   ├── server.js                   # Serveur principal Express
│   ├── database.sql                # Structure base de données
│   ├── package.json                # Dépendances Node.js
│   ├── .env                        # Variables d'environnement
│   └── uploads/                    # Images uploadées
│
├── 🔧 utils/                        # Utilitaires
│   └── animations.js               # Animations personnalisées
│
├── 📦 package.json                  # Dépendances React Native
├── 🚀 app.json                      # Configuration Expo
└── 📖 README.md                     # Documentation projet
```