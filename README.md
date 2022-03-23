# Gradle Cmake Swig Starter: A template to build a jar with native lib(.so)

## Build 
### Build Native
```
1. mkdir build
2. cd build
3. cmake ..
```

### Build Jar
```
1. ./gradlew build
```

## Example
* this example use swig callback example.
* generate source file to **src/main/cpp**.
* generate java source file to **src/main/java**.
* use gradle to add dependency (native-lib-loader) to dynamic load the native lib.