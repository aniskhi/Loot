Exercice 1 :

Le code actuel nécessite une clé d'identification pour parcourir la liste de chaînes. Pour itérer à travers les éléments de la liste, une clé est nécessaire.

Exercice 2 :

Nous avons ajouté un bouton supplémentaire à la liste et avons remplacé la première partie de la liste par une boucle 'forEach'. Cette boucle 'forEach' permet de parcourir les éléments de la liste sans reproduire le bouton. Cela permet d'optimiser le code.

Exercice 3 :
Le code ne fonctionne pas car, par défaut, la variable 'loot' est immuable. Par conséquent, pour résoudre ce problème, nous devons ajouter le préfixe '@State' pour indiquer que lorsque la variable change, la vue doit être détruite et reconstruite

Ajouter un item :

Exercice 1 : 

Pour activer le fonctionnement du bouton, il est nécessaire d'ajouter l'annotation @StateObject à l'objet inventaire que nous avons créé. De plus, nous devons inclure l'interface ObservableObject à la classe Inventaire. Enfin, pour garantir que la liste de loot est mise à jour correctement, nous ajoutons l'annotation @Published à cette liste.
L'ajout de ces annotations et de l'interface permettra de gérer les changements d'état de manière appropriée

Exercice 2 : 

L'annotation @StateObject est utilisée pour permettre le rafraîchissement de la vue lorsque les propriétés d'un objet changent. Contrairement à @State, qui est destiné aux objets personnalisés, l'utilisation de @StateObject nécessite l'ajout de l'interface ObservableObject à la classe correspondante. Enfin, pour s'assurer que la liste n'est créée qu'une seule fois dans l'application, nous utilisons également l'annotation @Published.

Exercice 3: 

@State est employé pour gérer des données locales à l'intérieur d'une vue.
@ObservedObject est utilisé pour surveiller des objets extérieurs à la vue.
@StateObject sert à instancier et à conserver une référence à un objet observable au niveau de la vue, tout en garantissant la persistance de cette instance.
