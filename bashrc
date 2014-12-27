#.bashrc
#echo "in .bashrc"

#Use the git repo for most things...
if [ -h ~/.bash_functions ];  then
  #echo "in ~/.bash_functions/*"
  export rcread=1
  #Use the git repo for most things...
  for i in  $(ls ~/.bash_functions/*); do
	 #echo "Running: source $i"
         source $i;
   done
fi

#Local additions we don't want on github.
if [ -d ~/.bash_local ] && [ -z $localrcread ]; then
  export localrcread=1
  for i in  $(ls ~/.bash_local/*); do
         source "$i";
   done
fi
