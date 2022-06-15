class FullUpperBodyWorkout {
  final String imagePath, name, sets, reps, description;

  FullUpperBodyWorkout({required this.imagePath, required this.name, required this.sets, required this.reps, required this.description});
}

final fullUpperBody = [
    FullUpperBodyWorkout(
        imagePath: "assets/chest.png",
        name: "Supino inclinado no Smith (banco 45)",
        sets: "1",
        reps: "0",
        description: "MR"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/chest.png",
        name: "Supino reto vertical (preferência articulado)",
        sets: "1",
        reps: "0",
        description: "RP"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/chest.png",
        name: "Cross over polia alta",
        sets: "1-1",
        reps: "0",
        description: "WS-BO"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/back.png",
        name: "Desenvolvimento máquina pegada pronada",
        sets: "1",
        reps: "0",
        description: "MR"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/back.png",
        name: "Elevação lateral com halteres",
        sets: "1",
        reps: "0",
        description: "RP"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/back.png",
        name: "Elevação lateral na máquina",
        sets: "1-1",
        reps: "0",
        description: "WS-BO"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/back.png",
        name: "Remada máquina articulada pegada pronada",
        sets: "3 sets - 6 repitions",
        reps: "0",
        description: ""
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/back.png",
        name: "Remada baixa com triângulo",
        sets: "1",
        reps: "0",
        description: "MR"
    ),
    FullUpperBodyWorkout(
        imagePath: "assets/back.png",
        name: "Puxada frente pegada pronada",
        sets: "1-1",
        reps: "0",
        description: "WS-BO"
    ),

];