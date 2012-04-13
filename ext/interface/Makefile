.PHONY: clean

SWIG = swig
SWIGFLAGS = -ruby -c++ -I../../extlib/irrKlang/include/ -I./
RUBY = ruby

TARGET = irrklang_wrap.cpp

all: $(TARGET)

$(TARGET): irrklang_all.i
	$(SWIG) $(SWIGFLAGS) -o $@ $<

clean:
	@rm -f $(TARGET)
