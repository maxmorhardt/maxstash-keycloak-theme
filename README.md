![TypeScript](https://img.shields.io/badge/-TypeScript-black?style=for-the-badge&logoColor=white&logo=typescript&color=2F73BF)
![Keycloak](https://img.shields.io/badge/Keycloak-blue?style=for-the-badge&logo=keycloak)

![Static Badge](https://img.shields.io/badge/license-Apache%202.0-green)

## Overview
This repo contains a Keycloak theme based off of Keywind

## Build
```bash
npm install
npm run build
npm run build:jar
```

## Changed Values
- Root (theme\keywind\login\template.ftl)
  - Global styles
  - Favicon details

- Body (theme\keywind\login\components\atoms\body.ftl)
  - Hyperlinks terms/privacy/contact
  - Size color and layout changes

- Form container (theme\keywind\login\components\atoms\container.ftl)
  - Size changes

- Form card (theme\keywind\login\components\atoms\card.ftl)
  - Border color and remove rounding change