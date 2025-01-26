update-packwiz:
	go install github.com/packwiz/packwiz@latest
	go install github.com/Merith-TK/packwiz-wrapper/cmd/pw@main
	clear
	@echo "Packwiz has been Updated"
export-fabric:
	-mkdir -p .build/fabric/
	cd packwiz/versions/fabric/ && pw batch mr export
	-mv packwiz/versions/fabric/**/*.mrpack .build/fabric
export-quilt:
	-mkdir -p .build/quilt/
	cd packwiz/versions/quilt && pw batch mr export
	-mv packwiz/versions/quilt/**/*.mrpack .build/quilt
update-fabric:
	cd packwiz/versions/fabric && pw batch update --all
update-quilt:
	cd packwiz/versions/quilt && pw batch update --all
refresh-fabric:
	cd packwiz/versions/fabric && pw batch refresh
refresh-quilt:
	cd packwiz/versions/quilt && pw batch refresh
refresh:
	make refresh-fabric
	make refresh-quilt
update:
	make update-fabric
	make update-quilt
export:
	make export-fabric
	make export-quilt
clean:
	@rm -rf .build
