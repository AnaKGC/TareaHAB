# Flujo de trabajo en  Bash: TCGA Breast cancer data analysis

## Componentes del grupo:
- Ana Galiá Caravaca
- Jesús Gómez Sola
- Susana Cano Marín

## Introducción

En este trabajo se va a realizar un análisis de expresión génica diferencial sobre un conjunto de datos de cáncer de mama perteneciente a **The Cancer Genome Atlas** (TCGA).


El flujo de trabajo se realiza con Bash sobre scripts de R, que es donde se realiza el análisis de los datos.

## Instalación

Es necesario tener intalado R.
Librerias de R:
- RTCGAToolbox: herramienta para exportar datos TCGA Firehose.
- readxl: representación de los datos de distintas formas.
- dplyr: Manipulación de dataframes.
- limma: para el análisis de la expresión de genes.
- edgeR: Análisis de expresión diferencial de perfiles de expresión de RNA-seq con replicación biológica
- calibrate: para las gráficas de volcán.

## Procedimiento

Se han conectado estos a través de un script de bash. Con varios parámetros de entrada, de los cuales las rutas deben ser especificadas con su barra final, por ejemplo “Directorio1/Directorio2/”. Los parámetros de entrada son:
- Directorio de trabajo: donde se encuentren los scripts.
- Directorio de resultados: no tiene por qué existir previamente.
- Subconjunto que se quiera representar: "Basal" o "TNBC" que se comparará con "LumA".

Como resultados se obtienen algunos pasos intermedios y como resultados finales un csv con los resultados de la expresión diferencial y una gráfica volcán con los mismos.


## Ejemplo 1:
Comparamos "TNBC" con "LumA".

Para la ejecución sería:

sh DEA_Script.sh "WORKINGDIR/" "WORKINGDIR/results/" "TNBC"

- "WORKINGDIR" es la ruta del directorio del proyecto.

- "WORKINGDIR/results" es la carpeta que se crea como results, donde se guardan los resultados.

![Alt text](https://github.com/AnaKGC/TareaHAB/blob/master/TNBC_LuminA.JPG?raw=true "Ejemplo1")
> imagen1.JPG

Donde en verde están marcados la expresión diferencial que no pasa el filtro y en rojo la que sí lo pasa, en este caso podemos considerar que haya expresión diferencial entre estos tipos de tumor.

Donde sí tenemos expresión diferencial para AGR3 y FZD9, viendo la bibliografía AGR3 está directamente relacionada con el receptor de estrógeno y FZD9 es un biomarcador del cáncer de mama triple negativo.
 
## Ejemplo 2:

Comparamos "Basal" con "LumA".
Para la ejecución sería:

sh DEA_Script.sh "WORKINGDIR/" "WORKINGDIR/results/" "Basal"

Ejecutando como:

En este caso la ejecución sería cambiando solo los últimos cuatro parámetros a “ER Status” “Negative” “ER Status” “Positive”.

![Alt text](https://github.com/AnaKGC/TareaHAB/blob/master/Basal_LuminA.JPG?raw=true "Ejemplo1")
>imagen2

Donde sí tenemos expresión diferencial para AGR3 y ART3, viendo la bibliografía AGR3 está directamente relacionada con el receptor de estrógeno y ART3 regula la función de las células de cáncer de mama triple negativo.