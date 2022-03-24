%module(directors="1") example

%include "typemaps.i"
%include "stdint.i"
%include "arrays_java.i"
%include "carrays.i"
%include "various.i"
%include "enums.swg"
%include "example_exception.i"
%include "java_exceptions.i"

%javaconst(1);

%{
#include "example.h"
%}

/* turn on director wrapping Callback */
%feature("director") Callback;

%pragma(java) jniclassimports=%{
import org.scijava.nativelib.NativeLoader;
%}

%pragma(java) jniclasscode=%{
  static {
    try {
        NativeLoader.loadLibrary("example");
    } catch (Exception e) {
      throw new LinkageError("Look for your architecture binary instructions failed", e);
    }
  }
%}


%include "../cpp/example.h"