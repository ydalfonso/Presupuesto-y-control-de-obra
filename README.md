# ObraControl · Asistente de Presupuestos y Control de Obra

Sistema web integral y autónomo diseñado para arquitectos, ingenieros y supervisores de construcción, enfocado en la elaboración de memorias de cálculo, presupuestos por capítulos, bitácora de compras diarias, control de avance físico ponderado y auditoría financiera de obra.

---

## 👥 Equipo de Desarrollo y Autores
* **Yulieth Alfonso** ([@ydalfonso](https://github.com/ydalfonso))
* **Juan Fredick Ruiz** ([@fredickruiz](https://github.com/ydalfonso))

**Institución:** Universidad de Boyacá · Instituto de Estudios del Futuro  
**Asignatura:** Inteligencia Artificial Generativa: del Prompt al Producto (2026-2)  
**Proyecto:** ObraControl — Supervisión Técnica de la *Casa Valparaíso* (Rionegro, Antioquia)

---

## 🏗️ Módulos y Funcionalidades del Sistema

### 1. Ficha Técnica y Expediente de Planos (`#planos`)
* **Ficha de Obra:** Datos de radicación, curaduría, modalidad (Administración Delegada), área ($185 \text{ m}^2$) y contacto directo con propietarios (WhatsApp y llamada).
* **Visor Arquitectónico:** Soporte interactivo para planos vectoriales SVG y documentos PDF multipágina mediante Mozilla PDF.js.
* **Clasificación por Especialidad:** Filtro y categorización por *Arquitectura, Estructuras, Hidrosanitario, Eléctrico y Red de Gas*.

### 2. Presupuesto por Capítulos y Memorias de Medidas (`#presupuesto`)
* **Memoria de Cálculo Geométrica:** Cálculo automático de volumen:
  $$V_{\text{final}} = \text{Veces} \times \text{Largo} \times \text{Ancho} \times \text{Alto} \times (1 + \text{Desperdicio \%})$$
* **Desglose de Costos:** Precios unitarios y costo total por partida en pesos colombianos ($ COP).
* **Capítulos Estructurados:** Preliminares, Cimentación, Estructura, Mampostería, Instalaciones y Acabados.
* **Modal APU:** Formulario para agregar y editar mediciones de obra con previsualización en vivo.
* **Exportación a CSV / Excel:** Descarga de planilla de cantidades compatible con Microsoft Excel.

### 3. Bitácora de Gastos y Compras Diarias (`#gastos`)
* **Registro de Egresos:** Control diario de facturas, recibos de caja y remisiones de obra.
* **Clasificación de Costos:** Categorización en *Materiales, Mano de Obra (Jornales), Equipos y Herramientas, Transporte/Fletes y Varios*.
* **Auditoría por Capítulo:** Imputación de cada compra al capítulo presupuestal correspondiente.
* **Filtros y Búsqueda en Vivo:** Filtrado por categoría, capítulo y buscador instantáneo de proveedores o comprobantes.
* **Exportación a CSV / Excel:** Generación de la bitácora contable de obra.

### 4. Control Diario de Avance Físico (`#avance`)
* **% de Avance Físico Ponderado (Fórmula Técnica Oficial):**
  $$\% \text{ Avance Global} = \frac{\sum (\text{Costo Presupuestado del Ítem} \times \% \text{ Avance})}{\text{Costo Total Presupuestado}} \times 100$$
* **Cubicación Proyectada vs Ejecutada:** Seguimiento de $m^3$ construidos vs programados.
* **Estados Visuales:** 🟢 *Terminada y recibida*, 🟡 *En proceso*, ⚪ *Pendiente*.
* **Modal de Inspección Técnica (`#modal-avance`):** Slider interactivo, botones rápidos (0%, 25%, 50%, 75%, 100%) y notas de calidad (ensayos de probetas, fraguado NSR-10, niveles).
* **Descarga de Acta de Avance:** Exportación en CSV listo para informes de interventoría.

### 5. Resumen Ejecutivo y Control Financiero (`#resumen`)
* **Dashboard Directivo:** Presupuesto Total Programado, Gastos Reales Pagados, Saldo Disponible y Porcentaje Utilizado.
* **Semáforo de Salud de Obra:** Contrasta el `% Avance Físico` frente al `% Avance Financiero` para detectar sobrecostos tempranos.
* **Desglose por Recursos:** Gráficos de barras para materiales, mano de obra, maquinaria y fletes.
* **Matriz de Alertas Inteligentes:** Diagnósticos automáticos de liquidez, flujo de caja y rendimientos.
* **Balance por Capítulos:** Cruce consolidado de cuentas con semáforos de riesgo.
* **Impresión / Exportación:** Formato optimizado para impresión ejecutiva o guardado en PDF (`Ctrl + P`).

---

## 🛠️ Tecnologías Utilizadas
* **HTML5 Semántico + JavaScript Moderno (ES6+):** Single Page Application (SPA) modular y reactiva.
* **Tailwind CSS (CDN):** Sistema de diseño adaptable con paleta sobria de construcción y arquitectura.
* **Mozilla PDF.js:** Renderizado y paginación de planos PDF en cualquier navegador y dispositivo móvil.
* **Google Plus Jakarta Sans & Material Symbols:** Tipografía e iconografía arquitectónica.
* **LocalStorage & IndexedDB:** Persistencia local de fichas, planos, gastos, partidas y avances sin requerir servidor backend.

---

## 🚀 Cómo Ejecutar la Aplicación

No requiere instalaciones complejas ni servidores Node.js o Python:
1. Clona o descarga este repositorio:
   ```bash
   git clone https://github.com/ydalfonso/Presupuesto-y-control-de-obra.git
   ```
2. Haz doble clic en el archivo `index.html` o ábrelo con cualquier navegador web (Google Chrome, Microsoft Edge, Firefox, Brave, etc.).

---

## 🌐 Publicación en GitHub Pages (Demo en Vivo)

Para habilitar la versión web pública accesible desde cualquier celular o computador:
1. En el repositorio de GitHub, dirígete a **Settings** > **Pages**.
2. En la sección **Build and deployment** > **Source**, selecciona `Deploy from a branch`.
3. Selecciona la rama `main` y la carpeta `/ (root)`.
4. Haz clic en **Save**. En 1 minuto tendrás la URL pública en vivo:
   `https://ydalfonso.github.io/Presupuesto-y-control-de-obra/`

---

## 📝 Declaración de Uso de Inteligencia Artificial (Universidad de Boyacá)
* **Herramientas utilizadas:** Google Antigravity / Gemini 3.8 Flash.
* **Para qué las utilicé:** Asistencia de pair programming para la arquitectura de la aplicación web, estructuración de las 5 funciones clave del PRD, codificación de las fórmulas de cubicación ($m^3$) y ponderación de avance físico, implementación de la persistencia local y diseño responsivo con Tailwind CSS.
* **Qué aportó el equipo:** Definición del proyecto arquitectónico (*Casa Valparaíso*), cuadro de áreas, especificaciones técnicas de materiales (concreto 3000 PSI, acero W60), precios unitarios en COP basados en el mercado de la construcción en Colombia, diseño de la experiencia de usuario y validación de las memorias de cálculo.
* **Qué verifiqué y contra qué fuente:** Se verificaron las fórmulas de volumen con desperdicio ($V = veces \times L \times An \times Al \times (1 + desp)$) y la fórmula del porcentaje ponderado de avance físico contra los manuales de costos y presupuestos de obra civil.
