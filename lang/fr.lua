ZO_CreateStringId("SI_TF_NAME_TEAMFORMATION", "|c00C000Provision|r's |cFF9999Team|cFF0000Formation|r")
ZO_CreateStringId(
	"SI_TF_DESC_TEAMFORMATION",
	"TeamFormation montre la formation de l'équipe (raid / groupe), utile pour les groupes avec plus de 4 membres."
)

ZO_CreateStringId("SI_BINDING_NAME_TEAMFORMATION", "|cFF9999Team|cFF0000Formation|r")

ZO_CreateStringId("SI_TF_ENABLED", "|cFF9999Team|cFF0000Formation|r est activé.")
ZO_CreateStringId("SI_TF_DISABLED", "|cFF9999Team|cFF0000Formation|r est désactivé.")

ZO_CreateStringId("SI_TF_SETTING_ENABLED", "Activer")
ZO_CreateStringId("SI_TF_SETTING_ENABLED_TOOLTIP", "Active TeamFormation.")

ZO_CreateStringId("SI_TF_SETTING_SHOWNOW", "Afficher l'interface")
ZO_CreateStringId(
	"SI_TF_SETTING_SHOWNOW_TOOLTIP",
	"Permet d'afficher TeamFormation pour voir les modifications en direct."
)

ZO_CreateStringId("SI_TF_SETTING_SIZEOPTIONS", "Taille et position de TeamFormation")
ZO_CreateStringId("SI_TF_SETTING_SIZEOPTIONS_TOOLTIP", "Permet de régler la taille et la position de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_X", "Abscisse (X)")
ZO_CreateStringId("SI_TF_SETTING_X_TOOLTIP", "Modifie l'abscisse de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_Y", "Ordonnée (Y)")
ZO_CreateStringId("SI_TF_SETTING_Y_TOOLTIP", "Modifie l'ordonnée de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_WIDTH", "Largeur")
ZO_CreateStringId("SI_TF_SETTING_WIDTH_TOOLTIP", "Modifie la largeur de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_HEIGHT", "Hauteur")
ZO_CreateStringId("SI_TF_SETTING_HEIGHT_TOOLTIP", "Modifie la hauteur de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_LOCK", "Verrouiller la position")
ZO_CreateStringId("SI_TF_SETTING_LOCK_TOOLTIP", "Verrouille la position de TeamFormation.")

ZO_CreateStringId("SI_TF_SETTING_FOCUSOPTIONS", "Interface de TeamFormation")
ZO_CreateStringId("SI_TF_SETTING_FOCUSOPTIONS_TOOLTIP", "Permet de configurer l'interface de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_REFRESHRATE", "Taux de rafraîchissement (ms)")
ZO_CreateStringId(
	"SI_TF_SETTING_REFRESHRATE_TOOLTIP",
	"Nombre de millisecondes entre chaque actualisation de l'interface.\n" ..
		"|cFFFFFF     20 fps = 50 ms        60 fps = 16 ms\n     30 fps = 33 ms      100 fps = 10 ms\n     40 fps = 25 ms|r"
)
ZO_CreateStringId("SI_TF_SETTING_REFRESHRATE_WARNING", "Diminuer cette option peut diminuer les performences.")
ZO_CreateStringId("SI_TF_SETTING_SHAPE", "Forme de l'interface")
ZO_CreateStringId("SI_TF_SETTING_SHAPE_TOOLTIP", "Modifie la forme de TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_SHAPE_RECTANGULAR", "Rectangulaire")
ZO_CreateStringId("SI_TF_SETTING_SHAPE_CIRCULAR", "Circulaire")
ZO_CreateStringId("SI_TF_SETTING_CAMROTATION", "Rotation de la caméra")
ZO_CreateStringId("SI_TF_SETTING_CAMROTATION_TOOLTIP", "Si activé TeamFormation suit l'angle de la caméra.")
ZO_CreateStringId("SI_TF_SETTING_SCALE", "Echelle")
ZO_CreateStringId("SI_TF_SETTING_SCALE_TOOLTIP", "Ajuste l'échelle des repéres dans TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_LOGDIST", "Distance logarithmique")
ZO_CreateStringId(
	"SI_TF_SETTING_LOGDIST_TOOLTIP",
	"0 = Linéaire\nPermet de faire apparaître les répéres lointain plus proche (réduction de la distance)."
)
ZO_CreateStringId("SI_TF_SETTING_CARDINAL", "Transparence des points cardinaux")
ZO_CreateStringId("SI_TF_SETTING_CARDINAL_TOOLTIP", "0 = Masqué\nModifie la transparence des points cardinaux.")
ZO_CreateStringId("SI_TF_SETTING_SIEGE", "Actif en vue d'arme de siege")
ZO_CreateStringId("SI_TF_SETTING_SIEGE_TOOLTIP", "Affiche TeamFormation lorsque vous utilisez une arme de siege.")

ZO_CreateStringId("SI_TF_SETTING_PLAYERICON", "Apparence des points/joueurs")
ZO_CreateStringId("SI_TF_SETTING_PLAYERICON_TOOLTIP", "Permet de modifier l'apparence des icônes sur TeamFormation.")
ZO_CreateStringId("SI_TF_SETTING_YOURALPHA", "Transparence de la flèche du joueur")
ZO_CreateStringId(
	"SI_TF_SETTING_YOURALPHA_TOOLTIP",
	"0 = Masqué\nModifie la transparence de votre point (flèche bleue)."
)
ZO_CreateStringId("SI_TF_SETTING_ROLE", "Afficher le rôle")
ZO_CreateStringId("SI_TF_SETTING_ROLE_TOOLTIP", "Affiche le rôle au lieu de l'icone de classe.")

ZO_CreateStringId("SI_TF_SETTING_COLOROPTIONS", "Personnalisation des couleurs")
ZO_CreateStringId(
	"SI_TF_SETTING_COLOROPTIONS_TOOLTIP",
	"Permet de choisir des couleurs personnalisées pour les icônes."
)
ZO_CreateStringId("SI_TF_SETTING_COLORRESET", "Reset")
ZO_CreateStringId(
	"SI_TF_SETTING_COLORRESET_TOOLTIP",
	"Permet de remettre à zéro les couleurs des joueurs et des classes."
)
ZO_CreateStringId("SI_TF_SETTING_JRULES", "En fonction du joueur")
ZO_CreateStringId("SI_TF_SETTING_JRULES_PSEUDOADD", "1. Ajouter le pseudo :")
ZO_CreateStringId("SI_TF_SETTING_JRULES_PSEUDOADD_TOOLTIP", "Ajoute un pseudo à la liste pour ensuite le modifier.")
ZO_CreateStringId("SI_TF_SETTING_JRULES_PICKPSEUDO", "ou avec son numéro :")
ZO_CreateStringId(
	"SI_TF_SETTING_JRULES_PICKPSEUDO_TOOLTIP",
	"Nécessite d'être en groupe, cette fonction saisi automatiquement le pseudo d'un membre du groupe en fonction de son numéro."
)
ZO_CreateStringId("SI_TF_SETTING_JRULES_ADD", "Ajouter")
ZO_CreateStringId("SI_TF_SETTING_JRULES_PSEUDOCHOICE", "2. Selectionner un joueur")
ZO_CreateStringId("SI_TF_SETTING_JRULES_PSEUDOCHOICE_TOOLTIP", "Choisissez le nom du joueur concerné.")
ZO_CreateStringId("SI_TF_SETTING_JRULES_COLORCHOICE", "3. Définir la couleur")
ZO_CreateStringId("SI_TF_SETTING_JRULES_COLORCHOICE_TOOLTIP", "0 = Désactivé\nChoisissez la couleur de l'icône.")

-- Ye be warned! Thar be no grammar checks here, only Google translations!
ZO_CreateStringId("CROWN_POINTER_THING", "Chose de pointeur de couronne")
ZO_CreateStringId("CROWN_POINTER_ENABLE", "Activer la chose du pointeur de la couronne?")
ZO_CreateStringId(
	"CROWN_POINTER_ENABLE_TOOLTIP",
	"Active ou désactive la grande flèche au centre de votre écran qui vous montre où Crown est"
)
ZO_CreateStringId("CROWN_POINTER_OPACITY", "Opacité de pointeur de couronne")
ZO_CreateStringId(
	"CROWN_POINTER_OPACITY_TOOLTIP",
	"Valeur inférieure pour augmenter la transparence de la grande flèche sur votre écran"
)
ZO_CreateStringId("CROWN_POINTER_SIZE", "Taille de pointeur de couronne")
ZO_CreateStringId("CROWN_POINTER_SIZE_TOOLTIP", "Contrôle la taille de la grosse flèche sur votre écran")
ZO_CreateStringId("CROWN_POINTER_DEBUG_SETTINGS", "Paramètres de débogage")
ZO_CreateStringId("CROWN_POINTER_ENABLE_DEBUG", "Activer le débogage?")
ZO_CreateStringId(
	"CROWN_POINTER_ENABLE_DEBUG_TOOLTIP",
	"Dessine la chose du pointeur de la couronne et vous permet de contrôler certains paramètres de celui-ci"
)
ZO_CreateStringId("CROWN_POINTER_DIRECTION", "Définir la direction de Crown Pointer")
ZO_CreateStringId("CROWN_POINTER_DIRECTION_TOOLTIP", "Définir la direction du pointeur de la couronne en mode débogage")
