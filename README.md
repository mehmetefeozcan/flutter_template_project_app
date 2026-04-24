# Flutter Template Project App

Ölçeklenebilir Flutter uygulamaları geliştirmek için hazırlanmış, katmanlı mimari ve sektör standartlarını benimseyen bir proje şablonu.

---

## Kullanılan Teknolojiler

| Katman | Paket |
|--------|-------|
| State Management | `mobx` + `flutter_mobx` |
| Dependency Injection | `get_it` + `injectable` |
| Navigation | `go_router` |
| Network | `dio` + `pretty_dio_logger` |
| Local Storage | `hive` + `hive_flutter` |
| Serialization | `json_serializable` + `json_annotation` |
| Environment | `envied` |
| UI Scaling | `flutter_screenutil` |
| Fonts | `google_fonts` |

---

## Klasör Yapısı

```
lib/
├── main.dart                        # Uygulama giriş noktası
├── app.dart                         # MyApp widget — tema & router bağlantısı
│
├── core/                            # Tüm feature'ların ortak kullandığı altyapı
│   ├── base/
│   │   ├── base_store.dart          # MobX store base sınıfı (isLoading, errorMessage, run/runResult)
│   │   └── base_view.dart           # StatefulWidget mixin — onInit/onDispose yaşam döngüsü
│   │
│   ├── constants/
│   │   ├── api_routes.dart          # API endpoint sabitleri
│   │   └── app_constants.dart       # Global navigator key vb. uygulama sabitleri
│   │
│   ├── di/
│   │   ├── locator.dart             # GetIt instance + configureDependencies()
│   │   ├── locator.config.dart      # injectable_generator tarafından üretilen kayıt kodu
│   │   └── storage_module.dart      # Hive box'larını DI'ya bağlayan modül
│   │
│   ├── env/
│   │   └── env.dart                 # .env dosyasını envied ile okuyan Env sınıfı (API_BASE_URL)
│   │
│   ├── network/
│   │   ├── custom_dio_service.dart  # GET/POST/PUT/PATCH/DELETE + hata yönetimi + CancelToken
│   │   ├── dio_module.dart          # Dio örneğini yapılandıran DI modülü
│   │   └── result.dart              # Result<S,E> sealed class (Success / Failure) + ApiException
│   │
│   ├── routing/
│   │   ├── app_router.dart          # GoRouter konfigürasyonu ve RouteObserver
│   │   ├── custom_transition.dart   # Özel sayfa geçiş animasyonları
│   │   └── routes/
│   │       └── main/
│   │           ├── main_router.dart # Route tanımları (GoRoute listesi)
│   │           └── main_routes.dart # Route path sabitleri
│   │
│   ├── state/
│   │   └── theme_store.dart         # Singleton MobX store — dark/light mod, Hive'a kalıcı kayıt
│   │
│   ├── storage/
│   │   ├── hive_boxes.dart          # Box isim sabitleri
│   │   ├── hive_initializer.dart    # Uygulama açılışında Hive.initFlutter() çağrısı
│   │   └── hive_service.dart        # Generic get/set/delete/clear wrapper
│   │
│   └── theme/
│       ├── app_colors.dart          # Renk sabitleri
│       ├── app_theme.dart           # Singleton AppTheme — lightTheme / darkTheme
│       ├── app_theme_colors.dart    # ColorScheme tanımları
│       └── text_theme.dart          # AppTextTheme — tipografi
│
└── features/                        # Feature-based modüler yapı
    ├── home/
    │   ├── model/
    │   │   └── user_response_model.dart   # JSON serializable kullanıcı modeli
    │   ├── service/
    │   │   └── home_service.dart          # API çağrılarını saran servis katmanı
    │   ├── store/
    │   │   └── home_store.dart            # MobX store — userList, initApp()
    │   └── view/
    │       └── home_view.dart             # UI widget
    │
    └── splash/
        ├── store/
        │   └── splash_store.dart          # Splash ekranı iş mantığı
        └── view/
            └── splash_view.dart           # Splash UI
```

---

## Mimari Genel Bakış

Proje **Feature-First** klasör organizasyonunu, **Clean Architecture** prensiplerini ve **MobX** reaktif state yönetimini birleştirir.

```
View  ──▶  Store  ──▶  Service  ──▶  CustomDioService
 │           │              │
 │      (MobX reaktif)  (Result<S,E>)
 │
BaseViewMixin (onInit / onDispose)
```

### Katmanlar

**View**
- `StatefulWidget` + `BaseViewMixin` ile `onInit` / `onDispose` yaşam döngüsü yönetimi.
- `flutter_mobx` `Observer` widget'ı ile reaktif UI güncellemeleri.

**Store (State)**
- `BaseStore` tüm store'lara `isLoading`, `errorMessage`, `cancelToken` ve `runResult()` sağlar.
- `runResult()`, `Result<T, ApiException>` döndüren çağrıları işleyerek başarı/başarısızlık akışını standartlaştırır.
- Her feature kendi `@injectable` store'una sahiptir; `ThemeStore` ise global `@singleton` olarak kayıtlıdır.

**Service**
- Sadece API çağrılarını ve model dönüşümlerini içerir; iş mantığı içermez.
- `CustomDioService` üzerinden istekler gönderir, ham `Response` yerine model döndürür.

**Network**
- `CustomDioService`: HTTP metotlarını (GET/POST/PUT/PATCH/DELETE) saran, `CancelToken` destekli servis.
- `Result<S, E>` sealed class: exception fırlatmak yerine tip güvenli hata yönetimi sağlar.
- Hata sınıflandırması: `network`, `timeout`, `unauthorized`, `forbidden`, `notFound`, `server`, `cancelled`, `unknown`.

**Dependency Injection**
- `get_it` + `injectable` kombinasyonu; `build_runner` ile kod üretimi.
- `@injectable` → her istekte yeni instance, `@singleton` → tek instance.
- Hive box'ları `StorageModule` üzerinden DI'a enjekte edilir.

**Routing**
- `go_router` ile deklaratif navigasyon.
- Route path'leri `MainRoutes` sabit sınıfında tutulur; route tanımları `MainRouter`'da ayrılır.
- Özel geçiş animasyonları `RouterTransitionHelper` ile yönetilir.

**Theme**
- `AppTheme` singleton — Material 3 tabanlı `lightTheme` / `darkTheme`.
- `ThemeStore` tercih değişimlerini Hive'a kalıcı olarak yazar.

**Environment**
- `.env` dosyası `envied` ile derleme zamanında şifrelenerek `Env.apiBaseUrl` gibi sabitler üretilir.
- `.env.example` versiyon kontrolüne eklenir; `.env` `.gitignore`'dadır.

---

## Kod Üretimi

```bash
dart run build_runner build --delete-conflicting-outputs
```

Aşağıdaki dosyaları üretir:

| Kaynak | Üretilen Dosya |
|--------|----------------|
| `env.dart` | `env.g.dart` |
| `*_store.dart` | `*_store.g.dart` |
| `*_model.dart` | `*_model.g.dart` |
| `locator.dart` | `locator.config.dart` |

---

## Başlarken

```bash
# Bağımlılıkları yükle
flutter pub get

# .env dosyasını oluştur
cp .env.example .env
# .env içini düzenle: API_BASE_URL=https://api.example.com

# Kod üretimini çalıştır
dart run build_runner build --delete-conflicting-outputs

# Uygulamayı başlat
flutter run
```

---

## Yeni Feature Ekleme

1. `lib/features/<feature_name>/` klasörünü oluştur.
2. `model/` → JSON serializable model yaz, `build_runner` çalıştır.
3. `service/` → `CustomDioService` ile API katmanını oluştur.
4. `store/` → `@injectable` store'u `BaseStore`'dan türet.
5. `view/` → `BaseViewMixin` ile widget'ı yaz.
6. `MainRoutes`'a path sabitini, `MainRouter`'a route tanımını ekle.
