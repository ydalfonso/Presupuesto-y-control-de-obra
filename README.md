# ObraControl · Asistente de Presupuestos y Control de Obra

Sistema web integral y autónomo diseñado para arquitectos, ingenieros y supervisores de construcción, enfocado en la elaboración de memorias de cálculo, presupuestos por capítulos, bitácora de compras diarias, control de avance físico ponderado y auditoría financiera de obra.

---

## 👥 Equipo de Desarrollo y Autores (Grupo 30 · Arquitectura)
* **Yulieth Dayana Alfonso Naranjo** ([@ydalfonso](https://github.com/ydalfonso))
* **Fredick Santiago Ruiz Castro** ([@fredickruiz](https://github.com/ydalfonso))
* **Fabián Felipe Patiño Piñeros**
* **Julieth Camila Ballesteros Cifuentes**

**Institución:** Universidad de Boyacá · Instituto de Estudios del Futuro  
**Asignatura:** Inteligencia Artificial Generativa: del Prompt al Producto (2026-2)  
**Profesor:** Santiago Correal Mantilla  
**Proyecto:** ObraControl — Supervisión Técnica de la *Casa Valparaíso* (Rionegro, Antioquia)

---

## 🏗️ Módulos y Funcionalidades del Sistema (Las 5 Funciones del PRD)

### 1. Ficha Técnica y Expediente de Planos (`#planos`)
* **Ficha de Obra:** Datos de radicación, curaduría, modalidad (Administración Delegada), área ($185 \text{ m}^2$) y contacto directo con propietarios (WhatsApp y llamada).
* **Visor Arquitectónico Dual:** Soporte interactivo para planos vectoriales SVG y documentos PDF multipágina mediante Mozilla PDF.js (con fallback automático para documentos nativos).
* **Láminas Técnicas Diferenciadas:** Plano arquitectónico general (distribución espacial, deck, cocina, zonas sociales) y plano estructural técnico independiente (ejes 1-3, A-C, zapatas Z-1, Z-2, Z-3, vigas de amarre VA-01 y notas NSR-10).
* **Clasificación por Especialidad:** Filtro y categorización por *Arquitectura, Estructuras, Hidrosanitario, Eléctrico y Red de Gas*.
* **Motor de Almacenamiento Híbrido:** Gestión de planos pesados y archivos PDF en **IndexedDB** (`ObraControlDB`), garantizando persistencia sin saturar el límite de almacenamiento del navegador.

### 2. Presupuesto por Capítulos y Memorias de Medidas (`#presupuesto`)
* **Memoria de Medidas Paramétrica Adaptativa:** Cálculo según la unidad de medida:
  - **Volumen ($m^3$):** $\text{Veces} \times \text{Largo} \times \text{Ancho} \times \text{Alto} \times (1 + \text{Desperdicio \%})$
  - **Área ($m^2$):** $\text{Veces} \times \text{Largo} \times \text{Ancho o Alto} \times (1 + \text{Desperdicio \%})$
  - **Longitud ($ml$):** $\text{Veces} \times \text{Longitud} \times (1 + \text{Desperdicio \%})$
  - **Unidades ($und, kg, glb$):** Modo directo manual o conteo de piezas.
* **Insignias Visuales por Unidad:** Identificación rápida en tablas para $m^3$, $m^2$, $ml$, $und$, $kg$, $glb$.
* **Desglose de Costos:** Precios unitarios y costo total por partida en pesos colombianos ($ COP).
* **Capítulos Estructurados:** Preliminares, Cimentación, Estructura, Mampostería, Instalaciones y Acabados.
* **Modal APU Dinámico:** Formulario inteligente con cambio automático de etiquetas y casillas según la unidad, selector de modo (geométrico vs directo) y previsualización en vivo.
* **Exportación a CSV / Excel:** Descarga de planilla de cantidades con codificación UTF-8 compatible con Microsoft Excel.

### 3. Bitácora de Gastos y Compras Diarias (`#gastos`)
* **Registro de Egresos:** Control diario de facturas, recibos de caja y remisiones de obra.
* **Fechas Coherentes en Calendario Local:** Manejo de fechas relativo a la zona horaria del usuario para evitar desfasajes UTC.
* **Clasificación de Costos:** Categorización en *Materiales, Mano de Obra (Jornales), Equipos y Herramientas, Transporte/Fletes y Varios*.
* **Auditoría por Capítulo:** Imputación de cada compra al capítulo presupuestal correspondiente con matching semántico flexible.
* **Filtros y Búsqueda en Vivo:** Filtrado por categoría, capítulo y buscador instantáneo de proveedores o comprobantes.
* **Exportación a CSV / Excel:** Generación de la bitácora contable de obra.

### 4. Control Diario de Avance Físico (`#avance`)
* **% de Avance Físico Ponderado (Fórmula Técnica Oficial):**
  $$\% \text{ Avance Global} = \frac{\sum (\text{Costo Presupuestado del Ítem} \times \% \text{ Avance})}{\text{Costo Total Presupuestado}} \times 100$$
* **Cubicación Proyectada vs Ejecutada:** Seguimiento de cantidades construidas vs programadas en sus respectivas unidades ($m^3, m^2, ml, etc.$).
* **Estados Visuales:** 🟢 *Terminada y recibida*, 🟡 *En proceso*, ⚪ *Pendiente*.
* **Modal de Inspección Técnica (`#modal-avance`):** Slider interactivo, sincronización bidireccional entre cantidad física y porcentaje, botones de avance rápido (0%, 25%, 50%, 75%, 100%) y notas de calidad NSR-10.
* **Trazabilidad e Historial Cronológico (`#modal-historial-avance`):** Registro de inspecciones previas con fecha, porcentaje alcanzado, cubicación, inspector asignado y notas de supervisión.
* **Descarga de Acta de Avance:** Exportación en CSV listo para informes de interventoría.

### 5. Resumen Ejecutivo y Control Financiero (`#resumen`)
* **Dashboard Directivo:** Presupuesto Total Programado, Gastos Reales Pagados, Saldo Disponible y Porcentaje Utilizado.
* **Semáforo de Salud de Obra:** Contrasta el `% Avance Físico Ponderado` frente al `% Avance Financiero` para detectar sobrecostos tempranos.
* **Desglose por Recursos:** Gráficos de barras para materiales, mano de obra, maquinaria y fletes.
* **Matriz de Alertas Inteligentes Completa:** Audita automáticamente **todos los capítulos de la obra** para alertar sobrecostos específicos, capítulos cercanos al límite presupuestal (>90%) y diagnóstico de flujo de caja.
* **Balance por Capítulos:** Cruce consolidado de cuentas con semáforos de riesgo financiero.
* **Impresión / Exportación:** Formato optimizado para impresión ejecutiva o guardado en PDF (`Ctrl + P`).

---

## 🔧 Correcciones y Mejoras Técnicas Implementadas (Entrega del 5 de Noviembre)

Cumpliendo con la rúbrica oficial de la entrega del 5 de noviembre ("Fallas del 29 de octubre: Las tres, sin fallas nuevas"), el equipo implementó las siguientes correcciones:

1. **Almacenamiento de Planos Grandes (Fallas 1 y 2):** Implementación de **IndexedDB** (`ObraControlDB`) con store `plan_files`, evitando caídas por límite de cuota en `localStorage`.
2. **Ampliación de Unidades de Medida en Presupuestos (Falla 3):** Soporte integral para $m^3$, $m^2$, $ml$, $und$, $kg$ y $glb$. El formulario modal adapta sus campos dinámicamente según la unidad seleccionada.
3. **Auditoría Multicapítulo y Normalización Semántica (Falla 4):** Coincidencia semántica con `matchChapter()` para cruzar partidas y compras sin importar variantes tipográficas. La Matriz de Alertas ahora audita exhaustivamente cada capítulo presupuestado.
4. **Sincronización Multiventana en Tiempo Real (Falla 5):** Integración de `BroadcastChannel` y detector de eventos `storage`, permitiendo que cambios en una pestaña o dispositivo se reflejen instantáneamente en las demás.
5. **Calendario y Fechas Locales (Falla 6):** Reemplazo de marcas de tiempo UTC por función de calendario local (`getLocalDateString()`), eliminando desfasajes de un día en los registros de compras e inspecciones.
6. **Planos Técnicos Diferenciados por Especialidad (Falla 7):** Renderizado de plano vectorial estructural (`VECTOR_STRUCTURAL_HTML`) para cimentación y zapatas, con ejes de replanteo y especificaciones NSR-10 independientes del plano arquitectónico.
7. **Trazabilidad e Historial Cronológico de Avance (Falla 8):** Módulo de auditoría que preserva el historial de visitas a obra en cada partida presupuestal con modal de línea de tiempo interactiva.

---

## 🛠️ Tecnologías Utilizadas
* **HTML5 Semántico + JavaScript Moderno (ES6+):** Single Page Application (SPA) modular, autónoma y reactiva.
* **Tailwind CSS (CDN):** Sistema de diseño adaptable con paleta sobria de construcción y arquitectura.
* **Mozilla PDF.js:** Renderizado y paginación de planos PDF en cualquier navegador y dispositivo móvil.
* **Google Plus Jakarta Sans & Material Symbols:** Tipografía e iconografía arquitectónica.
* **LocalStorage & IndexedDB:** Persistencia local híbrida de fichas, planos, gastos, partidas, avances e historial.

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

Para acceder a la versión web pública:
* **URL en vivo:** `https://ydalfonso.github.io/Presupuesto-y-control-de-obra/`

Para configurar o actualizar la publicación:
1. En el repositorio de GitHub, dirígete a **Settings** > **Pages**.
2. En la sección **Build and deployment** > **Source**, selecciona `Deploy from a branch`.
3. Selecciona la rama `main` y la carpeta `/ (root)`.
4. Haz clic en **Save**. En aproximadamente 1 minuto la aplicación estará disponible en internet.

---

## 📝 Declaración de Uso de Inteligencia Artificial (Universidad de Boyacá)
* **Herramientas utilizadas:** Google Antigravity / Gemini 3.8 Flash.
* **Para qué las utilicé:** Asistencia de pair programming para la arquitectura de la aplicación web, estructuración de las 5 funciones clave del PRD, codificación de las fórmulas de cubicación ($m^3, m^2, ml$) y ponderación de avance físico, implementación de la persistencia local en IndexedDB y diseño responsivo con Tailwind CSS.
* **Qué aportó el equipo:** Definición del proyecto arquitectónico (*Casa Valparaíso*), cuadro de áreas, especificaciones técnicas de materiales (concreto 3000 PSI, acero W60), precios unitarios en COP basados en el mercado de la construcción en Colombia, diseño de la experiencia de usuario y validación de las memorias de cálculo.
* **Qué verifiqué y contra qué fuente:** Se verificaron las fórmulas de volumen con desperdicio ($V = veces \times L \times An \times Al \times (1 + desp)$) y la fórmula del porcentaje ponderado de avance físico contra los manuales de costos y presupuestos de obra civil y la norma sismorresistente colombiana NSR-10.
