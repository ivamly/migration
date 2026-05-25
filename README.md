# Миграция схемы SQLite → PostgreSQL (только структура)

## 1. Добавить драйвер в `pom.xml`

```xml

<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <scope>runtime</scope>
</dependency>
```

## 2. Сгенерировать changelog

```bash
./generate-changelog.sh
```

## 3. Сделать ручную правку сгенерированного файла

## 4. Настроить `application.yaml`

```yaml
spring:
  datasource:
    url: jdbc:postgresql://<host>:<port>/<db>
    username: ${DB_USER}
    password: ${DB_PASS}
    driver-class-name: org.postgresql.Driver
  liquibase:
    change-log: classpath:db/changelog/pg-schema.yaml
```

## 5. Накатить миграцию

```bash
./mvnw liquibase:update
```

> ⚠️ **Важно:** Мигрируется **только схема**. Данные не переносятся.
