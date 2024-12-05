#!/bin/bash

# Проверка наличия аргумента (названия проекта)
if [ -z "$1" ]; then
  echo "Использование: $0 <название_проекта>"
  exit 1
fi

PROJECT_NAME=$1

# Создание директорий
mkdir -p $PROJECT_NAME/src/main/java
mkdir -p $PROJECT_NAME/src/main/resources
mkdir -p $PROJECT_NAME/src/test/java
mkdir -p $PROJECT_NAME/src/test/resources

# Создание файла pom.xml
cat <<EOL > $PROJECT_NAME/pom.xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>$PROJECT_NAME</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
    </properties>

    <dependencies>
        <!-- Здесь можно добавить зависимости -->
    </dependencies>
</project>
EOL

# Создание примера класса Main
cat <<EOL > $PROJECT_NAME/src/main/java/Main.java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}
EOL

echo "Проект $PROJECT_NAME успешно создан!"

# Переход в директорию проекта
cd $PROJECT_NAME

# Сборка проекта с помощью Maven
echo "Сборка проекта..."
mvn clean install

# Запуск проекта
echo "Запуск проекта $PROJECT_NAME..."
java -cp target/classes Main

# Возврат в исходную директорию
cd ..

echo "Проект $PROJECT_NAME успешно запущен!"
