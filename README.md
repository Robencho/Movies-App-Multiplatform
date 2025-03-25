# 🎬 MovieDB Flutter App

[![Flutter](https://img.shields.io/badge/Flutter-3.19-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2-blue?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](https://opensource.org/licenses/MIT)

Aplicación móvil de películas desarrollada con Flutter, Clean Architecture y la API de The Movie Database (TMDb). Explora películas populares, busca tus favoritas y descubre detalles como el reparto, sinopsis y más.

## CI/CD
[![CI/CD](https://github.com/Robencho/movies_app/actions/workflows/flutter.yml/badge.svg)](https://github.com/Robencho/movies_app/actions)
[![Coverage](https://codecov.io/gh/tu_usuario/tu_repositorio/branch/main/graph/badge.svg)](https://codecov.io/gh/tu_usuario/tu_repositorio)

## 🎥 Demo en Video

[![Alt text](https://img.youtube.com/vi/uhRe6hDq1fQ/0.jpg)](https://www.youtube.com/watch?v=uhRe6hDq1fQ)

## 🌟 Características

- **Explora películas**: Listado paginado de películas populares/tendencia.
- **Búsqueda en tiempo real**: Encuentra películas por título con debounce.
- **Detalles completos**: Sinopsis, reparto, género, duración y rating.
- **Diseño moderno**: Implementa Material 3 con temas dinámicos.
- **Arquitectura limpia**: Separación clara de capas (Data, Domain, Presentation).
- **Manejo de estado**: Riverpod para gestión reactiva del estado.
- **Responsivo**: Adaptable a diferentes tamaños de pantalla.

## 🛠 Tecnologías

- **Flutter 3.19** - Framework de desarrollo multiplataforma.
- **Dart 3.2** - Lenguaje de programación.
- **Riverpod 2.0** - Gestión de estado y dependencias.
- **DIO 5.0** - Cliente HTTP para llamadas a la API.
- **Clean Architecture** - Patrón de diseño escalable.
- **Material 3** - Diseño moderno y adaptable.
- **Cached Network Image** - Caché de imágenes optimizado.

## 🚀 Instalación

1. **Clona el repositorio**:
   ```
   git clone https://github.com/[tu_usuario]/[tu_repositorio].git
   cd movie-app 

2. **Instala dependencias**
    ```   
    flutter pub get

3. **Configura el API KEY:**
    Crea un archivo .env en la raíz del proyecto.
    Agrega tu API Key de TMDb:
    ```
    THE_MOVIE_DB_KEY=tu_api_key_aquí

4. **Ejecuta la APP**
    ```
    flutter run

## 🧩 Estructura del Proyecto
    
```bash
lib/
├── core/
│   ├── constants/    # Constantes y variables de entorno
│   ├── di/           # Inyección de dependencias (GetIt)
│   └── network/      # Configuración de DIO y interceptores
├── data/
│   ├── datasources/  # Fuentes de datos (API)
│   ├── models/       # Modelos de datos (JSON)
│   └── repositories/ # Implementación de repositorios
├── domain/
│   ├── entities/     # Entidades de negocio
│   ├── repositories/ # Interfaces abstractas
│   └── usecases/     # Casos de uso
└── presentation/
    ├── pages/        # Pantallas de la aplicación
    ├── providers/    # Providers de Riverpod
    ├── view_models/  # ViewModels (lógica de estado)
    └── widgets/      # Componentes reutilizables
```

## 📚 API Utilizada

Esta aplicación utiliza la API pública de [**The Movie Database (TMDb)**](https://developers.themoviedb.org/3/getting-started/introduction).  
[![TMDb Attribution](https://img.shields.io/badge/API-TMDb-blue?logo=themoviedatabase)](https://www.themoviedb.org/documentation/api)

---

**Desarrollado con ❤️ por [Rubian Llanos]**  
[![GitHub](https://img.shields.io/badge/GitHub-@Robencho-blue?logo=github)](https://github.com/Robencho)  
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Rubian_Llanos-blue?logo=linkedin)](https://www.linkedin.com/in/rubian-llanos-a-8b7050113/)