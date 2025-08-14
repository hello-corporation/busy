PKG := busy

build:
	nix build
	docker load < result
	rm result

run:
	docker run --rm -it $(PKG)

clean:
	docker rmi $(PKG)
