PACKAGES=-package str,lwt,dns.lwt,xenlight,xenlight.xentoollog,cmdliner,uuidm,xenstore,xenstore.client,xenstore_transport,xenstore_transport.lwt
OPAM_DEPS=lwt dns xenctrl cmdliner uuidm xenstore xenstore_transport
INCLUDE=
OPT=-linkpkg -g 
OCAMLOPT=ocamlopt -w A-4-44
FILES=jitsu.mli jitsu.ml main.ml

all: jitsu

jitsu: jitsu.ml main.ml
	ocamlfind $(OCAMLOPT) $(INCLUDE) $(PACKAGES) $(OPT) $(FILES) -o jitsu

.PHONY: install-deps
install-deps:
	opam install $(OPAM_DEPS)

clean:
	rm -f jitsu jitsu.cmx jitsu.cmi jitsu.o main.o main.cmx main.cmi
	rm -f *~ tags
