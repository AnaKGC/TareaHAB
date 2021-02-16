# Flujo de trabajo en  Bash, cáncer de mama (TCGA)

## Componentes del grupo:
- Ana Galiá Caravaca
- Jesús Gómez Sola
- Susana Cano Marín

## Introducción

 

Se han conectado estos a través de un script de bash. Con varios parámetros de entrada, de los cuales las rutas deben ser especificadas con su barra final, por ejemplo “Directorio1/Directorio2/”. Los parámetros de entrada son:
- Directorio de trabajo: donde se encuentren los scripts.
- Directorio de datos: donde están los datos de partida.
- Datos de cáncer: en nuestro caso brca_rnaseq.RData.
- Tablas suplementarias: en nuestro caso **SupplementaryTables1-4.xls** de la que nos quedamos con la primera solo.
- Directorio de resultados: no tiene por qué existir previamente.
- Columna donde se encuentra el primer filtro, por ejemplo “ER Status”.
- Filtro para la primera columna, por ejemplo para ER negativo con la columna indicada antes sería “Negative”.
- Filtro para la columna del segundo filtro, en caso de que se quieran comparar de dos columnas distintas.
- Filtro para la segunda columna.

Como resultados se obtienen algunos pasos intermedios y como resultados finales un csv con los resultados de la expresión diferencial y una gráfica volcán con los mismos.

Se han corregido los scripts de R para no descargar archivos automáticamente y poder cargar los locales.

Algunos de estos scripts se han cambiado para que estén más generalizados y permitan varios estudios en lugar de solo uno.

## Ejemplo 1:
Tomamos tipos de tumor T1 y T2.

Para la ejecución sería:

sh DEA_Script.sh con los argumentos:

- “./DEA_HAB/”
- “./DEA_HAB/Data/”
- “brca_rnaseq.RData”
- “SupplementaryTables1-4.xls”
- “./DEA_HAB/Results1/”
- “Tumor”
- “T1”
- “Tumor”
- “T2”

> imagen1.JPG



Donde en verde están marcados la expresión diferencial que no pasa el filtro y en rojo la que sí lo pasa, en este caso no podemos considerar que haya expresión diferencial entre estos tipos de tumor.

##Ejemplo 2:

Algo donde si esperamos que haya expresión diferencial, para el estado de receptores de estrógeno, así que miramos estos entre casos negativos y casos positivos.

Ejecutando como:

En este caso la ejecución sería cambiando solo los últimos cuatro parámetros a “ER Status” “Negative” “ER Status” “Positive”.

>imagen2

Donde sí tenemos expresión diferencial para AGR3 y C1orf61, viendo la bibliografía AGR3 está directamente relacionada con el receptor de estrógeno y C1orf61 tiene relación con el cáncer.