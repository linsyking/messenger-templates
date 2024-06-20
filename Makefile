debug: format
	mkdir -p build
	elm make src/Main.elm --output=build/main.js
	cp -f public/index.html .
	cp -f public/*.css build/
	cp -f public/*.js build/

release: format
	mkdir -p build
	elm make src/Main.elm --output=build/main.js --optimize
	cp -f public/index.html .
	cp -f public/*.css build/
	cp -f public/*.js build/

format:
	elm-format src/ --yes

clean:
	rm -rf build/

.PHONY: debug release format clean
