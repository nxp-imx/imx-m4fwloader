TARGET = m4fwloader
PREFIX ?= /usr/local

all: $(TARGET)


install: $(TARGET)
	cp $^ $(PREFIX)/bin/

clean:
	rm -f $(TARGET)
