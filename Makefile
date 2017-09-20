run:
	node index.js

docker-build:
	docker build -t pup-emulator-bug .

docker-run: docker-build
	docker run -v $$PWD/output:/home/dev/output/ -it pup-emulator-bug
