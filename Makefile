build-html:
	quarto render --to html

build-pdf:
	quarto render --to pdf

deploy:
	quarto render --to html
	cp -r .vercel _book && \
	cp .vercelignore _book && \
	vercel --cwd _book --prod
