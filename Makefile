update-packwiz:
	go install github.com/packwiz/packwiz@latest
	go install github.com/Merith-TK/packwiz-wrapper/cmd/pw@main
	clear
	@echo "Packwiz has been Updated"
export-fabric:
	-mkdir -p .build/fabric/
	cd src/versions/fabric/ && pw batch mr export
	-mv src/versions/fabric/**/*.mrpack .build/fabric
export-quilt:
	-mkdir -p .build/quilt/
	cd src/versions/quilt && pw batch mr export
	-mv src/versions/quilt/**/*.mrpack .build/quilt
update-fabric:
	cd src/versions/fabric && pw batch update --all
update-quilt:
	cd src/versions/quilt && pw batch update --all
refresh-fabric:
	cd src/versions/fabric && pw batch refresh
refresh-quilt:
	cd src/versions/quilt && pw batch refresh
refresh:
	make refresh-fabric
	make refresh-quilt
update:
	make update-fabric
	make update-quilt
export:
	make export-fabric
	make export-quilt
