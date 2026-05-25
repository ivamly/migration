#!/bin/sh

# NOTE: Run this script via Git Bash on Windows (or any Unix shell on Linux/macOS)

# Replace with the path to your database file
DB_PATH="./my_database.db"

# A changelog with this name should not exist
CHANGELOG_PATH="src/main/resources/db/changelog/changelog-for-pg.yaml"

mvn liquibase:generateChangeLog \
  -Dliquibase.url=jdbc:sqlite:$DB_PATH \
  -Dliquibase.driver=org.sqlite.JDBC \
  -Dliquibase.outputChangeLogFile=$CHANGELOG_PATH