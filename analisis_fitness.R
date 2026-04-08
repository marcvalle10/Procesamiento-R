# ------------------------------------------------------------
# Análisis descriptivo del dataset fitness_survey_clean.csv
# Autor: Marcos
# ------------------------------------------------------------

library(tidyverse)
library(readr)

# 1) Cargar dataset limpio y tablas largas
fitness <- read_csv("fitness_survey_clean.csv", show_col_types = FALSE)
challenge_wellness <- read_csv("challenge_wellness_routine_long.csv", show_col_types = FALSE)
challenge_nutrition <- read_csv("challenge_nutrition_routine_long.csv", show_col_types = FALSE)
online_challenges <- read_csv("online_service_challenges_long.csv", show_col_types = FALSE)

# 2) Reconvertir factores ordinales si fueron importados como texto
fitness$age <- factor(
  fitness$age,
  levels = c("Less than 18", "18-24", "25-34", "35-44", "45-54", "More than 55"),
  ordered = TRUE
)

fitness$education <- factor(
  fitness$education,
  levels = c("Other", "High school", "College", "Undergraduate", "Post-Graduate"),
  ordered = TRUE
)

likert_levels <- c(
  "Not important at all",
  "Not so important",
  "Neutral",
  "Important",
  "Very Important"
)

fitness$price_of_service <- factor(fitness$price_of_service, levels = likert_levels, ordered = TRUE)
fitness$expertise_credibility <- factor(fitness$expertise_credibility, levels = likert_levels, ordered = TRUE)
fitness$language_instructions <- factor(fitness$language_instructions, levels = likert_levels, ordered = TRUE)
fitness$flexibility_time_slots <- factor(fitness$flexibility_time_slots, levels = likert_levels, ordered = TRUE)
fitness$availability_hybrid_options <- factor(fitness$availability_hybrid_options, levels = likert_levels, ordered = TRUE)

# 3) Tablas descriptivas principales
gender_dist <- fitness %>%
  count(gender, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

age_dist <- fitness %>%
  count(age, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

education_dist <- fitness %>%
  count(education, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

top_locations <- fitness %>%
  count(location, sort = TRUE, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

remote_training_dist <- fitness %>%
  count(remote_training_likelihood, sort = TRUE, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

pay_dist <- fitness %>%
  count(willingness_to_pay, sort = TRUE, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

# 4) Cruces útiles
age_vs_frequency <- fitness %>%
  count(age, frequency_wellness_routine, name = "count") %>%
  group_by(age) %>%
  mutate(percentage = round(count / sum(count) * 100, 2)) %>%
  ungroup()

gender_vs_remote <- fitness %>%
  count(gender, remote_training_likelihood, name = "count") %>%
  group_by(gender) %>%
  mutate(percentage = round(count / sum(count) * 100, 2)) %>%
  ungroup()

education_vs_pay <- fitness %>%
  count(education, willingness_to_pay, name = "count") %>%
  group_by(education) %>%
  mutate(percentage = round(count / sum(count) * 100, 2)) %>%
  ungroup()

# 5) Top retos reportados
top_wellness_challenges <- challenge_wellness %>%
  count(challenge_wellness_routine, sort = TRUE, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

top_nutrition_challenges <- challenge_nutrition %>%
  count(challenge_nutrition_routine, sort = TRUE, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

top_online_challenges <- online_challenges %>%
  count(online_service_challenges, sort = TRUE, name = "count") %>%
  mutate(percentage = round(count / sum(count) * 100, 2))

# 6) Conversión de Likert a puntaje numérico solo para análisis descriptivo
likert_to_num <- function(x) {
  recode(
    as.character(x),
    "Not important at all" = 1,
    "Not so important" = 2,
    "Neutral" = 3,
    "Important" = 4,
    "Very Important" = 5
  ) %>% as.numeric()
}

fitness_likert <- fitness %>%
  mutate(
    price_score = likert_to_num(price_of_service),
    expertise_score = likert_to_num(expertise_credibility),
    language_score = likert_to_num(language_instructions),
    flexibility_score = likert_to_num(flexibility_time_slots),
    hybrid_score = likert_to_num(availability_hybrid_options)
  )

likert_means <- tibble(
  variable = c(
    "price_of_service",
    "expertise_credibility",
    "language_instructions",
    "flexibility_time_slots",
    "availability_hybrid_options"
  ),
  mean_score = c(
    mean(fitness_likert$price_score, na.rm = TRUE),
    mean(fitness_likert$expertise_score, na.rm = TRUE),
    mean(fitness_likert$language_score, na.rm = TRUE),
    mean(fitness_likert$flexibility_score, na.rm = TRUE),
    mean(fitness_likert$hybrid_score, na.rm = TRUE)
  )
) %>%
  mutate(mean_score = round(mean_score, 2)) %>%
  arrange(desc(mean_score))

# 7) Exportar resultados del análisis
write.csv(gender_dist, "analisis_gender_distribution.csv", row.names = FALSE)
write.csv(age_dist, "analisis_age_distribution.csv", row.names = FALSE)
write.csv(education_dist, "analisis_education_distribution.csv", row.names = FALSE)
write.csv(top_locations, "analisis_top_locations.csv", row.names = FALSE)
write.csv(remote_training_dist, "analisis_remote_training_distribution.csv", row.names = FALSE)
write.csv(pay_dist, "analisis_willingness_to_pay_distribution.csv", row.names = FALSE)

write.csv(age_vs_frequency, "analisis_age_vs_frequency.csv", row.names = FALSE)
write.csv(gender_vs_remote, "analisis_gender_vs_remote_training.csv", row.names = FALSE)
write.csv(education_vs_pay, "analisis_education_vs_willingness_to_pay.csv", row.names = FALSE)

write.csv(top_wellness_challenges, "analisis_top_wellness_challenges.csv", row.names = FALSE)
write.csv(top_nutrition_challenges, "analisis_top_nutrition_challenges.csv", row.names = FALSE)
write.csv(top_online_challenges, "analisis_top_online_service_challenges.csv", row.names = FALSE)
write.csv(likert_means, "analisis_likert_mean_scores.csv", row.names = FALSE)

# 8) Resumen en consola
cat("\nResumen del análisis descriptivo\n")
cat("--------------------------------\n")
cat("Número de observaciones:", nrow(fitness), "\n")
cat("Número de variables:", ncol(fitness), "\n\n")

cat("Distribución por género:\n")
print(gender_dist)

cat("\nDistribución por edad:\n")
print(age_dist)

cat("\nTop 10 ubicaciones:\n")
print(head(top_locations, 10))

cat("\nPromedio de variables Likert:\n")
print(likert_means)

cat("\nTop 10 retos de rutina wellness:\n")
print(head(top_wellness_challenges, 10))

cat("\nTop 10 retos de nutrición:\n")
print(head(top_nutrition_challenges, 10))

cat("\nTop 10 retos de servicio online:\n")
print(head(top_online_challenges, 10))
