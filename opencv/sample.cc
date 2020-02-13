#include <opencv2/opencv.hpp>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>

using namespace cv;
using namespace std;

#define image_path_string "madoka.png"
#define W 500
#define H 350

/*
CV_AA ==> LINE_AA
cvNamedWindow ==> namedWindow
cvWaitKey ==> waitKey
format ==> Formatter::format ; コードを参照
*/



#define IMAGESHOW(X) do{  \
  namedWindow(#X);      \
  imshow(#X, X);          \
  }while(0)

int main()
{
  //画像の読み込み
  Mat img1 = imread( image_path_string, IMREAD_COLOR);


  //画像をグレースケールで読み込む
  Mat img2 = imread( image_path_string, IMREAD_GRAYSCALE);


  //カラー画像の作成
  Mat img3 = Mat::zeros(Size(W, H), CV_8UC3);


  //応用：img2と同じサイズでグレー画像を作成
  Mat img4 = Mat::zeros(Size(img2.cols, img2.rows), CV_8UC1);


  //グレースケール画像をカラー画像に変換する
  Mat img2_color;
  cvtColor(img2, img2_color, COLOR_GRAY2BGR);


  //比較のために両方に「赤い対角線」を入れてみる
  const int W2 = img2.cols;
  const int H2 = img2.rows;
  line(img2, Point(0,0), Point(W2,H2)
    , Scalar(0,0,255), 3, LINE_AA);
  line(img2_color, Point(0,0), Point(W2,H2)
    , Scalar(0,0,255), 3, LINE_AA);
  //Scalar(b,g,r,alpha=0)


  //コピーコンストラクタ
  Mat img5(img2);
  //これは「浅い」コピーになる。
  //したがって、img5 に対する操作は img2 に反映される。
  line(img5, Point(0,H2/2), Point(W2,H2/2)
    , Scalar(0,255,0), 3, LINE_AA);


  Mat img6 = img2.clone();
  //これは「深い」コピーになる。
  //したがって、img6 に対する操作は img2 には全く反映されない。


  //画素に対する直接操作（グレースケール画像の場合）
  //市松模様にしてみる
  for(int y = 0; y < img6.rows; ++y)
  {
    for(int x = 0; x < img6.cols; ++x)
    {
      img6.at<unsigned char>(y,x)
        = 255 * ((x/10+y/10) % 2);
      // (y,x) という順であることに注意する。
    }
  }


  //画素に対する直接操作（カラー画像の場合）
  //一列毎に色が変わる市松模様にしてみる
  Mat img7 = img3.clone();
  for(int y = 0; y < img7.rows; ++y)
  {
    for(int x = 0; x < img7.cols; ++x)
    {
      img7.at<Vec3b>(y,x)[0] = ((y/10)%3 == 0)? 255 * ((x/10+y/10) % 2) : 0;//B
      img7.at<Vec3b>(y,x)[1] = ((y/10)%3 == 1)? 255 * ((x/10+y/10) % 2) : 0;//G
      img7.at<Vec3b>(y,x)[2] = ((y/10)%3 == 2)? 255 * ((x/10+y/10) % 2) : 0;//R
      // (y,x) という順であることに注意する。
    }
  }


  //画像の「原点」は左上である；
  //つまりx軸は左から右へ、y軸は上から下に走っている。
  circle(img6, Point(0,0), 100
    , Scalar(0,250,250), 5, LINE_AA);
  circle(img7, Point(0,0), 100
    , Scalar(0,250,250), 5, LINE_AA);


  //画像の保存：拡張子に応じた形式で保存される。
  imwrite("img7.png", img7);
  imwrite("img7.jpg", img7);
  imwrite("img7.bmp", img7);

  //文字列への書き出し
  //(検証しやすくするため小さめの画像でやる)
  Mat img8 = Mat::zeros(Size(20, 15), CV_8UC1);
  for(int y = 0; y < img8.rows; ++y)
  {
    for(int x = 0; x < img8.cols; ++x)
    {
      img8.at<unsigned char>(y,x) = 255 * ((x+y) % 2);
    }
  }

  //C言語のデータとして使える形式で書き出し
  ostringstream C_out;
  C_out << Formatter::get(Formatter::FMT_C)->format(img8);
  cout << "C:" << C_out.str() << endl;

  //CSV形式で書き出し
  ostringstream CSV_out;
  CSV_out << Formatter::get(Formatter::FMT_CSV)->format(img8);
  cout << "CSV:" << CSV_out.str() << endl;

  //Pythonのデータとして使える形式で書き出し
  ostringstream Python_out;
  Python_out << Formatter::get(Formatter::FMT_PYTHON)->format(img8);
  cout << "Python:" << Python_out.str() << endl;

  IMAGESHOW(img1);
  IMAGESHOW(img2);
  IMAGESHOW(img2_color);
  IMAGESHOW(img3);
  IMAGESHOW(img4);
  IMAGESHOW(img5);
  IMAGESHOW(img6);
  IMAGESHOW(img7);

  cout << "hit any key on some image window" << endl;
  waitKey(0);

  return 0;
}
