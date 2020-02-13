cd;
sudo apt update
sudo apt-get install cmake libeigen3-dev libgtk-3-dev qt5-default freeglut3-dev
libvtk6-qt-dev libtbb-dev ffmpeg libdc1394-22-dev libavcodec-dev libavformat-dev
libswscale-dev libjpeg-dev libpng++-dev libtiff5-dev
libopenexr-dev libwebp-dev libhdf5-dev
libopenblas-dev liblapacke-dev
mkdir -p opencv && cd opencv
wget https://github.com/opencv/opencv/archive/4.2.0.zip
unzip 4.2.0.zip
mkdir opencv-4.2.0/build && cd opencv-4.2.0/build
cmake -G "Unix Makefiles" --build . -D BUILD_CUDA_STUBS=OFF -D BUILD_DOCS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_JASPER=OFF -D BUILD_JPEG=OFF -D BUILD_OPENEXR=OFF -D BUILD_PACKAGE=ON -D BUILD_PERF_TESTS=OFF -D BUILD_PNG=OFF -D BUILD_SHARED_LIBS=ON -D BUILD_TBB=OFF -D BUILD_TESTS=OFF -D BUILD_TIFF=OFF -D BUILD_WITH_DEBUG_INFO=ON -D BUILD_ZLIB=OFF -D BUILD_WEBP=OFF -D BUILD_opencv_apps=ON -D BUILD_opencv_calib3d=ON -D BUILD_opencv_core=ON -D BUILD_opencv_cudaarithm=OFF -D BUILD_opencv_cudabgsegm=OFF -D BUILD_opencv_cudacodec=OFF -D BUILD_opencv_cudafeatures2d=OFF -D BUILD_opencv_cudafilters=OFF -D BUILD_opencv_cudaimgproc=OFF -D BUILD_opencv_cudalegacy=OFF -D BUILD_opencv_cudaobjdetect=OFF -D BUILD_opencv_cudaoptflow=OFF -D BUILD_opencv_cudastereo=OFF -D BUILD_opencv_cudawarping=OFF -D BUILD_opencv_cudev=OFF -D BUILD_opencv_features2d=ON -D BUILD_opencv_flann=ON -D BUILD_opencv_highgui=ON -D BUILD_opencv_imgcodecs=ON -D BUILD_opencv_imgproc=ON -D BUILD_opencv_java=OFF -D BUILD_opencv_ml=ON -D BUILD_opencv_objdetect=ON -D BUILD_opencv_photo=ON -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=OFF -D BUILD_opencv_shape=ON -D BUILD_opencv_stitching=ON -D BUILD_opencv_superres=ON -D BUILD_opencv_ts=ON -D BUILD_opencv_video=ON -D BUILD_opencv_videoio=ON -D BUILD_opencv_videostab=ON -D BUILD_opencv_viz=OFF -D BUILD_opencv_world=OFF -D CMAKE_BUILD_TYPE=RELEASE -D WITH_1394=ON -D WITH_CUBLAS=OFF -D WITH_CUDA=OFF -D WITH_CUFFT=OFF -D WITH_EIGEN=ON -D WITH_FFMPEG=ON -D WITH_GDAL=OFF -D ITH_GPHOTO2=OFF -D WITH_GIGEAPI=ON -D WITH_GSTREAMER=OFF -D WITH_GTK=ON -D WITH_INTELPERC=OFF -D WITH_IPP=ON -D WITH_IPP_A=OFF -D WITH_JASPER=OFF -D WITH_JPEG=ON -D WITH_LIBV4L=ON -D WITH_OPENCL=ON -D WITH_OPENCLAMDBLAS=OFF -D WITH_OPENCLAMDFFT=OFF -D WITH_OPENCL_SVM=OFF -D WITH_OPENEXR=ON -D WITH_OPENGL=ON -D WITH_OPENMP=OFF -D WITH_OPENNI=OFF -D WITH_PNG=ON -D WITH_PTHREADS_PF=OFF -D WITH_PVAPI=OFF -D WITH_QT=OFF -D WITH_TBB=ON -D WITH_TIFF=ON -D WITH_UNICAP=OFF -D WITH_V4L=OFF -D WITH_VTK=OFF -D WITH_WEBP=ON -D WITH_XIMEA=OFF -D WITH_XINE=OFF -D WITH_LAPACKE=OFF -D WITH_MATLAB=OFF ..
make -j8
sudo make install
