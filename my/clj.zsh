function clj 
{
	breakchars="(){}[],^%$#@\"\";:''|\\"
	CLOJURE_DIR=~/soft/clojure
	CLOJURE_JAR="$CLOJURE_DIR"/clojure-1.5.1.jar
	if [[ ${#} -eq 0 ]]; then 
		rlwrap --remember -c -b "$breakchars" \
			-f "$HOME"/.clj_completions \
		     java -cp "$CLOJURE_JAR" clojure.main
	else
		exec java -cp "$CLOJURE_JAR" clojure.main $1 -- "$@"
	fi
}

