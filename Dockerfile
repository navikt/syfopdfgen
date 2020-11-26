FROM navikt/pdfgen:15737ab4280c486cffe7b60dc53584d3a4fbcf6d

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
