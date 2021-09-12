namespace :exercises do
  desc "Generate exercises for seed database"
  task create_initials: :environment do
    # Exercises
    exercise_count = 0
    exercise_created = 0
    puts "----------------------------------------"
    puts "CREATE EXERCISES"
    puts "----------------------------------------\n"
    [
        {
            name: "Levantamiento de Piernas desde Posición Tumbada",
            description: "Túmbate en el banco o en el suelo con las piernas rectas. Coloca las manos debajo del trasero con las palmas hacia abajo. Mantén las piernas rectas y las rodillas juntas, Levanta los pies lo más verticalmente que puedas.",
            # involved_muscles: []
            # involved_equipment: [] 
            codes: ["flatbenchlyinglegraise1", "flatbenchlyinglegraise2", "flatbenchlyinglegraise3", "flatbenchlyinglegraise4", "flatbenchlyinglegraise5"],
            category: "abdominales"
        },
        {
            name: "Jackknife Sentado",
            description: "Siéntate en el borde del banco y agárrate al asiento detrás de tu espalda como apoyo, extiende las piernas delante de ti, con las rodillas ligeramente dobladas. Eleva las piernas hacia el pecho e inclina el pecho hacia las piernas.",
            codes: ["seatedjackknife1", "seatedjackknife2", "seatedjackknife3", "seatedjackknife4"],
            category: "abdominales"
        },
        {
            name: "Levantamiento de Caderas con Torsión en Banco",
            description: "Túmbate en el suelo con las piernas rectas apuntando al techo y las manos a los lados. Empuja hacia arriba con los pies levantando las caderas del suelo al mismo tiempo e inclinándolas hacia un lado.",
            codes: ["twistinghipraise11", "twistinghipraise12", "twistinghipraise13"],
            category: "abdominales"
        },
        {
            name: "Levantamiento de Caderas con Torsión",
            description: "Túmbate en el suelo con las piernas rectas apuntando al techo y las manos a los lados. Empuja hacia arriba con los pies levantando las caderas del suelo al mismo tiempo e inclinándolas hacia un lado.",
            codes: ["twistinghipraise21", "twistinghipraise22", "twistinghipraise23"],
            category: "abdominales"
        },
        {
            name: "Levantamiento de Caderas con Torsión con Manos Atrás",
            description: "Túmbate en el suelo con las piernas rectas apuntando al techo y las manos a los lados. Empuja hacia arriba con los pies levantando las caderas del suelo al mismo tiempo e inclinándolas hacia un lado.",
            codes: ["twistinghipraise31", "twistinghipraise32", "twistinghipraise33"],
            category: "abdominales"
        },
        {
            name: "Abdominales Peso Corporal",
            description: "Túmbate en el suelo con las plantas de los pies en el suelo y las rodillas dobladas. Extiende los brazos por completo por encima de ti. Levanta la parte superior del cuerpo hacia arriba a la vez que mantienes la parte baja de las espalda en el suelo. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["bodyweightcrunch1", "bodyweightcrunch2", "bodyweightcrunch3"] ,
            category: "abdominales"
        },
        {
            name: "Torsión Rusa",
            description: "Siéntate en el suelo con las piernas dobladas y el torso inclinado ligeramente hacia atrás. Mantén los brazos rectos delante del torso. Rota el torso hacia un lado, al centro y hacia el lado contrario.",
            codes: ["russiantwist1", "russiantwist2", "russiantwist3", "russiantwist4"],
            category: "abdominales"
        },
        {
            name: "Puente Lateral",
            description: "Túmbate de lado con las piernas sobresaliendo. Gira y levanta el cuerpo del suelo, con un brazo doblado paralelo al suelo. Trata de mantener el cuerpo en línea recta y el codo directamente debajo del hombro.",
            codes: ["sidebridge1", "sidebridge2", "sidebridge3"],
            category: "abdominales"
        },
        {
            name: "Dominadas",
            description: "Agarra la barra con las palmas y los dedos de las manos orientados hacia adelante, sin mirar al cuerpo. Lo que se llama agarre ”prono”. Mantén los brazos rectos y cuelga sin balancearte. Relaja los hombros y el cuerpo. Sube con movimiento lento, sin tirones. La barbilla debe sobrepasar la barra. Vuelve a la posición inicial lentamente.",
            codes: ["chinups1", "chinups2", "chinups3"],
            category: "espalda"
        },
        {
            name: "Peso Muerto",
            description: "Posición inicial de piernas separadas a la anchura de los hombros y con los pies apuntando hacia adelante. Baja el trasero hasta que los cuádriceps estén más o menos paralelos al suelo. La barra deberá estar justo por delante de las espinillas. Agarra la haltera con ambas manos para que haya un ligero espacio por fuera de las piernas. Con un arco lumbar, empuja con las piernas y eleva la espalda simultáneamente para que la barra evite las rodillas y repose en la cadera. Los hombros y las piernas deberán estar juntos y los brazos rectos durante todo el ejercicio.",
            codes: ["deadlifts1", "deadlifts2", "deadlifts3", "deadlifts4", "deadlifts5"], 
            category: "espalda"
        },
        {
            name: "Jalones Laterales",
            description: "Fija una barra larga a la máquina de jalones laterales y ajusta los cojinetes para que cuando estés sentado tus rodillas estén en ángulo recto y las plantas de los pies apoyadas en el suelo. Agarra la barra y siéntate manteniendo la parte superior del cuerpo en posición recta, con una ligera inclinación hacia atrás desde las caderas. Levanta la barra de delante de tu rostro hasta la parte de arriba del pecho y haz una pausa. Lentamente, vuelve a dejar la barra en la posición inicial, estirando los brazos.",
            codes: ["latpulldowns1", "latpulldowns2", "latpulldowns3"],
            category: "espalda"
        },
        {
            name: "Remadas Sentado",
            description: "Para comenzar el remo sentado, coge las asas de tu barra favorita (puede ser como la mostrada). Siéntate con la espalda recta, las piernas dobladas y los pies apoyados en el bloque de metal. Extiende los brazos hasta que sientas que los laterales se estiran. Tira del peso hacia tu cuerpo hasta que las asas toquen tu abdomen.",
            codes: ["seatedrows1", "seatedrows2", "seatedrows3", "seatedrows4", "seatedrows5"],
            category: "espalda"
        },
        {
            name: "Remadas de Un Solo Brazo con Mancuernas",
            description: "Coloca tu rodilla y mano izquierdas en un banco y la pierna derecha apoyada firmemente en el suelo. Inclínate hacia delante hasta que tu espalda esté paralela al suelo. Coge una mancuerna con la mano derecha y con la palma mirando hacia el cuerpo y levanta o rema con la mancuerna hacia arriba y hacia la zona de la caja torácica. Vuelve a la posición inicial y repite.",
            codes: ["onearmdumbbellrows1", "onearmdumbbellrows2", "onearmdumbbellrows3"],
            category: "espalda"
        },
        {
            name: "Encogimiento de Hombros con Haltera",
            description: "De pie, recto, con los pies separados a la anchura de los hombros y sujeta una haltera, con ambas manos, delante de ti, usando un agarre prono (con las manos mirando a los muslos). Consejo: La distancia entre las manos debe ser un poco más ancha que la de los hombros. Puedes utilizar muñequeras para un mejor agarre en este ejercicio. Esta es la posición inicial. Levanta los hombros tanto como puedas, al mismo tiempo que espiras, y mantén la contracción durante un segundo. Consejo: Abstente de levantar la haltera usando los biceps. Vuelve a la posición inicial, lentamente y aspirando.",
            codes: ["barbellshrugs1", "barbellshrugs2", "barbellshrugs3"],
            category: "espalda"
        },
        {
            name: "Encogimiento de Hombros con Mancuernas",
            description: "De pie, recto, con las mancuernas colgando a ambos lados y los pies lo bastante separados como para que las mancuernas cuelguen cómodamente. Pueden ser más pesadas de lo que normalmente usas para ejercicios de brazos. Encoge los hombros hacia arriba, tal y como lo harías si estuvieras diciendo ”No lo sé” a alguien en respuesta a una pregunta. No te encorves hacia adelante; trata de permanecer completamente recto. Si ves que te estás enconrvando hacia adelante o doblando hacia atrás, aligera las pesas un poco.",
            codes: ["dumbellshrugs1", "dumbellshrugs2", "dumbellshrugs3"],
            category: "espalda"
        },
        {
            name: "Extensiones de Espalda",
            description: "Colócate en un aparato de estiramiento de espalda y engancha los pies en el ancla de piernas. Tu cuerpo deberá estar en línea recta desde las manos hasta las caderas. Baja el torso, haciendo que se arquee la espalda, hasta que esté casi perpendicular al suelo. Eleva la parte superior del cuerpo hasta que esté ligeramente por encima de la posición paralela al suelo. En este momento, tu espalda deberá formar un ligero arco y tus omoplatos deberán estar unidos. Mantén la posición durante un segundo y repite.",
            codes: ["backextensions1", "backextensions2", "backextensions3"],
            category: "espalda"
        },
        {
            name: "Remada Inclinada",
            description: "De pie con las rodillas ligeramente flexionadas. Dobla el torso en un ángulo de 45 grados, manteniendo la espalda recta. Agarra la barra con una distancia entre las manos superior a la anchura de los hombros y los brazos colgando rectos de los hombros: ⁃	Inhala, contrae el abdominal isométricamente y levanta la barra recta hasta que toque el pecho. ⁃ Vuelve a la posición inicial, exhalando.",
            codes: ["bentoverrow1", "bentoverrow2", "bentoverrow3", "bentoverrow4"],
            category: "espalda"
        },
        {
            name: "Dominadas Invertidas",
            description: "Extiende los brazos y agarra la barra con una distancia entre las manos de la anchura de los hombros: - Inhala y saca el pecho para impulsarte hacia arriba hasta que la barbilla esté a la altura de la barra. - Exhala al completar el movimiento.",
            codes: ["reversechinups1", "reversechinups2", "reversechinups3"],
            category: "espalda"
        },
        {
            name: "Curl",
            description: "De pie, con los pies separados a la anchura de la cadera y los abdominales ocupados mientras sujetas unas mancuernas de peso mediano delante de los muslos. Contrae los biceps y dobla los brazos, curvando las pesas hacia los hombros. Mantén los codos inmóviles y levanta solamente las pesas, tanto como puedas, sin mover los codos. Baja las pesas despacio, manteniendo un ligero doblez en la parte inferior de los codos (ej: no bloquees las articulaciones e intenta mantener la tension en el músculo)",
            codes: ["curls1", "curls2", "curls3", "curls4"],
            category: "biceps"
        },
        {
            name: "Curl con Haltera",
            description: "Empieza en una posición de pie, con los pies separados a la anchura de los hombros y las rodillas relajadas. Agarra una haltera con las manos también a la anchura de los hombros. El agarre deberá ser con las palmas de las manos mirando hacia arriba. Permanece recto y deja que la barra cuelgue delante de tus muslos. Dobla los codos para poner la barra a la altura de los hombros. Permanece en esta posición durante un momento. Baja la barra lentamente hasta la posición inicial.",
            codes: ["barbellcurls1", "barbellcurls2", "barbellcurls3", "barbellcurls4", "barbellcurls5"],
            category: "biceps"
        },
        {
            name: "Curl del Predicador",
            description: "Agarra la barra con las manos a la anchura de los hombros. Lentamente, eleva la barra hacia arriba hasta que tus antebrazos estén apuntando hacia arriba (un poco más que en vertical). Espera un segundo y baja la barra a la posición inicial.",
            codes: ["preachercurls1", "preachercurls2", "preachercurls3", "preachercurls4"],
            category: "biceps"
        },
        {
            name: "Curl de Martillo",
            description: "Sujeta una mancuerna en cada mano con las palmas mirando hacia afuera. Tu brazos deberán formar un ángulo de 90 grados. Manteniendo los codos pegados al cuerpo y en una posición firme, lleva las pesas hacia los hombros. Baja las pesas despacio hasta la posición inicial.",
            codes: ["hammercurls1", "hammercurls2", "hammercurls3", "hammercurls4"],
            category: "biceps"
        },
        {
            name: "Curl de Concentración",
            description: "Empieza sentándote en el borde del banco, sujetando la mancuerna en la mano derecha. Deja que el brazo derecho cuelgue recto, con el codo reposando en la parte inferior de la rodilla. Inclínate hacia adelante hasta que el torso esté sobre las piernas, y coloca la mano izquierda sobre la rodilla izquierda. Doblando el codo, sube la mancuerna a la altura del hombro y haz una pausa antes de volver a bajar la pesa a su posición inicial. Repite hasta que termines la serie y cambia de lado para hacerlo con el brazo izquierdo.",
            codes: ["concentrationcurls1", "concentrationcurls2", "concentrationcurls3", "concentrationcurls4", "concentrationcurls5"],
            category: "biceps"
        },
        {
            name: "Curl Invertido",
            description: "De pie, con las piernas ligeramente separadas y los brazos rectos, y con un agarre con los pulgares mirándose: - Inhala y sube la barra. - Exhala al completar el movimiento. Este ejercicio trabaja los extensores de las muñecas y los dedos, el músculo braquiorradial y, en menor medida, los biceps.",
            codes: ["reversecurls1", "reversecurls2", "reversecurls3", "reversecurls4"],
            category: "biceps"
        },
        {
            name: "Curl de Biceps con Cable",
            description: "Acopla una barra recta a la polea inferior de una estación de cable. Agárrala con las manos a la anchura de los hombros y con un agarre supino y sujétalas con los brazos extendidos, delante de los muslos. Las rodillas deberán estar ligeramente flexionadas. Levanta la barra hacia el pecho tanto como puedas, sin dejar que se mueva la parte superior de los brazos.",
            codes: ["cablebicepscurl1", "cablebicepscurl2", "cablebicepscurl3"],
            category: "biceps"
        },
        {
            name: "Curl Polea Baja",
            description: "De pie y de frente a la máquina, coge el mango con un agarre supino: ⁃Inhala y levanta el mango de la polea ⁃Exhala al completar el movimiento Es un buen ejercicio para aislar e inflar los biceps.",
            codes: ["lowpulleycurls1", "lowpulleycurls2", "lowpulleycurls3"],
            category: "biceps"
        },
        {
            name: "Cruzado Polea Baja y Cable",
            description: "Coloca los cables en la parte inferior de la estacion de crossover y cruza las manos a la altura del rostro y comienza desde abajo hacia arriba. Esta variedad afecta más a la parte superior del pecho.",
            codes: ["lowpulleycablecrossover1", "lowpulleycablecrossover2", "lowpulleycablecrossover3"],
            category: "biceps"
        },
        {
            name: "Elevaciones Dedos del Pie",
            description: "Empieza con una posición neutral, con los pies a la anchura de los hombros o un poco más separados. Sujeta las mancuernas en ambas manos. Eleva los dedos de los pies, contrayendo los músculos de las pantorrillas, y bajando lentamente hasta completar el movimiento.",
            codes: ["toeraises1", "toeraises2", "toeraises3"],
            category: "piernas"
        },
        {
            name: "Elevaciones Dedos del Pie con Una Sola Pierna",
            description: "Apóyate en un solo pie, colocando los dedos y el metatarso en el bloque. Sujeta una mancuerna en la mano del mismo lado que el pie en el que te estás apoyando, y agarra el eje de la máquina con tu otra mano, para mantener el cuerpo en posición durante el ejercicio. ⁃Elévate tanto como puedas sobre los dedos de los pies (flexión plantar), manteniendo la rodilla estirada o muy ligeramente flexionada. ⁃Vuelve a la posicion inicial.",
            codes: ["onelegtoeraises1", "onelegtoeraises2", "onelegtoeraises3"],
            category: "piernas"
        },
        {
            name: "Elevación Pantorrillas Sentado",
            description: "Ajusta el cojinete de manera que tus espinillas estén rectas y el cojinete quede justo por detrás de las rodillas. Levanta el peso, empujando los talones hacia arriba con los metatarsos de los pies. Baja los talones lentamente hasta que sientas un estiramiento en el músculo de la pantorrilla. Para ejercitar la pantorrilla interior y la exterior, coloca tus dedos hacia dentro y fuera respectivamente.",
            codes: ["seatedcalfraises1", "seatedcalfraises2", "seatedcalfraises3"],
            category: "piernas"
        },
        {
            name: "Press de Banca",
            description: "Para hacer un ejercicio de press de banca correctamente, tendrás que tumbarte en un banco y tener las plantas de los pies en el suelo. La barra, una vez colocada en el bastidor, deberá estar ligeramente por detrás de tu cabeza. Es imporante tener un observador durante este ejercicio, sobre todo si utilizas una barra suelta o mancuernas, para eliminar la posibilidad de que se te caigan encima. Una vez que hayas levantado el peso del bastidor, la barra estará directamente sobre el centro de tu pecho. Mantén la cabeza en el banco en todo momento. Una vez que tengas controlado el peso de la barra, bájala lentamente hasta el nivel del pecho, si puedes. Mantén los brazos apuntando hacia fuera mientras cae la barra. Al llegar al final del movimiento, vuelve a empujar la barra hacia arriba, concentrándote en hacerlo con el pecho y los brazos.",
            codes: ["benchpresses1", "benchpresses2", "benchpresses3"],
            category: "pectorales"
        },
        {
            name: "Press Inclinado",
            description: "Este ejercicio es muy parecido al de press de banca con haltera, excepto que estarás utilizando una máquina de press de banca inclinada con peso libre y que el grupo de músculos trabajado será el de la parte superior del pecho, en lugar del de la parte del medio. Levanta la haltera del bastidor y bájala lentamente hasta unos 8 centimetros sobre tu clavícula (justo por encima de la nuez) y vuelve a empujarla a su poscición inicial. NO DEJES QUE LA BARRA TOQUE LA PARTE SUPERIOR DEL PECHO (esto causa un estrés innecesario en las articulaciones de los hombros y aleja la tensión de los músculos superiores del pecho, ¡que son los que queremos ejercitar!). Asegúrate de que cuando bajes la barra lo hagas despacio y de manera controlada. Y a la inversa, cuando la eleves, lo deberás hacer de manera explosiva.",
            codes: ["inclinepresses1", "inclinepresses2", "inclinepresses3", "inclinepresses4"],
            category: "pectorales"
        },
        {
            name: "Press con Mancuernas Tumbado",
            description: "Ponte en posición sentada en el banco, sujeta las mancuernas y deja que reposen en los muslos. Al echarte hacia atrás para tumbarte en el banco, utiliza los muslos para ayudarte a mover las mancuernas hasta el pecho. Endereza los brazos sobre el pecho (manteniendo una ligera flexión en el codo), con las palmas mirando hacia fuera. Mantén las plantas de los pies en el suelo y la espalda en posición neutral (nada más que un pequeño arco). Baja las mancuernas doblando los codos hacia los lados. Sigue hasta que los codos estén justo por debajo de los hombros. Entonces sube las mancuernas otra vez, juntándolas arriba (sin que se toquen), y ligeramente inclinadas hacia dentro. Mantén los codos ligeramente flexionados, no dejes que se ”bloqueen”. Repite hasta que termines la serie. Para levantarte, sujeta las mancuernas junto al pecho, echa las piernas hacia arriba y hacia adelante, para darle al cuerpo el impulso necesario para sentarte.",
            codes: ["dumbbellpresses1", "dumbbellpresses2", "dumbbellpresses3"],
            category: "pectorales"
        },
        {
            name: "Dips en Barras Paralelas",
            description: "Primero, mantén la cabeza baja durante la duración del ejercicio y mueve el cuerpo hacia adelante. Segundo, saca los codos un poco. Así, mantén los codos fuera y separados del cuerpo. Esto garantiza un mayor uso de los músculos del pecho que de los triceps. Recuerda, concéntrate en contraer toda la zona del pecho en la cúspide del movimiento.",
            codes: ["parallelbardips1", "parallelbardips2", "parallelbardips3", "parallelbardips4"],
            category: "pectorales"
        },
        {
            name: "Crucifijo Cruzado con Cable",
            description: "Este ejercicio se realiza usando la máquina de poleas de cable que tiene una polea en cada lado opuesto. Coloca cada polea en la parte superior, de manera que estén bloqueadas en la posición elevada (si no sabes cómo hacerlo, pídele a un entrenador del gimnasio en el que entrenas que te ayude). Estando de pie, agarra las poleas utilizando un pequeño acoplamiento de una sola mano para cada mano. Junta lentamente los brazos de forma controlada. Al hacerlo,imagínate que estás abrazando un enorme árbol. Y flexiona tus pecs durante un segundo, para volver a la posición inicial y repetir.",
            codes: ["cablecrossoverflys1", "cablecrossoverflys2", "cablecrossoverflys3"],
            category: "pectorales"
        },
        {
            name: "Crucifijo con Mancuernas",
            description: "Para hacer el crucifijo con mancuernas, coge un peso relativamente ligero en cada mano. Tendrás que probar para determinar cuál es el peso adecuado para tu crucifijo con mancuernas. Empieza con un peso más ligero y vete aumentando. Túmbate en un banco de pesas y eleva ambas mancuernas sobre el pecho, con los brazos rectos. Esta es la posición de inicio. Extiende los brazos hacia fuera, formando un arco amplio, hasta que estén a los lados del cuerpo. Pueden estar ligeramente flexionados. Sigue el mismo arco en sentido contrario hasta que las mancuernas regresen a la posición inicial. Este ejercicio es una de las repiticiones del crucifijo con mancuernas.",
            codes: ["dumbbellflys1", "dumbbellflys2", "dumbbellflys3"],
            category: "pectorales"
        },
        {
            name: "Pullovers con Mancuerna",
            description: "Muy parecido al pullover con haltera y brazo flexionado, pero se usa una mancuerna en lugar de una haltera. Túmbate de espaldas en un banco horizontal. Comienza el ejercicio sosteniendo la mancuerna por encima del pecho, con los codos ligeramente flexionados. Baja la mancuerna lentamente, de manera que los brazos (y la mancuerna) terminen detrás de la cabeza, tan lejos como puedas. Tus brazos y la mancuerna acabarán por detrás/ encima de tu cabeza y por debajo del banco – esto te proporcionará un excelente estiramiento! Lleva a la mancuerna a la posición inicial lentamente, concentrándote en mantener los codos bloqueados en una posición ligeramente flexionada.",
            codes: ["dumbbellpullovers1", "dumbbellpullovers2", "dumbbellpullovers3", "dumbbellpullovers4"],
            category: "pectorales"
        },
        {
            name: "Flexiones",
            description: "Colócate boca abajo con los brazos rectos, las palmas de las manos apoyadas en el suelo y a la distancia de la anchura de los hombros (o más). Mantén los pies juntos o ligeramente separados: ⁃	Inhala y dobla los codos, llevando el torso cerca del suelo, evitando la hiperextensión de la columna. ⁃Empuja el cuerpo hacia arriba, hasta la posición inicial, exhalando al completar el movimiento.",
            codes: ["push_ups1", "push_ups2", "push_ups3"],
            category: "pectorales"
        },
        {
            name: "Press con Mancuernas",
            description: "Túmbate en el banco con los pies apoyados en el suelo para tener estabilidad, los brazos extendidos hacia arriba y las manos, sujetando las mancuernas, mirándose de frente: ⁃	Inhala y baja las mancuernas al nivel del pecho, doblando los codos y rotando los antebrazos hasta que las manos estén en posición prono. ⁃Vuelve a elevar las mancuernas y ejecuta una contracción isométrica para aislar el estrés de los pectorales; exhala mientras completas el movimeinto.",
            codes: ["dumbbellpress1", "dumbbellpress2", "dumbbellpress3", "dumbbellpress4"],
            category: "pectorales"
        },
        {
            name: "Press en Banco con Haltera",
            description: "Túmbate de espaldas en un banco inclinado. Sujeta la haltera con un agarre prono. Baja la haltera hacia la parte inferior del pecho, mientras mantienes los codos pegados al cuerpo. La haltera deberá tocar ligeramente el pecho al final del movimiento.",
            codes: ["barbellbenchpress1", "barbellbenchpress2", "barbellbenchpress3"],
            category: "pectorales"
        },
        {
            name: "Crucifijos en Pec Deck",
            description: "Siéntate en el asiento de la máquina y presiona los codos en las almohadillas, relajando los antebrazos y las muñecas: ⁃Inhala y junta las almohadillas hasta que se toquen delante del pecho. ⁃Exhala mientras completas el movimiento.",
            codes: ["pecdeckflies1", "pecdeckflies2", "pecdeckflies3"],
            category: "pectorales"
        },
        {
            name: "Curl de Muñeca",
            description: "Siéntate con los antebrazos apoyados en los muslos o en un banco. Coge La barra con un agarre supino y con las muñecas extendidas pasivamente: ⁃Inhala y eleva la muñeca. ⁃Exhala mientras completas el movimiento.",
            codes: ["wristcurls1", "wristcurls2", "wristcurls3"],
            category: "antebrazos"
        },
        {
            name: "Curl de Muñeca con mancuerna",
            description: "Siéntate en un banco. Con una mancuerna y las muñecas extendidas pasivamente: ⁃	Inhala y eleva la muñeca. ⁃Exhala mientras completas el movimiento. ⁃ Este ejercicio trabaja los flexores de la muñeca y los dedos.",
            codes: ["wristcurls21", "wristcurls22", "wristcurls23"],
            category: "antebrazos"
        },
        {
            name: "Sentadillas",
            description: "Las sentadillas consisten en agacharte sin doblar la espalda. En su lugar, se usan las piernas, manteniendo la columna en una posición neutral. Colócate de pie con los pies separados a la anchura de los hombros. Presiona las caderas hacia atrás y dobla las rodillas. Soporta el peso con los talones, no con el metatarso de los pies. Las rodillas deberán estar por detrás de los dedos de los pies. Sigue bajando hasta que las rodillas fomen un ángulo de 90 grados. Mantén la posición durante un segundo y empuja con los talones para extender las rodillas y las caderas.",
            codes: ["squats1", "squats2", "squats3", "squats4"],
            category: "piernas"
        },
        {
            name: "Press de Pierna Inclinado",
            description: "Siéntate en la máquina con la espalda y la cabeza apoyadas en la parte acolchada. Coloca los pies en el reposapiés, separados a la anchura de los hombros, y asegurándote de que los talones toquen la superficie. Las piernas deberán formar un ángulo de unos 90 grados en la rodilla, manteniendo siempre los talones apoyados en el reposapiés. Las rodillas deberán estar en línea con los pies y sin doblarse hacia fuera o hacia dentro. El trasero no deberá elevarse del asiento. Si lo hace, y las piernas forman un ángulo demasiado agudo, tendrás que ajustar el asiento hasta la posicion correcta. Podrás reconocer esta mala postura si tus rodillas parecen estar a la altura de tus ojos y te sientes un poco incómodo. Agarra los mangos de asistencia.",
            codes: ["angledlegpresses1", "angledlegpresses2", "angledlegpresses3", "angledlegpresses4"],
            category: "piernas"
        },
        {
            name: "Extensión de Cadera utilizando el Peso del Cuerpo",
            description: "1. Túmbate en el suelo. Un pie plano sobre el suelo y la pierna contraria recta. Utiliza las manos para estabilizar la posición. Levanta la pierna recta hasta que la parte inferior de tu espalda se separe del suelo. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["bodyweighthipextension1", "bodyweighthipextension2", "bodyweighthipextension3"], 
            category: "abdominales"
        },
        {
            name: "Extensión y Rotación con Brazos Abiertos",
            description: "1. Comenzar en posición de flexiones de brazos. Mantener los brazos rectos y la parte central del cuerpo en tensión. Desplaza el peso sobre el brazo izquierdo, gira el torso hacia la derecha, y eleva el brazo derecho hacia el techo, hasta que tu cuerpo forme una T. Mantén la postura durante tres segundos, vuelve al punto de partida y repite sobre el otro lado. Esto es una rep.",
            codes: ["rotatingtextension1", "rotatingtextension2", "rotatingtextension3"],
            category: "abdominales"
        },
        {
            name: "Supermán",
            description: "1. Colócate a gatas con las rodillas por debajo de las caderas y separadas a la anchura de éstas, y las manos en el suelo, separadas a la anchura de los hombros y por debajo de estos. Pon la columna vertebral en posición neutral. Activa tu núcleo retractando los músculos abdominales hacia la columna vertebral. Sin ningún movimiento lateral y manteniendo el abdomen hacia dentro, exhala y eleva lentamente un brazo y la pierna opuesta, hasta que queden paralelos al suelo. Asegúrate de seguir el ritmo que te hayas impuesto. Inhala y regresa lentamente el brazo y la pierna a la posición inicial. Repetir el número de veces deseado y, a continuación, repetir el ejercicio con el otro brazo y pierna.",
            codes: ["superman1", "superman2", "superman3"],
            category: "abdominales"
        },
        {
            name: "Supermán con Peso Corporal",
            description: "1. Túmbate boca abajo en el suelo. Extiende los brazos frente a ti. Eleva las piernas y la parte superior del cuerpo hacia el techo. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["bodyweightsuperman1", "bodyweightsuperman2", "bodyweightsuperman3"],
            category: "espalda"
        },
        {
            name: "Inclinación hacia Adelante con Mancuernas",
            description: "1. Coge un par de mancuernas y dobla la cintura hacia adelante, manteniendo la espalda recta. Coloca los brazos extendidos hacia abajo y con las palmas de las manos una frente a la otra. Levanta las mancuernas hacia los lados del pecho y vuelve a la posición inicial manteniendo la espalda recta y estable todo el tiempo.",
            codes: ["dumbbellsbentoverrow1", "dumbbellsbentoverrow2", "dumbbellsbentoverrow3"],
            category: "espalda"
        },
        {
            name: "Hiperextensiones con Pelota Suiza",
            description: "1. Túmbate boca abajo sobre la pelota. Toda la parte superior del cuerpo debe estar sobre la pelota. Coloca los brazos sobre la cabeza. Dobla la parte superior del cuerpo hacia arriba, hasta que el pecho deje de estar en contacto con la pelota. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["stabilityballhyperextension1", "stabilityballhyperextension2", "stabilityballhyperextension3"],
            category: "espalda"
        },
        {
            name: "Inclinación hacia Adelante Sentado",
            description: "1. Siéntate en el extremo de un banco con las rodillas dobladas y los pies planos sobre el suelo y coloca un par de mancuernas en el suelo a cada lado. Dobla la cintura hacia adelante todo lo que puedas, hasta que la espalda esté casi en paralelo con el suelo - el pecho debe tocar las piernas. Estírate y agarra una mancuerna con cada mano y deja que los brazos cuelguen hacia abajo. 2. Gira las mancuernas hasta que las palmas de tus manos estén una frente a la otra. 3. Sin mover nada más que los brazos, eleva lentamente las mancuernas hacia el cuerpo, a cada lado del pecho. 4. Mantén la posición durante un segundo, y vuelve a bajar las mancuernas.",
            codes: ["seatedbentoverrow1", "seatedbentoverrow2", "seatedbentoverrow3"],
            category: "espalda"
        },
        {
            name: "Remo Inclinado con Barra-T",
            description: "1. Móntate en una máquina de remo con Barra T y sujeta el manillar  con un agarre prono. Asegúrate de que tus pies estén separados a la anchura de los hombros y las rodillas ligeramente dobladas, como se muestra en la figura. 2. Mantén la espalda recta y dobla la cintura hasta que la parte superior del cuerpo esté a unos 45 grados de la vertical, y la barra colgada al alcance de las manos directamente por debajo de los hombros. 3. Juntando los omóplatos, levanta la barra lo más cerca que puedas de la parte inferior del pecho. Pausa, y baja lentamente la barra hasta la posición inicial.",
            codes: ["tbarbentoverrow1", "tbarbentoverrow2", "tbarbentoverrow3"],
            category: "espalda"
        },
        {
            name: "Curl de Bíceps con Mancuerna (Agarre Martillo con Banco)",
            description: "1. De pie y con la espalda recta, sujeta una mancuerna con agarre martillo. Reposa el brazo en la parte superior de un banco inclinado. 2. Levanta la mancuerna sin mover la parte superior de los brazos. Mantén la posición durante un segundo. Devuelve la mancuerna a la posición inicial.",
            codes: ["dumbbellbicepscurl_hammergriponbench_1", "dumbbellbicepscurl_hammergriponbench_2", "dumbbellbicepscurl_hammergriponbench_3"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna (Agarre Martillo de Pie)",
            description: "1. De pie y con la espalda recta, sujeta las mancuernas a los lados con un agarre martillo. Mantén los brazos rectos. 2. Levanta las mancuernas sin mover la parte superior de los brazos. Evita usar los hombros durante el movimiento. 3. Mantén la posición durante un segundo y vuelve a la posición inicial.",
            codes: ["dumbbellbicepscurl_hammergripstanding_1", "dumbbellbicepscurl_hammergripstanding_2", "dumbbellbicepscurl_hammergripstanding_3"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna (Concentración Agarre Supino con un Solo Brazo)",
            description: "1. Dobla las rodillas ligeramente. Mantén la espalda doblada y recta. Sujeta una mancuerna con agarre supino. Coloca el codo en la parte interior del muslo. 2. Levanta la mancuerna sin mover la parte superior del brazo. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["dumbbellbicepscurl_underhandgripconcentrationwithsinglearm_1", "dumbbellbicepscurl_underhandgripconcentrationwithsinglearm_2", "dumbbellbicepscurl_underhandgripconcentrationwithsinglearm_3"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna (Agarre Supino con Banco)",
            description: "1. De pie y con la espalda recta, sujeta una mancuerna con un agarre supino. Reposa el brazo en la parte superior de un banco inclinado. 2. Levanta la mancuerna sin mover la parte superior de los brazos. Mantén la posición durante un segundo. Baja la mancuerna hasta la posición inicial.",
            codes: ["dumbbellbicepscurl_underhandgriponbench_1", "dumbbellbicepscurl_underhandgriponbench_2", "dumbbellbicepscurl_underhandgriponbench_3"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna Sentado (Agarre Martillo)",
            description: "1. Sentado y con la espalda recta, deja que las mancuernas cuelguen junto a ti con un agarre martillo. Mantén los brazos rectos. 2. Levanta las mancuernas sin mover la parte superior de los brazos. Evita usar los hombros durante el movimiento. Mantén la posición durante un segundo, y vuelve a la posición inicial.",
            codes: ["dumbbellbicepscurlseated_hammergrip_1", "dumbbellbicepscurlseated_hammergrip_2", "dumbbellbicepscurlseated_hammergrip_3", "dumbbellbicepscurlseated_hammergrip_4"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna Sentado (Agarre Supino)",
            description: "1. Sentado y con la espalda recta, deja que las mancuernas cuelguen a tus lados con un agarre supino. Mantén los brazos rectos. 2. Levanta las mancuernas sin mover la parte superior de los brazos. Evita usar los hombros durante el movimiento. Mantén la posición durante un segundo, y vuelve a la posición inicial.",
            codes: ["dumbbellbicepscurlseated_underhandgrip_1", "dumbbellbicepscurlseated_underhandgrip_2", "dumbbellbicepscurlseated_underhandgrip_3"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna y Pelota Suiza Sentado", 
            description: "1. Sentado en posición vertical sobre una pelota suiza, sujeta un par de mancuernas con los brazos completamente extendidos a los lados. Las palmas de las manos deben mirar hacia fuera, como se muestra en la ilustración.\n\n2. Gira gradualmente los brazos a la altura del codo, elevando las mancuernas a la altura de los hombros, sin cambiar la posición de los brazos. El brazo deberá doblarse por el codo sin moverse en ninguna otra dirección. No gires las muñecas al levantar las mancuernas.",
            codes: ["stabilityballdumbbellbicepscurlseated1", "stabilityballdumbbellbicepscurlseated2", "stabilityballdumbbellbicepscurlseated3"],
            category: "biceps"
        },
        {
            name: "Curl de Bíceps con Mancuerna Pelota Suiza Predicador",
            description: "1. Coloca un par de mancuernas en el suelo, delante de la pelota. Arrodíllate detrás de la pelota y cúbrela con los brazos para coger las mancuernas con un agarre supino. Deja que el peso vaya hacia los talones cuando cubres la pelota con los tríceps, antebrazos hacia abajo.\n\n2. Mantén la espalda recta mientras giras las mancuernas hasta que los antebrazos estén casi perpendiculares al suelo.",
            codes: ["stabilityballdumbbellbicepspreachercurl1", "stabilityballdumbbellbicepspreachercurl2", "stabilityballdumbbellbicepspreachercurl3"],
            category: "biceps"
        },
        {
            name: "Boca Abajo en Banco Inclinado con Agarre Supino",
            description: "1. Túmbate hacia abajo en un banco inclinado. Deja que las mancuernas cuelguen junto a ti con un agarre supino. Mantén los brazos rectos.\n\n2. Elevar las mancuernas lentamente hacia arriba. No se debe mover las muñecas, evita girarlas y mantén la parte superior de los brazos perpendiculares al suelo.",
            codes: ["underhandgripproneonaninclinebench1", "underhandgripproneonaninclinebench2", "underhandgripproneonaninclinebench3"],
            category: "biceps"
        },
        {
            name: "Elevación de Gemelos con Pesa (Sentado)",
            description: "1. Sentado y con la espalda recta, coloca la pesa en la parte inferior de los muslos. Utiliza las manos para estabilizar cualquier movimiento de la pesa.\n\n2. Eleva los gemelos poniéndote de puntillas. Mantén la posición durante un segundo. Baja los gemelos.",
            codes: ["barbellcalfraise_seated_1", "barbellcalfraise_seated_2", "barbellcalfraise_seated_3"],
            category: "piernas"
        },
        {
            name: "Elevación de Gemelos con Pesa Una Sola Pierna (Sentado)",
            description: "1. Sentado y con la espalda recta, coloca la pesa sobre la parte inferior de uno de tus muslos. Utiliza las manos para estabilizar cualquier movimiento de la pesa.\n\n2. Eleva los gemelos poniéndote de puntillas. Mantén la posición durante un segundo. Baja los gemelos.\n\n3. Repite el mismo ejercicio con la otra pierna.",
            codes: ["barbellcalfraisewithsingleleg_seated_1", "barbellcalfraisewithsingleleg_seated_2", "barbellcalfraisewithsingleleg_seated_3"],
            category: "piernas"
        },
        {
            name: "Saltos de Gemelos con Mancuernas",
            description: "1. De pie y con los pies separados a la anchura de las caderas. Coge un par de mancuernas y sujétalas a los lados del cuerpo con los brazos extendidos.\n\n2. Dobla las rodillas unos 45 grados y salta tan alto como puedas. Apunta hacia abajo con los dedos de los pies mientras saltas.\n\n3. Deja que las rodillas se doblen 45 grados cuando aterrices, y salta de nuevo inmediatamente.",
            codes: ["dumbbellcalfjump1", "dumbbellcalfjump2", "dumbbellcalfjump3"],
            category: "piernas"
        },
        {
            name: "Elevación de Gemelos con Mancuernas (Sentado)",
            description: "1. Sentado y con la espalda recta, coloca una mancuerna en la parte inferior de cada muslo. Utiliza las manos para estabilizar cualquier movimiento.\n\n2. Eleva los gemelos poniéndote de puntillas. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["dumbbellcalfraise_seated_1", "dumbbellcalfraise_seated_2", "dumbbellcalfraise_seated_3"],
            category: "piernas"
        },
        {
            name: "Elevación de Gemelos con Pesa de Pie", 
            description: "1. De pie y con la espalda recta, coloca la pesa encima de los hombros. Sujeta la pesa con un agarre prono. La distancia entre las manos debe ser más grande que la anchura de los hombros.\n\n2. Elevar los gemelos poniéndote de puntillas. Mantén la posición durante un segundo. Baja los gemelos.",
            codes: ["standingbarbellcalfraise1", "standingbarbellcalfraise2", "standingbarbellcalfraise3"],
            category: "piernas"
        },
        { 
            name: "Elevación de Gemelos con Mancuernas de Pie",
            description: "1. De pie y con los pies separados a la anchura de las caderas, sujeta una mancuerna en cada mano, con los brazos a los costados.\n\n2. Manteniendo la espalda recta, elévate lentamente sobre las puntas de los pies, subiendo los talones lo más alto que puedas.\n\n3. Pausa arriba y baja los talones lentamente hasta el suelo.",
            codes: ["standingdumbbellcalfraise1", "standingdumbbellcalfraise2", "standingdumbbellcalfraise3"],
            category: "piernas"
        },
        {
            name: "Flexiones Declinadas",
            description: "1. Coloca los pies en un banco o un escalón elevado y ponte en la posición inicial para flexiones.\n\n2. Baja el cuerpo hasta que tu pecho casi toque el suelo, haz una pausa y vuelve a la posición inicial. Mantén una postura adecuada en todo momento, evitando que la cadera quede colgando, mantén el núcleo rígido apretando los músculos abdominales, estira las piernas y carga el peso en los dedos de los pies.",
            codes: ["declinepushup1", "declinepushup2", "declinepushup3"],
            category: "pectorales"
        },
        {
            name: "Flexiones Bombardero",
            description: "1. Colócate en la posición inicial para flexiones, pero asegúrate de que tus manos están más adelante y más separadas que la anchura de los hombros. Eleva las caderas y mueve los pies hacia adelante todo lo que puedas. Mantén la espalda y las piernas recta durante todo el movimiento.\n\n2. Mueve el pecho hacia abajo y hacia adelante hasta casi tocar el suelo. Los hombros deben estar en línea con las manos.\n\n3. Haz una pausa, y empujar las caderas hacia abajo y estira los brazos. Otra pausa, y realiza el movimiento hacia atrás, hasta la posición inicial.",
            codes: ["divebomberpushup1", "divebomberpushup2", "divebomberpushup3", "divebomberpushup4"],
            category: "pectorales"
        },
        {
            name: "Press Pectoral con Mancuernas Suelo", 
            description: "1. Túmbate en el suelo. Coge las mancuernas con un agarre prono. Reposa la parte superior de los brazos en el suelo con las mancuernas apuntando hacia el techo.\n\n2. Extiende completamente los brazos hacia el techo. Mantén la posición durante un segundo. Mantén toda la espalda en el banco en todo momento. Evita mover las piernas. Vuelve a la posición inicial.",
            codes: ["dumbbellfloorchestpress1", "dumbbellfloorchestpress2", "dumbbellfloorchestpress3"],
            category: "pectorales"
        },
        {
            name: "Flexiones con Mancuernas",
            description: "1. Con dos mancuernas en las manos, separadas a la anchura de los hombros en el suelo delante de ti, arrodíllate y cógelas. Mantén los brazos rectos, las piernas extendidas, los pies bastante juntos y bloquea los codos.\n\n2. Baja el cuerpo hasta el suelo, doblando los codos y con la espalda recta.\n\n3. Empuja hacia arriba hasta que los brazos estén rectos y los codos desbloqueados. Repite.",
            codes: ["dumbbellpushup1", "dumbbellpushup2", "dumbbellpushup3"],
            category: "pectorales"
        },
        {
            name: "Flexiones Inclinadas",
            description: "1. Coloca las manos sobre un banco y adopta la posición de inicio de flexiones.\n\n2. Baja el cuerpo hasta que tu pecho casi toque el banco, haz una pausa y empuja el cuerpo hacia arriba hasta la posición inicial. Mantén una forma adecuada impidiendo que tus caderas cuelguen en todo momento, mantén el torso rígido apretando los músculos abdominales, y estira las piernas mientras cargas el peso sobre los dedos de los pies. Repite.",
            codes: ["inclinepushup1", "inclinepushup2", "inclinepushup3"],
            category: "pectorales"
        },
        {
            name: "Flexión con Pelota Medicinal (Alternando)",
            description: "1. Túmbate con las manos en el suelo. Coloca las manos junto a parte inferior del pecho. La distancia entre las manos debe ser un poco más grande que la anchura de los hombros. Elévate con los brazos hasta que sólo tus manos y pies estén en el suelo. Mantén la espalda recta. Coloca la pelota medicinal bajo una mano. Con las manos apuntando ligeramente hacia afuera.\n\n2. Baja el cuerpo hasta que quede a unos pocos centímetros del suelo, doblando los codos. Los codos deben doblarse hacia los pies. Mantén la posición durante un segundo. Vuelve a la posición inicial.\n\n3. Coloca la pelota bajo la otra mano y repite los mismo movimientos.",
            codes: ["medicineballpushup_alternating_1", "medicineballpushup_alternating_2", "medicineballpushup_alternating_3", "medicineballpushup_alternating_4", "medicineballpushup_alternating_5"],
            category: "pectorales"
        },
        {
            name: "Flexiones Modificadas", 
            description: "1. De rodillas y con las manos en el suelo un poco más separadas que la anchura de los hombros, cruza los tobillos por detrás, como se muestra en la ilustración.\n\n2. Baja el cuerpo hasta que el pecho casi toque el suelo, haz una pausa y sube hasta la posición inicial. Mantén tu núcleo rígido, apretando los músculos abdominales.",
            codes: ["modifiedpushup1", "modifiedpushup2", "modifiedpushup3"],
            category: "pectorales"
        },
        {
            name: "Flexión de Un Solo Brazo",
            description: "1. Colócate en la posición de inicio para flexiones: boca abajo, con los pies juntos y las manos en el suelo, justo por debajo del nivel de los hombros y a la anchura de éstos. Separa los pies, un poco más que la anchura de los hombros.\n\n2. Levanta una mano y colócala en la parte inferior de la espalda,\n\n3. Con la otra mano, empuja el cuerpo hacia arriba, manteniendo la espalda recta. Detente justo antes de que se \"bloquee\" el codo en la parte superior del movimiento.\n\n4. Baja el cuerpo con un solo brazo. Para mantener el equilibrio, gira el torso ligeramente al lado contrario del brazo que está apoyado en el suelo.\n\n5. Continúa bajando hasta que la barbilla esté a un puño de distancia del suelo. Al haber girado el torso, tu barbilla estará ahora más o menos donde estaba la mano de detrás de la espalda cuando empezaste el ejercicio. Esta es una repetición.\n\n6. Vuelve al paso uno y repite con el otro brazo.",
            codes: ["singlearmpushup1", "singlearmpushup2", "singlearmpushup3"],
            category: "pectorales"
        },
        {
            name: "Mosca con Mancuernas y Pelora Suiza Plana",
            description: "1. Túmbate sobre la pelota. Con los pies en el suelo. Sujeta dos mancuernas con un agarre martillo. Extiende los brazos completamente sobre el pecho.\n\n2. Doblando ligeramente los codos, baja las mancuernas a cada lado hasta que estén junto a la parte superior de tu cuerpo. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["stabilityballflatdumbbellfly1", "stabilityballflatdumbbellfly2", "stabilityballflatdumbbellfly3"],
            category: "pectorales"
        },
        {
            name: "Press Pectoral con Mancuernas y Pelota Suiza Plano",
            description: "1. Túmbate sobre la pelota. Con los pies en el suelo Sujeta las mancuernas con un agarre prono. Mantenlas junto al pecho.\n\n2. Extiende completamente los brazos frente a ti. Mantén la posición durante un instante. Vuelve a la posición inicial.",
            codes: ["stabilityballflatdumbbellchestpress1", "stabilityballflatdumbbellchestpress2", "stabilityballflatdumbbellchestpress3"],
            category: "pectorales"
        },
        {
            name: "Flexiones con Pelota Suiza",
            description: "1. Colócate en la posición inicial para flexiones. Para que sea más difícil, coloca las espinillas y los pies sobre la pelota. Acuérdate de sujetar el peso de tu cuerpo con la región metatarsiana de los pies y las manos, con éstas separadas a la anchura de los hombros y con las palmas contra el suelo.\n\n2. Baja el torso hasta que tu pecho se encuentre a medio centímetro del suelo. Elévate de nuevo hasta la posición inicial.",
            codes: ["stabilityballpushup1", "stabilityballpushup2", "stabilityballpushup3"],
            category: "pectorales"
        },
        {
            name: "Flexiones con Peso",
            description: "1. Colócate en la posición de inicio para flexiones, con las manos por debajo de los hombros. Esta vez tendrás que pedir a un compañero que te coloque un disco en la espalda entre los omóplatos.\n\n2. Mantén el cuerpo recto mientras bajas, doblando el codo hasta que tu pecho toque el suelo.\n\n3. Haz una pausa, y empuja el cuerpo hacia arriba.",
            codes: ["weightedpushup1", "weightedpushup2", "weightedpushup3"],
            category: "pectorales"
        },
        {
            name: "Giro de Muñeca con Mancuerna",
            description: "1. De pie, con unas mancuernas ligeras en cada mano y los brazos a los lados, con las palmas de las manos un frente a la otra por detrás del cuerpo. Dobla los brazos para girar las mancuernas hacia arriba, hasta que los antebrazos estén paralelos al suelo. Esta es la posición de inicio.\n\n2. Gira las muñecas hasta que las palmas miren al techo y vuelve a girarlas hasta que miren al suelo una vez más. Esto es una repetición.",
            codes: ["dumbbellwristtwist1", "dumbbellwristtwist2", "dumbbellwristtwist3"],
            category: "antebrazos"
        },
        {
            name: "Giro de Muñeca De Pie",
            description: "1. Toma una pesa de detrás de ti con un agarre supino y manteniendo los brazos rectos. Deja colgar la pesa de manera que se apoye en los dedos extendidos.\n\n2. Flexiona las muñecas para elevar le pesa lo más alto que puedas.\n\n3. Invierte el movimiento para bajar la pesa.",
            codes: ["standingwristcurl1", "standingwristcurl2", "standingwristcurl3"],
            category: "antebrazos"
        },
        {
            name: "Desplantes con Pesa", 
            description: "1. Empieza por colocar una pesa en la parte superior de la espalda, utiliza un agarre prono, un poco más ancho que los hombros.\n\n2. De pie, con los pies separados unos 20cm y los dedos mirando hacia delante.\n\n3. Da un paso adelante (unos 20cm) manteniendo el abdomen apretado y la parte superior del cuerpo recta.\n\n4. Baja lentamente una rodilla como si te fueras a arrodillar, y mantén la otra doblada en un ángulo de 90 grados, no dejes que la rodilla toque el suelo.\n\n5. Baja el cuerpo justo por encima del suelo, y mantén la postura un momento, antes de volver a la posición inicial. Repite con la otra pierna.",
            codes: ["barbelllunge1", "barbelllunge2", "barbelllunge3"],
            category: "piernas"
        },
        {
            name: "Sentadillas con Pesa (Asistidas)",
            description: "1. De pie, recto y con un banco plano a tu espalda. Con los pies separados a la anchura de los hombros. Coloca la pesa en la parte posterior de los hombros. Sujeta la pesa con un agarre prono. La distancia entre las manos debe ser más grande que la anchura de los hombros. Mueve los pies para que apunten ligeramente hacia afuera.\n\n2. Baja el cuerpo, doblando las rodillas. La espalda debe estar recta durante todo el movimiento. Detente cuando tus muslos estén paralelos al suelo o cuando tu trasero toque el banco. Cuando vuelvas a la posición inicial, genera energía de la parte inferior de la espalda.",
            codes: ["barbellsquat_assisted_1", "barbellsquat_assisted_2", "barbellsquat_assisted_3"],
            category: "piernas"
        },
        {
            name: "Sentadilla con Pesa Sobre la Cabeza",
            description: "1. De pie, recto y con los pies separados a la anchura de los hombros. Sujeta la pesa con un agarre prono. La distancia entre las manos debe ser más grande que la anchura de los hombros. Mueve los pies para que apunten ligeramente hacia afuera. Levanta la pesa por encima de la cabeza con los brazos totalmente extendidos.\n\n2. Baja el cuerpo, doblando las rodillas. La espalda debe estar recta en todo momento. Detente cuando tus muslos estén paralelos al suelo. Al volver a la posición inicial, genera energía con la parte inferior de la espalda.",
            codes: ["barbellsquatoverhead1", "barbellsquatoverhead2", "barbellsquatoverhead3"],
            category: "piernas"
        },
        {
            name: "Salto con Banco" ,
            description: "1. De pie delante de un banco.\n\n2. Salta sobre el banco e inmediatamente vuelve a saltar hacia atrás, hasta la posición inicial en el suelo.\n\n3. Repite varias veces.",
            codes: ["benchjump1", "benchjump2", "benchjump3", "benchjump4"],
            category: "piernas"
        },
        {
            name: "Sentadilla Búlgara Partida",
            description: "1. En posición vertical, a unos 75cm delante de un banco, con una mancuerna en cada mano. Extiende el pie derecho hacia atrás y reposa la parte superior del pie sobre el banco.\n\n2. Mantén la espalda recta y la cabeza erguida, mientras doblas lentamente la pierna izquierda y te colocas en posición de desplante. Deja de bajar el cuerpo cuando tu muslo izquierdo esté más o menos paralelo al suelo.\n\n3. Vuelve lentamente hacia arriba hasta que la pierna izquierda esté recta de nuevo y repite. No olvides cambiar de pierna y ejercitar la otra también.",
            codes: ["bulgariansplitsquat1", "bulgariansplitsquat2", "bulgariansplitsquat3", "bulgariansplitsquat4"],
            category: "piernas"
        },
        {
            name: "Sentadilla Búlgara Partida (Sin Pesos)" ,
            description: "1. Coloca un pie en el suelo, a unos 90cm delante de una silla, y el otro pie en una silla detrás de ti, como se muestra en la ilustración. Las manos deben estar detrás de la cabeza. \n\n2. Utiliza el pie delantero para mantener el equilibrio mientras doblas ambas rodillas para bajar el cuerpo, hasta que la rodilla trasera esté a unos pocos centímetros del suelo y la pierna delantera doblada aproximadamente 90 grados. El resto del cuerpo debe formar una línea recta. Termina las repeticiones, cambia la posición de las piernas y repite.",
            codes: ["bulgariansplitsquat_noweights_1", "bulgariansplitsquat_noweights_2", "bulgariansplitsquat_noweights_3", "bulgariansplitsquat_noweights_4"],
            category: "piernas"
        },
        {
            name: "Desplante Lateral con Mancuerna",
            description: "1. De pie, con un par de mancuernas a los lados y los brazos extendidos hacia abajo.\n\n2. Da un paso a un lado y baja el cuerpo, inclinando ligeramente el torso hacia adelante. Mantén la pierna recta fija durante todo el movimiento.\n\n3. Empuja la pierna doblada para volver a la posición inicial. Repite con la otra pierna.",
            codes: ["dumbbellsidelunge1", "dumbbellsidelunge2", "dumbbellsidelunge3"],
            category: "piernas"
        },
        {
            name: "Buenos Días",
            description: "1. Sujeta una pesa con agarre prono y apóyala en la parte superior de la espalda, no en el cuello. Separa los pies a la anchura de los hombros y dobla ligeramente las rodillas, manteniendo la espalda recta. \n\n2. Poco a poco, inclínate hacia adelante usando las caderas para bajar el pecho, manteniendo el arco natural de la parte baja de la espalda. Mantén la cabeza erguida y el mismo ángulo en las rodillas.\n\n3. Levanta la parte superior del cuerpo hasta la posición inicial.",
            codes: ["goodmorning1", "goodmorning2", "goodmorning3"],
            category: "piernas"
        },
        {
            name: "Extensiones de Pierna",
            description: "Eleva lentamente el peso extendiendo ambas piernas hacia arriba, hasta que estén rectas. No las subas de repente. Mantén esta posición durante un segundo. Vuelve a la posición inicial lentamente. Repite el movimiento.",
            codes: ["legextensions1", "legextensions2", "legextensions3"],
            category: "piernas"
        },
        {
            name: "Lunges con Mancuerna",
            description: "De pie, con las mancuernas a los lados. Embiste hacia adelante con una pierna. Apóyate en el talón y después en la parte anterior del pie. Baja el cuerpo flexionando la rodilla y cadera de la pierna delantera, hasta que la rodilla de la pierna trasera esté casi en contacto con el suelo . Vuelve a la posición inicial de pie, extendiendo la cadera y la rodilla de la pierna delantera. Repite alternando ambas piernas.",
            codes: ["dumbbelllunges1", "dumbbelllunges2", "dumbbelllunges3"],
            category: "piernas"
        },
        {
            name: "Patada hacia Atrás con Cable",
            description: "Ajusta un manguito al final del cable y a través de la polea inferior. Ponte el manguito en el tobillo. Colócate de pie delante de la máquina y agárrate al borde para sujetarte. Inclina la pelvis hacia adelante. Mueve la pierna hacia atrás.",
            codes: ["cablebackkicks1", "cablebackkicks2", "cablebackkicks3", "cablebackkicks4"],
            category: "piernas"
        },
        {
            name: "Sentadillas con Mancuerna",
            description: "De pie y con los pies ligeramente separados, sujeta una mancuerna en cada mano, con los brazos colgando a ambos lados: ⁃ Mira al frente, arquea ligeramente la espalda y haz una sentadilla. ⁃	Una vez que tus muslos estén paralelos al suelo, endereza las piernas hasta volver a la posición inicial. ⁃	Exhala mientras completas el movimiento.",
            codes: ["dumbbellsquats1", "dumbbellsquats2", "dumbbellsquats3", "dumbbellsquats4"],
            category: "piernas"
        },
        {
            name: "Sentadillas Delanteras",
            description: "Coloca las mancuernas sobre los deltoides anteriores, manteniendo la parte superior de los brazos paralela al suelo, dobla los codos, cruza los antebrazos, agarra la barra y mira al frente: ⁃	Inhala y haz la sentadilla. ⁃Vuelve a la posición inicial y exhala mientras completas el movimiento.",
            codes: ["frontsquats1", "frontsquats2", "frontsquats3", "frontsquats4"],
            category: "piernas"
        },
        {
            name: "Sentadillas de Potencia",
            description: "Este ejercicio es igual que las sentadillas tradicionales, pero se colocan las piernas extendidas con los dedos apuntando hacia fuera, lo que trabaja la cara interior de los muslos. Los músculos involcucrados son: ⁃los cuadriceps ⁃todos los aductores ⁃los glúteos ⁃el grupo isquiotibial ⁃todos los músculos sacroespinales.",
            codes: ["powersquats1", "powersquats2", "powersquats3", "powersquats4"],
            category: "piernas"
        },
        {
            name: "Sentadillas Hack",
            description: "Flexiona las rodillas, coloca la espalda en la superficie acolchada, sujeta los hombros con los yugos de la máquina y coloca los pies ligeramente juntos: ⁃	Inhala, rota las manijas de los lados de los yugos para liberar la máquina y dobla las piernas. ⁃Vuelve a la posición inicial y exhala mientras completas el movimiento.",
            codes: ["hacksquats1", "hacksquats2", "hacksquats3"],
            category: "piernas"
        },
        {
            name: "Curl de Pierna Sentado", 
            description: "Siéntate en la máquina con las pierna rectas y los tobillos apoyados en el rodillo. Baja la pierna hasta que descanse en los muslos. Coge los asideros de cada lado: ⁃Inhala y dobla las rodillas para mover el rodillo hacia abajo. ⁃Exhala mientras completas el movimiento.",
            codes: ["seatedlegcurls1", "seatedlegcurls2", "seatedlegcurls3"],
            category: "piernas"
        },
        {
            name: "Press de Espalda",
            description: "Comienza sentándote en el banco (con el apoyo para la espalda). Coge la haltera con un agarre prono. Sujeta la pesa sobre los hombros un poco por delante de ti, con los codos apuntando al suelo. Empuja la pesa hacia arriba y sobre la cabeza, de manera que los brazos estén completamente extendidos. Tras una pausa, baja las pesas a la posición inicial.",
            codes: ["backpresses1", "backpresses2", "backpresses3"],
            category: "hombros"
        },
        {
            name: "Press Frontal Sentado",
            description: "Siéntate en un banco recto. Coge la haltera con un distancia mayor que la anchura de los hombros. Empuja la haltera hacia arriba, hasta que esté sobre los hombros y con los brazos extendidos. Baja la haltera hasta la parte delantera de los hombros, y vuelve a la posición inicial.",
            codes: ["seatedfrontpresses1", "seatedfrontpresses2", "seatedfrontpresses3"],
            category: "hombros"
        },
        {
            name: "Press con Mancuernas Sentado",
            description: "Colócate en un banco o silla con la espalda recta. Coge una mancuerna en cada mano y sujétalas justo por fuera de los hombros, con los pulgares mirándose de frente. Solo tienes que subir las mancuernas por encima de tu cabeza y volver a la posición inicial.",
            codes: ["seateddumbelprese1", "seateddumbelprese2", "seateddumbelprese3"],
            category: "hombros"
        },
        {
            name: "Elevaciones Laterales con Polea Baja",
            description: "Colócate de pie cerca de la máquina del cable y ponte de lado, con el brazo ligeramente por delante del muslo, y agarra el manillar. Inhala y, manteniendo el codo ligeramente flexionado, eleva el brazo por fuera del lateral del cuerpo hasta que la parte superior del brazo esté al mismo nivel que el hombro. Mantén la palma de la mano hacia abajo. Lentamente y de manera controlada, baja el brazo hasta la posición inicial.",
            codes: ["lowpulleylateralraise1", "lowpulleylateralraise2", "lowpulleylateralraise3", "lowpulleylateralraise4", "lowpulleylateralraise5"],
            category: "hombros"
        },
        {
            name: "Remada Vertical (variante)",
            description: "Sube la barra hacia la barbilla, haciéndo fuerza con los codos.Cuando la parte superior de los brazos esté paralela al suelo, deja de tirar y baja la barra con la misma trayectoria. Cuando esté arriba, los codos deberán estar por encima de las muñecas.",
            codes: ["uprightrows1", "uprightrows2", "uprightrows3"],
            category: "hombros"
        },
        {
            name: "Elevaciones del Deltoide Posterior con Mancuernas",
            description: "Siéntate en un banco e inclínate hacia adelante con los pies juntos en el suelo. Eleva las mancuernas a los lados, manteniendo las manos rectas y vuelve lentamente a la posición inicial.",
            codes: ["dumbbellreardeltoidraises1", "dumbbellreardeltoidraises2", "dumbbellreardeltoidraises3", "dumbbellreardeltoidraises4"],
            category: "hombros"
        },
        {
            name: "Elevaciones Laterales",
            description: "De pie con los pies ligeramente separados. Mantén la espalda recta y los brazos colgando a los lados, con una mancuerna en cada mano: ⁃	Eleva la mancuerna al nivel del hombro, manteniendo los codos ligeramente flexionados. ⁃Vuelve a la posición inicial.",
            codes: ["lateralraises1", "lateralraises2", "lateralraises3", "lateralraises4"],
            category: "hombros"
        },
        {
            name: "Elevaciones Frontales",
            description: "De pie con los pies ligeramente separados. Sujeta las mancuernas con las palmas hacia abajo (agarre prono), apoyándolas en los muslos o ligeramente hacia el lateral: ⁃Inhala y alterna de lado para elevar las mancuernas hacia adelante, hasta la altura de los hombros. ⁃Exhala mientras completas el movimiento.",
            codes: ["frontraises1", "frontraises2", "frontraises3", "frontraises4"],
            category: "hombros"
        },
        {
            name: "Elevaciones Frontales con Haltera",
            description: "De pie con las piernas ligeramente separadas. Coge la haltera con un agarre prono y apóyala en los muslos. Con la espalda recta y los abdominales contraídos: ⁃	Inhala y sube la haltera hacia adelante con los brazos extendidos, hasta la altura de los ojos. ⁃Exhala mientras completas el movimiento.",
            codes: ["barbellfrontraises1", "barbellfrontraises2", "barbellfrontraises3"],
            category: "hombros"
        },
        {
            name: "Remada Vertical",
            description: "De pie y con los pies ligeramente separados. Mantén la espalda recta. Coge la barra con un agarre prono, con las manos separadas por un palmo o un poco más: ⁃	Inhala y sube la haltera recta hacia arriba, hasta que te toque la barbilla. ⁃	Levanta los codos tanto como puedas en el momento álgido del movimiento. ⁃Exhala y devuelve la haltera a la posición inicial, lentamente.",
            codes: ["uprightrow1", "uprightrow2", "uprightrow3", "uprightrow4"],
            category: "hombros"
        },
        {
            name: "Elevaciones Laterales Inclinadas con Polea Baja",
            description: "De pie y con las rodillas ligeramente flexionadas. Inclínate hacia adelante, manteniendo la espalda recta y los brazos colgando. Sujeta un manillar en cada mano, con los cables cruzados el uno con el otro: ⁃Inhala y eleva los brazos a los lados hasta que las manos estén ligeramente por encima del nivel de los hombros. ⁃Exhala mientras completas el movimiento.",
            codes: ["lowpulleybentoverlateralraises1", "lowpulleybentoverlateralraises2", "lowpulleybentoverlateralraises3"],
            category: "hombros"
        },
        {
            name: "Elevaciones Frontales con Polea Baja",
            description: "De pie y con los pies ligeramente separados. Coge el asa con un agarre prono, manteniendo los brazos a los lados: ⁃Inhala y eleva el brazo hasta la altura del hombro. ⁃	Exhala mientras completas el movimiento. Este ejercicio trabaja los deltoides.",
            codes: ["lowpulleyfrontraises1", "lowpulleyfrontraises2", "lowpulleyfrontraises3", "lowpulleyfrontraises4", "lowpulleyfrontraises5"],
            category: "hombros"
        },
        {
            name: "Laterales de Deltoides Posteriores con Pec Deck",
            description: "Siéntate en una máquina de pec deck, mirando hacia el apoyo de la espalda, con los brazos estirados sujetando las asas: ⁃Inhala y mueve los codos hacia atrás, comprimiendo los omoplatos al final del movimiento. ⁃	Exhala mientras completas el movimiento.",
            codes: ["pecdeckreardeltlaterals1", "pecdeckreardeltlaterals2", "pecdeckreardeltlaterals3", "pecdeckreardeltlaterals4"],
            category: "hombros"
        },
        {
            name: "Press de Banca con Agarre Cerrado",
            description: "Colócate en una máquina normal de press de banco plano de pesas libres. Túmbate boca arriba y coge la haltera de encima con un agarre muy estrecho. Concéntrate en mantener una anchura de entre 15 y 20 cm en el agarre. Levanta la haltera del bastidor y bájala lentamente a una altura de unos 8 cm por encima del pecho, y vuelve a levantar la barra hasta la posición de inicio. Asegúrate de mantener los codos orientados hacia el cuerpo durante todo el movimiento.",
            codes: ["closegripbenchprese1", "closegripbenchprese2", "closegripbenchprese3"],
            category: "triceps"
        },
        {
            name: "Pushdowns",
            description: "Utilizando una polea de cable alto, coge una barra corta y recta con un agarre prono. Tus manos deberán estar separadas por unos 25 cm. Coloca tus antebrazos paralelos al suelo. Mantén los pies con una separación como la anchura de los hombros y flexiona las rodillas ligeramente. Mantén los codos fijos y pegados al cuerpo y las muñecas rectas. Mantén TODO el cuerpo firme, empuja la barra todo lo que puedas hacia las piernas, bloqueando los brazos y sintiendo la contracción total de los triceps. Mantén la parte superior de los brazos pegada al cuerpo. Vuelve a la posición inicial usando los mismos movimientos. ¡No muevas ni los codos ni el torso! Quédate de pie y recto.",
            codes: ["pushdowns1", "pushdowns2", "pushdowns3"],
            category: "triceps"
        },
        {
            name: "Extensiones de Triceps",
            description: "Colocando la barra sobre los ojos, tensiona los triceps mientras mantienes los brazos en posición extendida. Mantén la parte superior de los brazos fija, en posición extendida, mientras doblas los codos y dejas bajar el peso de manera controlada hacia la frente.",
            codes: ["tricepsextensions1", "tricepsextensions2", "tricepsextensions3", "tricepsextensions4"],
            category: "triceps"
        },
        {
            name: "Patadas Traseras de Triceps",
            description: "Arrodillate cómodamente en un banco con la misma pierna del lado que sujetas la pesa. Con la espalda recta y la cabeza mirando al frente, levanta el peso en un ángulo de 90 grados (como se muestra). Extiende el peso manteniendo el codo completamente fijo.",
            codes: ["tricepskickbacks1", "tricepskickbacks2", "tricepskickbacks3"],
            category: "triceps"
        },
        {
            name: "Extensiones de Triceps de Un Brazo con Mancuernas",
            description: "Extiende el brazo por completo por encima del cuerpo. Asegúrate de que el codo esté orientado hacia fuera del cuerpo. Con la mano en la que no llevas peso, sujeta tu otro brazo por debajo del codo. Baja el peso, doblando el codo. Una vez que el antebrazo esté paralelo al suelo, puedes extender el brazo completamente.",
            codes: ["onearmsextensions1", "onearmsextensions2", "onearmsextensions3", "onearmsextensions4", "onearmsextensions5"],
            category: "triceps"
        },
        {
            name: "Extensiones de Triceps con Barra",
            description: "Para empezar, colócate de pie sujetando una haltera o una barra e-z con un agarre prono (con las palmas hacia adelante) con las manos más juntas que la distancia de los hombros. Los pies deberán estar a la anchura de los hombros. Eleva la haltera por encima de la cabeza hasta que los brazos estén completamente extendidos. Mantén los codos hacia adentro. Esta es la posición inicial. Manteniendo la parte superior de los brazos junto a la cabeza y los codos hacia adentro, perpendiculares al suelo, baja la resistencia con un movimiento circular, por detrás de la cabeza, hasta que los antenbrazos toquen los biceps. Consejo: la parte superior de los brazos debe permanecer inmóvil, solo los antebrazos se deben mover. Inhala mientras realizas este movimiento.Vuelve a la posición inicial usando los triceps para elevar la haltera. Exhala mientras realizas este movimiento.",
            codes: ["bartricepsextensions1", "bartricepsextensions2", "bartricepsextensions3", "bartricepsextensions4"],
            category: "triceps"
        },
        {
            name: "Extensión de Triceps con Mancuernas", 
            description: "Túmbate en un banco llano con una mancuerna en cada mano y los brazos extendidos y rectos desde los hombros: ⁃	Inhala y flexiona los brazos lentamente. ⁃	Vuelve a la posición inicial, exhalando mientras completas el movimiento. ⁃Este ejercicio trabaja por igual las tres cabezas de los triceps.",
            codes: ["dumbbelltricepsextension1", "dumbbelltricepsextension2", "dumbbelltricepsextension3"],
            category: "triceps"
        },
        {
            name: "Dips de Triceps",
            description: "Coloca las manos en el borde de un banco llano y apoya los pie en otro banco. Forma un ángulo de torso-piernas de 90 grados: ⁃	Inhala y flexiona los brazos. ⁃	Endereza los brazos para volver a la posición inicial, exhalando mientras completas el movimiento. Este ejercicio trabaja los triceps, los pectorales y los deltoides anteriores.",
            codes: ["tricepsdips1", "tricepsdips2", "tricepsdips3"],
            category: "triceps"
        },
        {
            name: "Pushdown de Triceps",
            description: "De pie y de frente, a la máquina con las manos en la barra y los codos a los lados: ⁃	Inahala y endereza los brazos, pero no separes los codos de los lados. ⁃	Exhala mientras completas el movimiento.",
            codes: ["tricepspushdown1", "tricepspushdown2", "tricepspushdown3"],
            category: "triceps"
        },
        {
            name: "Pushdown Invertido de Un Brazo",
            description: "De pie y de frente a la máquina, coge el asa con un agarre supino: ⁃	Inhala y endereza el brazo. ⁃Exhala mientras completas el movimiento.",
            codes: ["onearmreversepushdown1", "onearmreversepushdown2", "onearmreversepushdown3"],
            category: "triceps"
        },
        {
            name: "Extensión de Tríceps con Pelota Suiza",
            description: "1. Túmbate de espaldas sobre la pelota. Con los pies en el suelo. Sujeta una mancuerna con ambas manos. Extiende completamente los brazos por encima de la cabeza.\n\n2. Sin mover la parte superior de los brazos, baja la mancuerna hasta que quede por detrás de la cabeza.  Evita usar los codos. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["stabilityballtricepsextension1", "stabilityballtricepsextension2", "stabilityballtricepsextension3"],
            category: "triceps"
        },
        {
            name: "Extensión de Trícpes Sentado",
            description: "1. Siéntate en un banco con un par de mancuernas. Sujétalas con los brazos extendidos sobre la cabeza y con las palmas de las manos una frente a la otra.\n\n2. Mantén la parte superior de los brazos estable mientras bajas las mancuernas por detrás de la cabeza hasta que tus antebrazos hayan dejado de estar paralelos al suelo.\n\n3. Haz una pausa, y endereza los brazos para volver a la posición inicial.",
            codes: ["seatedtricepsextension1", "seatedtricepsextension2", "seatedtricepsextension3"],
            category: "triceps"
        },
        {
            name: "Flexiones de Un Solo Brazo Tumbado",
            description: "1. Túmbate de lado con las rodillas ligeramente dobladas y las piernas una encima de la otra. Sujeta la cintura con el brazo inferior y coloca la otra mano en el suelo, delante de ti, con el brazo ligeramente doblada.\n\n2. Comienza a enderezas ese brazo, empujando el cuerpo en dirección contraria al suelo - asegúrate de que estás usando los tríceps para levantar el cuerpo, no la espalda. Haz una pausa y vuelve a la posición inicial.\n\n3. Después de varias repeticiones, cambia de lado y repite con el otro brazo.",
            codes: ["lyingsinglearmpushup1", "lyingsinglearmpushup2", "lyingsinglearmpushup3"],
            category: "triceps"
        },
        {
            name: "Remo Reverso con Mancuernas",
            description: "1. De pie, con los pies separados a la anchura de los hombros y las rodillas ligeramente dobladas. Sujeta una mancuerna ligera en cada mano y dóblate hacia adelante por la cintura hasta que el torso esté casi recto y pon las palmas de las manos hacia adentro, como se ve en la ilustración.\n\n2. Eleva las mancuernas a los lados del pecho, con los brazos doblados en ángulo recto. Lo ideal es que la parte superior de los brazos esté paralela al suelo.\n\n3. Realiza una maniobra reversa de manera inmediata extendiendo los brazos por detrás de ti.\n\n4. Contrae los tríceps, dobla los codos para bajar las pesas hasta que queden a los lados del pecho una vez más.\n\n5. Baja las mancuernas hasta que tus brazos vuelvan a estar rectos hacia abajo.",
            codes: ["dumbbellrowkickback1", "dumbbellrowkickback2", "dumbbellrowkickback3"],
            category: "triceps"
        },
        {
            name: "Flexiones Diamante con Banco",
            description: "1. En la posición estándar para flexiones, pero con las manos colocadas directamente bajo el pecho y con los dedos índice y pulgar extendidos y tocándose, de manera que formen un \"diamante\".\n\n2. Mantén los dedos de los pies en un banco plano. Esto pondrá más presión en las manos durante el ejercicio.\n\n2. Mantén la espalda recta mientras bajas el cuerpo hasta que tu pecho casi toque las manos.\n\n3. Haz una pausa, y vuelve a subir hasta la posición inicial.",
            codes: ["diamondpushuponbench1", "diamondpushuponbench2", "diamondpushuponbench3"],
            category: "triceps"
        },
        {
            name: "Flexiones Diamante",
            description: "1. Colócate en la posición estándar para flexiones, pero con las manos directamente debajo del pecho y los dedos índice y pulgar extendidos y tocándose, de manera que formen un \"diamante\".\n\n2. Mantén la espalda recta mientras bajas el cuerpo hasta que el pecho casi toca las manos.\n\n3. Haz una pausa, y empuja el cuerpo hacia arriba hasta la posición de inicio.",
            codes: ["diamondpushup1", "diamondpushup2", "diamondpushup3"],
            category: "triceps"
        },
        {
            name: "Elevación Lateral con Pelota Suiza",
            description: "1. Siéntate en una pelora suiza con una mancuerna ligera en cada mano. Mantén las piernas separadas a la anchura de los hombros para mantener el equilibrio. Las manos deben estar colgando a los lados.\n\n2. Con los brazos perfectamente rectos, levante lentamente las pesas hasta la altura de los hombros. Mantén las palmas hacia el suelo.\n\n3. Con los codos doblados, baja lentamente hasta volver a la posición inicial y repite el número deseado de veces.",
            codes: ["stabilityballlateralraise1", "stabilityballlateralraise2", "stabilityballlateralraise3"],
            category: "hombros"
        },
        {
            name: "Elevación Delantera con Mancuerna Sentado",
            description: "1. Coge un par de mancuernas y siéntate en un banco inclinado con los brazos rectos a cada lado y los pulgares hacia adentro.\n\n2. Con los codos rectos, levanta las pesas hacia arriba y hacia adelante hasta que las manos estén al mismo nivel que los ojos.\n\n3. Mantén el reverso de las muñecas plano y los codos rectos durante todo el movimiento. Vuelve a la posición inicial.",
            codes: ["seateddumbbellfrontraise1", "seateddumbbellfrontraise2", "seateddumbbellfrontraise3"],
            category: "hombros"
        },
        {
            name: "Press Militar Detrás del Cuello (De Pie)",
            description: "1. De pie, sujeta una pesa por detrás de la cabeza y a la altura de los hombros, con las manos sepradas a la anchura de los hombros, codos doblados y palmas mirando hacia adelante.\n\n2. Sube la pesa por encima de la cabeza, extendiendo completamente los brazos. Mantén la espalda recta durante todo el movimiento.",
            codes: ["militarypressbehindtheneck_standing_1", "militarypressbehindtheneck_standing_2", "militarypressbehindtheneck_standing_3"],
            category: "hombros"
        },
        {
            name: "Elevación Lateral con Peso",
            description: "1. Mirando al frente, con la espalda recta, sujeta el peso con una sola mano. Coloca el peso a un lateral.\n\n2. Extiende el brazo en el lateral. Mantén el brazo recto. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["lateralweightedraise1", "lateralweightedraise2", "lateralweightedraise3"],
            category: "hombros"
        },
        {
            name: "Elevación Delantera con Peso",
            description: "1. De pie, con la espalda recta, sujeta el peso con las dos manos. Coloca el peso delante de los muslos. \n\n2. Extiende los brazos por delante de ti hasta que estén paralelos al suelo.  Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["frontweightedraise1", "frontweightedraise2", "frontweightedraise3"],
            category: "hombros"
        },
        {
            name: "Press de Hombros con Mancuernas",
            description: "1. De pie y con los pies separados a la anchura de los hombros. Sujeta las mancuernas con un agarre prono. Coloca las mancuernas junto a los laterales de la cabeza.\n\n2. Eleva las mancuernas hasta que los brazos estén completamente extendidos. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["dumbbellshoulderpress1", "dumbbellshoulderpress2", "dumbbellshoulderpress3"],
            category: "hombros"
        },
        {
            name: "Espantapájaros con Mancuernas",
            description: "1. Mirando al frente y con los pies separados a la anchura de los hombros, sujeta las mancuernas delante de ti con un agarre prono. Eleva los brazos a los lados hasta que la parte superior esté paralela al suelo.\n\n2. Gira los codos hacia afuera, hasta que los antebrazos apunten hacia arriba. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["dumbbellscarecrow1", "dumbbellscarecrow2", "dumbbellscarecrow3"],
            category: "hombros"
        },
        {
            name: "Elevación Lateral con Mancuerna y Brazos Doblados",
            description: "1. Mantén las piernas separadas a la anchura de los hombros. Con las manos colgando a los lados.\n\n2. Con los brazos perfectamente rectos, levanta lentamente las mancuernas hasta el nivel de los hombros y, al mismo tiempo, dobla los brazos hasta que formen un ángulo de 90 grados y los antebrazos estén paralelos al cuerpo.  Mantén las palmas de las manos hacia abajo.\n\n3. Con los codos doblados, vuelve lentamente a la posición inicial y repite tantas veces como desees.",
            codes: ["dumbbelllateralraisewitharmsbent1", "dumbbelllateralraisewitharmsbent2", "dumbbelllateralraisewitharmsbent3"],
            category: "hombros"
        },
        {
            name: "Elevación Delantera con Pesa",
            description: "1. Sujeta una pesa con un agarre prono a la anchura de los hombros y colócate de pie con la pesa colgando delante de tus muslos. Los pies deben estar separados a la anchura de los hombros y las rodillas ligeramente dobladas. Contrae los abdominales y todos los músculos de la parte superior del cuerpo, y dobla ligeramente los codos.\n\n2. Eleva la barra delante de ti hasta que los brazos estén paralelos al suelo.\n\n3. Haz una pausa y vuelve a la posición inicial.",
            codes: ["barbellfrontraise1", "barbellfrontraise2", "barbellfrontraise3"],
            category: "hombros"
        },
        {
            name: "Press Arnold",
            description: "1. Siéntate en un banco plano y sujeta un par de mancuernas a la altura de los hombros. Las palmas de las manos mirando hacia dentro y los codos apuntando a los laterales.\n\n2. Gira ambas muñecas hacia afuera, hasta que las palmas miren en dirección contraria a ti. Al mismo tiempo, extiende completamente los brazos sobre la cabeza. Mantén la posición durante un segundo. Vuelve a la posición inicial.",
            codes: ["arnoldpress1", "arnoldpress2", "arnoldpress3", "arnoldpress4"],
            category: "hombros"
        },
        {
            name: "Sentadilla de Una Pierna",
            description: "1. De pie con los pies separados a la anchura de los hombros. Levanta la pierna más fuerte o dominante delante de ti, recta, lo más alto que puedas.\n\n2. Contrae el estómago, empuja las caderas hacia atrás y haz una sentadilla lo más baja que puedas, a la vez que mantienes el torso recto. El talón de la pierna delantera puede tocar el suelo al final de la sentadilla, si puedes llegar a él.\n\n3. Vuelve a la posición inicial y exhala. Haz todas las repeticiones con la pierna no dominante, y luego repite con la dominante.",
            codes: ["singlelegsquat1", "singlelegsquat2", "singlelegsquat3"],
            category: "piernas"
        },
        {
            name: "Peso Muerto Lateral de Un Brazo",
            description: "1. De pie junto a una pesa en el suelo.\n\n2. Agarra la barra con un agarre prono en el centro. \n\n3. Agachándote, como si estuvieras haciendo una sentadilla, doblate hasta que tus muslos estén paralelos al suelo. \n\n4. Extiende las piernas lentamente a la vez que enderezas el cuerpo, contrayendo los abdominales.",
            codes: ["onearmsidedeadlift1", "onearmsidedeadlift2", "onearmsidedeadlift3"],
            category: "piernas"
        },
        {
            name: "Sentadillas en Banco Inclinado",
            description: "Paso 1: Tumbate en la banca inclinada. Coloca las manos sobre la cabeza. Las ropdillas estan flexionadas. Paso 2: Eleva la zona superior manteniendo la region lumbar en la banca. Aguanta un segundo. Vuelve a la posicion inicial",
            codes: ["inclinebenchsitups1", "inclinebenchsitups2", "inclinebenchsitups3", "inclinebenchsitups4"],
            category: "abdominales"
        }
    ].each do |getter_exercise|
        exercise_count+=1
        puts "----------------------------------------"
        puts "Exercise: #{getter_exercise[:name]}, started..."
        exercise = Exercise.find_by_name(getter_exercise[:name])
        if !exercise.present?
            puts "Create new exercise!"
            exercise = Exercise.create(getter_exercise.except(:codes, :category))
            exercise_created+=1
            exercise.category_list.add(getter_exercise[:category])
            getter_exercise[:codes].each do |code|
                exercise.examples.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'exercises', "#{code}.png")), filename: "#{code}.png")
            end
        end
    end
    puts "----------------------------------------\n"
    puts "----------------------------------------"
    puts "Total: #{exercise_count}, Creados: #{exercise_created}"
    puts "----------------------------------------\n\n"
  end

end
