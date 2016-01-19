gosu:
	curl -o gosu -sSL "https://github.com/tianon/gosu/releases/download/1.7/gosu-armhf"

build:
	docker build -t "linguofeng/rpi-postgres" --rm=true .

debug:
	docker run -i -t --rm --link postgres --entrypoint=sh "linguofeng/rpi-postgres"

run:
	docker run --name postgres "linguofeng/rpi-postgres"
