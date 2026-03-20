# les recetes d'Oscar 🌱🍲

Blog personal de recetes **veganes** asturianes fechu con Astro, Tailwind CSS y Supabase.

## 📋 Descripción

Esti ye un blog de recetes tradicionales asturianes **100% veganes** onde pues:
- Ver toles recetes veganes con imáxenes y detalles
- Filtrar por categoríes (Primeros, Segundos, Postres, Bebíes)
- Rexistrate y aniciar sesión
- Añadir recetes veganes nueves con imáxenes (solo usuarios autenticaos)

**Tou ta escritu n'asturianu**, la llingua d'Asturies, y **toles recetes son 100% vexetales**, adaptaciones veganes de platos tradicionales asturianos.

## 🚀 Estructura del Proyectu

```text
/
├── public/              # Ficheros estáticos
├── src/
│   ├── components/      # Componentes reutilizables
│   │   ├── RecipeCard.astro
│   │   └── CategoryFilter.astro
│   ├── layouts/         # Layouts de páxina
│   │   └── MainLayout.astro
│   ├── lib/            # Lóxica de negocio
│   │   ├── supabase.ts # Cliente y funciones de Supabase
│   │   └── auth.ts     # Funciones d'autenticación
│   ├── pages/          # Páxines de la web
│   │   ├── index.astro      # Páxina principal
│   │   ├── login.astro      # Aniciar sesión
│   │   ├── registro.astro   # Rexistru
│   │   ├── anadir.astro     # Añadir receta (protexida)
│   │   └── receta/[id].astro # Detalle de receta
│   └── styles/         # Estilos globales
└── supabase-setup.sql  # Script pa configurar la base de datos
```

## 🛠️ Instalación

### 1. Clonar el repositoriu

```bash
git clone <url-del-repositoriu>
cd les-recetes-d-oscar
```

### 2. Instalar dependencies

```bash
npm install
```

### 3. Configurar Supabase

1. Crea una cuenta en [Supabase](https://supabase.com)
2. Crea un proyectu nuevu
3. Na seición **SQL Editor**, executa'l conteníu del ficheru `supabase-setup.sql` (inclúi 4 recetes veganes d'exemplu)
4. Na seición **Storage**, crea un bucket llamáu `recetes-imaxenes` y ponlu como públicu
5. Copia la URL y la clave anónima del proyectu

### 4. Configurar variables d'entornu

Crea un ficheru `.env` na raíz del proyectu:

```bash
cp .env.example .env
```

Edita'l ficheru `.env` y añade les tos credenciales de Supabase:

```env
PUBLIC_SUPABASE_URL=https://tu-proyecto.supabase.co
PUBLIC_SUPABASE_ANON_KEY=tu-clave-anonima
```

### 5. Executar el proyectu

```bash
npm run dev
```

La web va tar disponible en `http://localhost:4321`

## 📝 Comandos Disponibles

| Comandu                   | Acción                                              |
| :------------------------ | :-------------------------------------------------- |
| `npm install`             | Instala les dependencies                            |
| `npm run dev`             | Anicia'l servidor de desarrollu en `localhost:4321` |
| `npm run build`           | Xenera la versión de producción en `./dist/`        |
| `npm run preview`         | Previsualiza la build enantes de desplegar          |
| `npm run astro ...`       | Executa comandos CLI d'Astro                        |

## 🔐 Autenticación

El sistema d'autenticación usa Supabase Auth:

- **Rexistru**: Los usuarios pueden rexistrase con email y contraseña
- **Login**: Aniciar sesión pa poder añadir recetes
- **Protección de rutes**: La páxina `/anadir` ta protexida y redirixe a `/login` si nun tas autenticáu
- **Row Level Security**: Les recetes tán protexíes a nivel de base de datos

## 📊 Base de Datos

La tabla `recetes` tien la siguiente estructura:

- `id`: UUID (clave primaria)
- `titulu`: Títulu de la receta
- `descripcion`: Descripción curtia
- `ingredientes`: Array de ingredientes
- `pasos`: Array de pasos de preparación
- `tiempu_preparacion`: Tiempu en minutos
- `categoria`: Categoría (Primeros, Segundos, Postres, Bebíes)
- `imaxe_url`: URL de la imaxe
- `user_id`: ID del usuariu que creó la receta
- `created_at`: Fecha de creación

## 🎨 Diseñu

El diseñu usa una paleta de colores inspirada n'Asturies:

- **Verde monte** (#2d5016): Color principal
- **Ocre** (#d4a574): Acentu cálidu
- **Crema** (#f5f1e8): Fondu
- **Marrón escuru** (#3e2723): Testu

## 📦 Deployment

Pues desplegar esti proyectu en plataformes como:

- **Netlify**: `npm run build` y xube la carpeta `dist/`
- **Vercel**: Conecta'l repositoriu y configura les variables d'entornu
- **Cloudflare Pages**: Similar a Netlify

Nun escaezas configurar les variables d'entornu na plataforma de deployment.

## 🤝 Contribuir

Si quies contribuir al proyectu:

1. Fai un fork del repositoriu
2. Crea una rama pa la to funcionalidá (`git checkout -b feature/nueva-funcionalidad`)
3. Fai commit de los cambios (`git commit -m 'Añadir nueva funcionalidad'`)
4. Fai push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📄 Llicencia

Esti proyectu ta baxo llicencia MIT.

## 🌱 Enfoque Veganu

Toles recetes d'esti blog son **100% veganes**, adaptaciones de platos tradicionales asturianos usando ingredientes vexetales. Exemplos:

- **Fabada Vegana**: Con seitán o chorizu veganu en llugar de carne
- **Setes en Sidra**: Versión vegana del clásicu pixin en sidra
- **Casadielles Veganes**: Ensin güevos, usando agua y aceite

L'oxetivu ye caltener la esencia de la cocina asturiana mentanto se respeta a tolos animales.

## 👨‍🍳 Autor

Fechu con ❤️ y respetu polos animales n'Asturies
