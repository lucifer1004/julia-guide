deploy:
	quarto render --to html && \
	cp -r .vercel _book && \
	cp .vercelignore _book && \
	vercel --cwd _book --prod
