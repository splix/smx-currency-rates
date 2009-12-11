
Корневой pom.xml:
<?xml version="1.0" encoding="utf-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.github.smx-currency-rates</groupId>
  <artifactId>parent</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>pom</packaging>
  <name>SMX Currency Rates - Parent</name>
  <url>http://github.com/dulanov/smx-currency-rates</url>
</project>

Создаем основной модуль:
mvn archetype:create -DarchetypeArtifactId=servicemix-camel-service-unit -DarchetypeGroupId=org.apache.servicemix.tooling -DgroupId=com.github.smx-currency-rates -DartifactId=currency-service

!! мавен создаст пакет com/github/smx-currency-rates - так вот его придется переименовать, убрав минусы из названия (и не забыть про класс описанный в нем, сменить 
у него package). Иначе проект не соберется.

и сборку
mvn archetype:create -DarchetypeArtifactId=servicemix-service-assembly -DarchetypeGroupId=org.apache.servicemix.tooling -DgroupId=com.github.smx-currency-rates -DartifactId=assembly

в созданную сборку добавляем зависимость к сервису (что означает что он будет включен в сборку):
    <dependency>
      <groupId>com.github.smx-currency-rates</groupId>
      <artifactId>currency-service</artifactId>
      <version>1.0-SNAPSHOT</version>
    </dependency>

устанавливаме локально:
mvn install

переходим в модуль assembly и запускаем его в servicemix:
mvn jbi:servicemix

и получаем долгожданное:
INFO  ServiceUnitLifeCycle           - Starting service unit: currency-service
[INFO] Project deployed

