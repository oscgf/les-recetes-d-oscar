# Changelog

Tolos cambios notables d'esti proyectu van documentase nesti ficheru.

El formatu ta basáu en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y esti proyectu adhierse a [Semantic Versioning](https://semver.org/lang/es/).

## [0.1.0] - 2026-03-20

### Añadío
- Proyectu inicial con Astro 6.0.8 y Tailwind CSS
- Integración con Supabase pa autenticación, base de datos y storage
- Sistema d'autenticación con email/password
- Páxina principal (Entamu) con grid de recetes
- Filtru por categoríes (Primeros, Segundos, Postres, Bebíes)
- Páxina de detalle de receta con ingredientes y pasos
- Páxina de login y rexistru d'usuarios
- Páxina protexida pa añadir recetes nueves
- Formulario de subida d'imáxenes a Supabase Storage
- Layout principal con header y footer
- Componentes: RecipeCard, CategoryFilter
- Diseñu rústicu asturianu (verde monte, ocre, crema)
- 4 recetes veganes d'exemplu:
  - Fabada Vegana Asturiana
  - Setes en Sidra
  - Casadielles Veganes
  - Sidra Natural Asturiana
- Script SQL pa configurar Supabase (supabase-setup.sql)
- Row Level Security (RLS) pa protexer datos
- Documentación completa en README.md
- Tou'l conteníu n'asturianu
- Enfoque 100% veganu

### Configuráu
- Adaptador Node.js pa SSR (Server-Side Rendering)
- Rutas dinámiques con prerender=false
- Variables d'entornu (.env.example)
- TypeScript con tipos pa Supabase
- Gitignore pa ficheros sensibles

### Técnico
- Astro 6.0.8
- @astrojs/node 10.0.3
- @supabase/supabase-js 2.99.3
- @tailwindcss/vite 4.2.2
- Node.js >= 22.12.0

[0.1.0]: https://github.com/tu-usuario/les-recetes-d-oscar/releases/tag/v0.1.0
