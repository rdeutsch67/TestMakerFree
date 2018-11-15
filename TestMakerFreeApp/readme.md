Installation von PostgreSql im .Net-Projekt:

1. PostgreSQL/Npgsql provider for Entity Framework Core installieren:
   -> https://www.nuget.org/packages/Npgsql.EntityFrameworkCore.PostgreSQL
   -> NuGet "Npgsql.EntityFrameworkCore.PostgreSQL"
3. Microsoft.EntityFrameworkCore.Design
4. Npgsql.EntityFrameworkCore.PostgreSQL.Design
5. Microsoft.EntityFrameworkCore.Tools.DotNet 
6. Das war alles. 

zusätzliche Infos: 
- https://blog.jetbrains.com/dotnet/2017/08/09/running-entity-framework-core-commands-rider/
- https://www.youtube.com/watch?v=md20lQut9EE

DB-Commands für das Erstellen des DB-Schemas
1. dotnet ef migrations add InitialMigration -v
2. dotnet ef database update
