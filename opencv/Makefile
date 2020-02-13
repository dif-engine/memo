help:
	@grep -E '^[0-9a-zA-Z_-]+[[:blank:]]*:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1;32m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help add


OPENCVHEADER = /usr/local/include/opencv4
 
LIB_LOADPATH = -L/usr/local/lib
 
LINK_OPENCV_LIBS = \
-lopencv_core \
-lopencv_imgcodecs \
-lopencv_highgui \
-lopencv_imgproc

 
LDFLAGS = -lm -lstdc++ $(LIB_LOADPATH) $(LINK_OPENCV_LIBS)
 

add : ## add some files
	git add Makefile basic1.cc

sample: sample.cc ## build sample.cc 
	$(CXX) $< -o $@ -I$(OPENCVHEADER) $(LIB_LOADPATH) $(LINK_OPENCV_LIBS)


