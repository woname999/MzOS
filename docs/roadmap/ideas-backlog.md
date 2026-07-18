# MzOS Ideas Backlog

Ce fichier contient les idées validées découvertes pendant les sprints.

Règle :
- Les idées ne modifient pas le sprint en cours.
- Une idée doit être validée avant intégration.
- L'implémentation se fait lorsque la roadmap le permet.

---

# IDÉE-001 — Convention modules MzOS

Statut : Validé

Objectif :
Définir une structure commune pour tous les modules MzOS.

Structure cible :

module/
├── install.sh
├── status.sh
└── uninstall.sh

Bénéfices :
- cohérence entre modules ;
- maintenance simplifiée ;
- préparation interface graphique future.

---

# IDÉE-002 — Mode développement MzOS

Statut : Validé

Objectif :
Faciliter le développement sans devoir reconstruire/réinstaller constamment les paquets Debian.

Piste :
Ajouter un mode développement permettant d'utiliser directement les sources locales.

---

# IDÉE-003 — Dépendances modules ↔ Health Check

Statut : Validé

Objectif :
Permettre aux modules de déclarer leurs prérequis.

Exemple :

Steam :
- architecture amd64
- i386
- non-free
- Vulkan

Le Health Check pourrait préparer automatiquement l'environnement.

---

# IDÉE-004 — Version des modules

Statut : Validé

Objectif :
Afficher la version de chaque module installé.

Exemple :

mzos info

Core :
Health :
Steam :

---

# IDÉE-005 — Documentation projet structurée

Statut : Validé

Objectif :
Structurer la documentation MzOS.

Exemple :

docs/
├── architecture
├── decisions
├── development
├── roadmap
└── testing

---

# IDÉE-006 — Branche Dev post-ISO

Statut : Validé

Objectif :
Après création et stabilisation de l'ISO Gaming, créer une branche de développement dédiée aux futures éditions.

Exemples :
- MzOS Creator
- MzOS Audio
- MzOS Streaming
- MzOS Security

---

# IDÉE-007 — Architecture multi-éditions MzOS

Statut : Validé

Objectif :
Conserver un socle commun :

mzos-core

et construire différentes éditions par assemblage de modules.

---

# IDÉE-008 — Vérification post-installation des modules

Statut : Validé

Objectif :
Chaque module doit vérifier que l'installation a produit le résultat attendu.

Exemple :

Steam :
- paquet installé ;
- lanceur présent ;
- environnement fonctionnel.

Bénéfice :
Éviter les installations déclarées réussies alors que le composant n'est pas utilisable.


---

# IDÉE-009 — MzOS Gaming Benchmark

Statut : Validé

Objectif :
Créer un outil permettant de vérifier les capacités gaming d'une machine MzOS.

Informations potentielles :

- CPU
- RAM
- GPU
- pilote graphique
- version Mesa
- OpenGL
- Vulkan
- Steam installé
- Proton disponible
- résultats de tests jeux

Objectif :
Permettre de répondre rapidement :

"Cette machine est-elle prête pour MzOS Gaming ?"

Évolution possible :

mzos benchmark

ou

mzos gaming-test
