FROM navikt/pdfgen:2e588363aba91b919bc80f78ca1df2b200f4c29d

COPY templates /app/templates
COPY fonts /app/fonts
COPY resources /app/resources
