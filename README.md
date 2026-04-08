# Procesamiento de Datos R - Encuesta de Fitness

Este directorio contiene el procesamiento y análisis de datos de una encuesta sobre hábitos de fitness y nutrición. El proyecto utiliza R para limpiar, procesar y analizar los datos de la encuesta, generando diversos análisis estadísticos y visualizaciones.

## Alumno: Vallejo Leyva Marcos

## Estructura del Directorio

### Scripts de R

- **procesamiento_fitness.R**: Script principal para el procesamiento inicial de los datos de la encuesta. Incluye limpieza de datos, transformación y preparación para análisis.
- **analisis_fitness.R**: Script para realizar análisis estadísticos avanzados sobre los datos procesados, incluyendo distribuciones, correlaciones y resúmenes.

### Archivos de Datos Procesados

- **fitness_survey_clean.csv**: Conjunto de datos limpio y procesado de la encuesta de fitness.
- **fitness_survey_categorical_frequencies.csv**: Frecuencias de variables categóricas en la encuesta.
- **fitness_survey_numeric_summary.csv**: Resumen estadístico de variables numéricas.
- **code_book.csv**: Libro de códigos que describe las variables y categorías de la encuesta.
- **challenge_nutrition_routine_long.csv**: Datos en formato largo sobre desafíos en rutinas de nutrición.
- **challenge_wellness_routine_long.csv**: Datos en formato largo sobre desafíos en rutinas de bienestar.
- **online_service_challenges_long.csv**: Datos en formato largo sobre desafíos en servicios en línea.

### Resultados de Análisis (Archivos CSV)

Estos archivos contienen los resultados de diversos análisis realizados sobre los datos:

- **analisis_age_distribution.csv**: Distribución de edades de los encuestados.
- **analisis_age_vs_frequency.csv**: Análisis de edad versus frecuencia de ejercicio.
- **analisis_education_distribution.csv**: Distribución de niveles educativos.
- **analisis_education_vs_willingness_to_pay.csv**: Relación entre educación y disposición a pagar por servicios.
- **analisis_gender_distribution.csv**: Distribución por género.
- **analisis_gender_vs_remote_training.csv**: Análisis de género versus preferencia por entrenamiento remoto.
- **analisis_likert_mean_scores.csv**: Puntajes medios en escalas Likert (probablemente satisfacción o actitudes).
- **analisis_remote_training_distribution.csv**: Distribución de preferencias por entrenamiento remoto.
- **analisis_top_locations.csv**: Ubicaciones más comunes mencionadas en la encuesta.
- **analisis_top_nutrition_challenges.csv**: Principales desafíos en nutrición.
- **analisis_top_online_service_challenges.csv**: Principales desafíos en servicios en línea.
- **analisis_top_wellness_challenges.csv**: Principales desafíos en bienestar.
- **analisis_willingness_to_pay_distribution.csv**: Distribución de disposición a pagar por servicios.

## Instrucciones de Uso

1. **Requisitos**: Asegúrate de tener R instalado en tu sistema. Los paquetes necesarios pueden incluir `dplyr`, `ggplot2`, `tidyr`, entre otros. Instálalos con `install.packages("nombre_del_paquete")`.

2. **Ejecución**:
   - Ejecuta primero `procesamiento_fitness.R` para limpiar y preparar los datos.
   - Luego, ejecuta `analisis_fitness.R` para generar los análisis y los archivos CSV de resultados.

3. **Interpretación de Resultados**: Los archivos CSV de análisis contienen resúmenes y estadísticas que pueden ser utilizados para informes o visualizaciones adicionales.

## Notas Adicionales

- Los datos originales de la encuesta no están incluidos en este directorio; solo los procesados y resultados de análisis.
- Para reproducir los análisis, asegúrate de que los datos de entrada estén disponibles en las rutas esperadas por los scripts.
- Este proyecto forma parte de un curso de Sistemas Interactivos en la universidad.

Para más detalles o preguntas, consulta los scripts de R o el libro de códigos.
