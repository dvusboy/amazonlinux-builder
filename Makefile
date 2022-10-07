RELEASE         := 1
BASETAG		:= 2
TAG              = dvusboy/amazonlinux-builder:$(BASETAG)-$(RELEASE)
MARKER          := .image.done
LOG             := build.log

.PHONY : default
default : $(MARKER)

$(MARKER) : Dockerfile
	[ -s "$@" ] && docker image rm `cat $@`; rm -f $@
	docker build --pull --rm \
		--build-arg BASETAG=$(BASETAG) \
		--build-arg RELEASE=$(RELEASE) \
		--iidfile $@ --tag $(TAG) 2>&1 . | tee $(LOG)
	[ -s "$@" ] || rm -f "$@"

.PHONY : clean
clean :
	rm -f $(LOG)

.PHONY : clean-img
clean-img :
	[ -s "$(MARKER)" ] && docker image rm `cat $(MARKER)`
	rm -f "$(MARKER)"

.PHONY : clean-all
clean-all : clean-img clean

.PHONY : push
push : $(MARKER)
	docker push $(TAG)
