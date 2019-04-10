FROM navikt/pdfgen:f55d2cdb607c637934851c5898ab0f4dc836a7d7

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
