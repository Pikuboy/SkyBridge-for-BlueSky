#!/bin/bash

# Script de diagnostic pour identifier les changements d'API Bluesky v1.4.1
# Exécuter ce script depuis la racine du projet

echo "=========================================="
echo "Diagnostic API Bluesky v1.4.1"
echo "=========================================="
echo ""

# Chemin vers le cache pub
PUB_CACHE=~/.pub-cache/hosted/pub.dev/bluesky-1.4.1/lib/src/services/codegen

echo "1. Structure de NotificationReason:"
echo "-----------------------------------"
if [ -f "$PUB_CACHE/app/bsky/notification/defs/notification.dart" ]; then
    echo "Fichier trouvé, voici la structure de Notification:"
    grep -A 20 "class Notification" "$PUB_CACHE/app/bsky/notification/defs/notification.dart" | head -30
else
    echo "❌ Fichier non trouvé, essai alternatif..."
    find $PUB_CACHE -name "*notification*.dart" -type f | head -3
fi
echo ""
echo ""

echo "2. Import et structure de AppBskyFeedPost:"
echo "------------------------------------------"
if [ -f "$PUB_CACHE/app/bsky/feed/post.dart" ]; then
    echo "✓ Fichier trouvé: app/bsky/feed/post.dart"
    echo "Export dans barrel file?"
    grep -r "export.*post.dart" ~/.pub-cache/hosted/pub.dev/bluesky-1.4.1/lib/ | head -3
else
    echo "Recherche de Post dans le package:"
    find $PUB_CACHE -name "post.dart" -type f | head -5
fi
echo ""
echo ""

echo "3. Structure de ProfileViewBasic:"
echo "---------------------------------"
if [ -f "$PUB_CACHE/app/bsky/actor/defs/profile_view_basic.dart" ]; then
    echo "Fichier trouvé, méthodes disponibles:"
    grep -E "^\s+(static|factory|[A-Za-z]+\s+[a-z])" "$PUB_CACHE/app/bsky/actor/defs/profile_view_basic.dart" | head -20
else
    echo "❌ Fichier non trouvé"
fi
echo ""
echo ""

echo "4. Structure de Label:"
echo "---------------------"
if [ -f "$PUB_CACHE/com/atproto/label/defs/label.dart" ]; then
    echo "Fichier trouvé, propriétés de Label:"
    grep -A 30 "class Label" "$PUB_CACHE/com/atproto/label/defs/label.dart" | head -40
else
    echo "Recherche alternative:"
    find $PUB_CACHE -name "label.dart" -type f | head -3
fi
echo ""
echo ""

echo "5. Structure de ViewerState:"
echo "----------------------------"
if [ -f "$PUB_CACHE/app/bsky/actor/defs/viewer_state.dart" ]; then
    echo "Fichier trouvé, propriétés de ViewerState:"
    cat "$PUB_CACHE/app/bsky/actor/defs/viewer_state.dart" | head -60
else
    echo "Recherche alternative:"
    find $PUB_CACHE -name "*viewer*.dart" -type f | head -5
fi
echo ""
echo ""

echo "6. Vérification des imports dans le barrel file principal:"
echo "----------------------------------------------------------"
if [ -f ~/.pub-cache/hosted/pub.dev/bluesky-1.4.1/lib/bluesky.dart ]; then
    echo "Exports liés à feed/post:"
    grep -i "feed.*post" ~/.pub-cache/hosted/pub.dev/bluesky-1.4.1/lib/bluesky.dart
    echo ""
    echo "Exports liés à notification:"
    grep -i "notification" ~/.pub-cache/hosted/pub.dev/bluesky-1.4.1/lib/bluesky.dart
fi
echo ""
echo ""

echo "=========================================="
echo "Diagnostic terminé!"
echo "=========================================="
