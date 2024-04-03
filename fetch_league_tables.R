# Ensure required packages are installed and loaded
packages_needed <- c("devtools", "dplyr", "worldfootballR", "jsonlite")
packages_to_install <- packages_needed[!(packages_needed %in% installed.packages()[,"Package"])]
if(length(packages_to_install) > 0) install.packages(packages_to_install)

library(devtools)
library(dplyr)
library(worldfootballR)
library(jsonlite)

# Fetch and save function
fetch_and_save_league_table <- function(country, gender, season_end_year, tier, stat_type, filename) {
  table <- fb_season_team_stats(country = country, gender = gender, season_end_year = season_end_year, tier = tier, stat_type = stat_type)
  write_json(table, filename)
}

# Fetching and saving league tables for the 2024 season
fetch_and_save_league_table("ENG", "M", "2024", "1st", "league_table", "premier_league_2024.json")
fetch_and_save_league_table("ESP", "M", "2024", "1st", "league_table", "la_liga_2024.json")
fetch_and_save_league_table("GER", "M", "2024", "1st", "league_table", "bundesliga_2024.json")
fetch_and_save_league_table("ITA", "M", "2024", "1st", "league_table", "serie_a_2024.json")
fetch_and_save_league_table("FRA", "M", "2024", "1st", "league_table", "ligue_1_2024.json")
