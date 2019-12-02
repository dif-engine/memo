import cv2
import numpy as np
import matplotlib.pyplot as plt


def converter(a):
    def f(x,y):
        sx = (sqrt(2.0)/2.0) * ( x + y) * sqrt(1.0 + a/2.0)
        sy = (sqrt(2.0)/2.0) * (-x + y) * sqrt(1.0 - a/2.0)
        return (sx, sy)
    return f 

def function1(a, d):
    def f(x,y):
        rx = a * x  + y + (d * x) / (1 + x * x)
        ry = -x
        return (rx, ry)

'''
python の配列の扱いがわからない．=> append
配列を伸ばしていくこと．
配列にしたがって逐次処理をすること．
'''


def rose():
    size = 1600
    blue = (255, 120, 0)
    orange = (0, 120, 255)
    img = np.zeros((size, size, 3), np.uint8)
    cv2.rectangle(img, (0, 0), (size, size), (255, 255, 255), thickness=-1)





    cv2.line(img, (0, 1*size//8), (size, 1*size//8), blue, 5)
    cv2.line(img, (0, 2*size//8), (size, 2*size//8), orange, 5)
    cv2.line(img, (0, 3*size//8), (size, 3*size//8), blue, 5)
    cv2.line(img, (0, 4*size//8), (size, 4*size//8), orange, 5)
    cv2.line(img, (0, 5*size//8), (size, 5*size//8), blue, 5)
    cv2.line(img, (0, 6*size//8), (size, 6*size//8), orange, 5)
    cv2.line(img, (0, 7*size//8), (size, 7*size//8), blue, 5)

    cv2.line(img, (1*size//8, 0), (1*size//8, size), blue, 5)
    cv2.line(img, (2*size//8, 0), (2*size//8, size), orange, 5)
    cv2.line(img, (3*size//8, 0), (3*size//8, size), blue, 5)
    cv2.line(img, (4*size//8, 0), (4*size//8, size), orange, 5)
    cv2.line(img, (5*size//8, 0), (5*size//8, size), blue, 5)
    cv2.line(img, (6*size//8, 0), (6*size//8, size), orange, 5)
    cv2.line(img, (7*size//8, 0), (7*size//8, size), blue, 5)

    cv2.line(img, (7*size//16, 7*size//16), (7*size//16, 9*size//16), blue, 5)
    cv2.line(img, (7*size//16, 7*size//16), (9*size//16, 7*size//16), blue, 5)
    cv2.line(img, (9*size//16, 9*size//16), (7*size//16, 9*size//16), blue, 5)
    cv2.line(img, (9*size//16, 9*size//16), (9*size//16, 7*size//16), blue, 5)

    cv2.line(img, (0,0), (size, size), blue, 5)
    cv2.line(img, (0, size), (size, 0), blue, 5)


    cv2.rectangle(img, (0, 0), (size, size), (0, 0, 0), thickness=4)

    #cv2.imshow('image',img)
    #cv2.waitKey(0)
    #cv2.destroyAllWindows()

    #matplotlib.pyplot.imshow()
    #plt.imshow('image', img)
    fig, ax = plt.subplots()
    ax.imshow(img)
    plt.show()

    # 0で埋められた配列を画像として保存します
    cv2.imwrite("rose.jpg", img)

rose()