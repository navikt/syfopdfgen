FROM navikt/pdfgen:52da08ebd00cc0ff9e2c0bee821a2a17097755ce

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
