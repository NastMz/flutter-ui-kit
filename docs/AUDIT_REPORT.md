# Auditoría de Paridad con shadcn/ui

**Fecha:** 16 de diciembre de 2025
**Objetivo:** Verificar que todos los componentes implementados estén alineados con shadcn/ui al milímetro

---

## ✅ Hallazgos Críticos (RESUELTOS)

### 1. **UiButton** - Variantes y tamaños inconsistentes ✅

**Estado:** ✅ **RESUELTO** (v0.0.9)

**Cambios implementados:**

- ✅ Agregada variante `UiButtonVariant.default_` (usa `_` por conflicto con palabra reservada en Dart)
- ✅ Agregados tamaños `UiButtonSize.iconSm` (32x32px) e `iconLg` (48x48px)
- ✅ Tokens actualizados: `iconButtonSm: 32`, `iconButtonMd: 40`, `iconButtonLg: 48`
- ⚠️ **BREAKING CHANGE**: `primary` renombrado a `default_`

**API actualizada:**

```dart
UiButton(variant: UiButtonVariant.default_ | secondary | destructive | outline | ghost | link)
UiButton(size: UiButtonSize.sm | md | lg | icon | iconSm | iconLg)
```

**Migración:**

```dart
// Antes
UiButton(variant: UiButtonVariant.primary)

// Después
UiButton(variant: UiButtonVariant.default_)
```

---

### 2. **UiCard** - Falta componente CardAction ✅

**Estado:** ✅ **RESUELTO** (v0.0.9)

**Cambios implementados:**

- ✅ Agregado widget `UiCardAction`
- ✅ `UiCardHeader` acepta parámetro `action` opcional
- ✅ Action posicionado en esquina superior derecha usando `Stack`

**API actualizada:**

```dart
UiCard(
  header: UiCardHeader(
    title: 'Title',
    subtitle: 'Description',
    action: UiCardAction(
      child: IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
    ),
  ),
  content: ...,
  footer: ...,
)
```

---

## 🟡 Hallazgos Menores

### 3. **UiBadge** - Variante default ✅

**Estado:** ✅ **RESUELTO** (v0.0.9)

**Cambios implementados:**

- ✅ Renombrado `UiBadgeVariant.primary` → `UiBadgeVariant.default_`
- ✅ Default variant es el primero en el enum
- ⚠️ **BREAKING CHANGE**: `primary` renombrado a `default_`

**API actualizada:**

```dart
UiBadge(variant: UiBadgeVariant.default_ | secondary | destructive | outline)
```

---

### 4. **UiAvatar** - borderRadius personalizado ✅

**Estado:** ✅ **RESUELTO** (v0.0.9)

**Cambios implementados:**

- ✅ Agregado parámetro opcional `borderRadius`
- ✅ Cuando `borderRadius` es null, el avatar es circular (default)
- ✅ Cuando se especifica `borderRadius`, el avatar es cuadrado con bordes redondeados

**API actualizada:**

```dart
// Avatar circular (default)
UiAvatar(image: ..., fallback: 'JD')

// Avatar cuadrado con bordes redondeados
UiAvatar(image: ..., fallback: 'JD', borderRadius: ui.radius.lg)
```

---

### 5. **UiTextarea** - minLines/maxLines ✅

**Estado:** ✅ **ALINEADO**

**Comportamiento actual:**

- ✅ Usa `minLines` y `maxLines` explícitas (igual que shadcn)
- ✅ No tiene auto-resize automático
- ✅ Defaults: minLines=3, maxLines=5

**API:**

```dart
UiTextarea(
  minLines: 3,
  maxLines: 5,
  // ...
)
```

---

## 🎨 Auditoría de Tokens

### Radius Tokens ⚠️ **AJUSTADO**

**Problema encontrado:**

- ❌ `RadiusTokens.md` era 6px, pero shadcn usa `--radius: 0.625rem` (10px) como default

**Cambios implementados:**

- ✅ `md`: 6px → **10px** (coincide con `--radius: 0.625rem`)
- ✅ `lg`: 8px → **12px**
- ✅ `xl`: 12px → **16px**
- ✅ `xl2`: 16px → **20px**

**Nueva escala (v0.0.4):**

```dart
none: 0, xs: 2, sm: 4, md: 10, lg: 12, xl: 16, xl2: 20
```

### Color Tokens ✅ **ALINEADOS**

**Verificación completa:**

- ✅ Todos los colores coinciden con shadcn CSS variables
- ✅ Light theme: `--background`, `--foreground`, `--primary`, etc.
- ✅ Dark theme: valores correctos
- ✅ Semantic colors: `destructive`, `muted`, `accent`, `border`, `input`, `ring`

**Mapeo 1:1 con shadcn:**

```
--background → ColorTokens.background
--foreground → ColorTokens.foreground
--primary → ColorTokens.primary
--primary-foreground → ColorTokens.onPrimary
--secondary → ColorTokens.secondary
--muted → ColorTokens.muted
--accent → ColorTokens.accent
--destructive → ColorTokens.destructive
--border → ColorTokens.border
--input → ColorTokens.input
--ring → ColorTokens.ring
```

### Spacing Tokens ✅ **ALINEADOS**

**Verificación:**

- ✅ Escala coincide con Tailwind (usado por shadcn)
- ✅ `none: 0, px: 2, xs: 4, sm: 8, md: 12, lg: 16, xl: 20, xl2: 24, xl3: 32`
- ✅ Todos los valores son correctos

### Size Tokens ✅ **ALINEADOS**

**Verificación:**

- ✅ Button sizes: sm (36px), default (40px), lg (44px)
- ✅ Input sizes: sm (36px), default (40px), lg (44px)
- ✅ Icon button sizes: sm (32px), md (40px), lg (48px) ← **NUEVO v0.0.9**
- ✅ Icon sizes: xs (12px), sm (16px), md (20px), lg (24px), xl (28px)

---

## ✅ Componentes Alineados

Los siguientes componentes están correctamente alineados:

- **UiTextField (Input)** ✅
  - Padding, radius, estados correctos
  - Focus ring, error states, disabled state
- **UiCheckbox** ✅
  - 16px fixed size
  - 2px radius (xs)
  - Estados checked/unchecked/disabled
- **UiSwitch** ✅
  - 40x24px dimensions
  - Animated thumb
  - Token-based colors
- **UiRadio** ✅
  - 16px fixed size
  - Group behavior
  - Proper spacing
- **UiLabel** ✅
  - Typography correcta
  - htmlFor equivalent (asociación con inputs)
- **UiSidebar** ✅
  - shadcn/ui tiene sidebar como componente nuevo
  - Nuestra implementación con sections/header/footer está alineada

---

## 📊 Resumen

| Componente  | Estado     | Prioridad | Esfuerzo |
| ----------- | ---------- | --------- | -------- |
| UiButton    | 🔴 Crítico | Alta      | 2-3h     |
| UiCard      | 🟡 Menor   | Media     | 1h       |
| UiBadge     | ✅ OK      | -         | -        |
| UiAvatar    | ✅ OK      | -         | -        |
| UiCheckbox  | ✅ OK      | -         | -        |
| UiRadio     | ✅ OK      | -         | -        |
| UiSwitch    | ✅ OK      | -         | -        |
| UiLabel     | ✅ OK      | -         | -        |
| UiTextField | ✅ OK      | -         | -        |
| UiTextarea  | ✅ OK      | -         | -        |
| UiSidebar   | ✅ OK      | -         | -        |

**Total de issues:** 2 críticos, 3 menores

---

## 🎯 Plan de Acción Propuesto

### Prioridad 1 (Crítico - Rompe API)

1. **UiButton variants:** Agregar `default`, deprecar `primary`
2. **UiButton sizes:** Agregar `iconSm` e `iconLg`
3. **Actualizar SizesTokens:** Agregar `iconSm: Size(32, 32)` e `iconLg: Size(40, 40)`

### Prioridad 2 (Mejoras API)

4. **UiCard:** Agregar `CardAction` slot en header
5. **UiBadge:** Verificar variante default
6. **UiAvatar:** Verificar borderRadius customizable

### Prioridad 3 (Documentación)

7. Actualizar ejemplos en showcase
8. Actualizar CHANGELOG con breaking changes
9. Crear migration guide si es necesario

---

## 🔗 Referencias

- [shadcn/ui Button](https://ui.shadcn.com/docs/components/button)
- [shadcn/ui Button Changelog](https://ui.shadcn.com/docs/components/button#changelog)
- [shadcn/ui Card](https://ui.shadcn.com/docs/components/card)
- [shadcn/ui Badge](https://ui.shadcn.com/docs/components/badge)
- [shadcn/ui Avatar](https://ui.shadcn.com/docs/components/avatar)
