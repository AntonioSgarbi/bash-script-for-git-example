#!/bin/bash

makeGit() {
	pwd	
	arrayIn=("$@")
	for patternName in ${arrayIn[@]}; do
		cd ${patternName}
		echo "# ${patternName}" >> README.md
		git add README.md
		git commit -m "Commit from script"
		git branch -M main
		git remote add origin git@github.com:AntonioSgarbi/${patternName}.git
		git push -u origin main
		pwd
		echo -e "\n\n"
		cd ..
	done
	
	echo ${arrayIn[@]}
	echo -e "\n\n ______________end_directory______________\n\n"
}

cd criacionais
criacionais=("Singleton" "AbstractFactory" "FactoryMethod" "Prototype" "Builder")
makeGit "${criacionais[@]}"
cd ..

pwd

cd estruturais
estruturais=("Adapter"  "Bridge"  "Composite"  "Decorator"  "Facade"  "Flyweight"  "Proxy")
makeGit "${estruturais[@]}"
cd ..

cd comportamentais
comportamentais=("ChainOfResponsability"  "Iterator"  "Observer"  "TemplateMethod" "Command" "Mediator" "State" "Visitor" "Interpreter" "Memento" "Strategy")
makeGit "${comportamentais[@]}"


echo -e "\n\n *************** \n\n ** work done! ** \n\n *************** \n\n"
