FROM navikt/pdfgen:358e25cd193130a5c7220f7fb15927173cd8236f

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
