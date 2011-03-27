compile:
	@rebar compile

deps:
	@rebar get-deps

repl:
	@rlwrap erl -pa deps/*/ebin -noshell -s lfe_shell start
