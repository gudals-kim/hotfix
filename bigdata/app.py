import os

text = open(r'bigdata\data\pianoabc.txt','r').read() #abc코드로 치환된 악보파일

#bag of words
unictext = list(set(text))#중복제거
unictext.sort() #정렬

# 텍스트를 숫자로 치환 utilities
text_to_num = {}
for i, data in enumerate(unictext):
    text_to_num[data] = i
    
    
숫자악보 = []
for i in text:
    숫자악보.append(text_to_num[i])

#----------------------------------------------
#데이터 전처리
Xdata = []
Ydata = []

for i in range(0,len(숫자악보)- 25 ):
    Xdata.append(숫자악보[i : i+25])
    Ydata.append(숫자악보[i+25])

import numpy as np
import tensorflow as tf

#원핫 인코딩
Xdata = tf.one_hot(Xdata,31)
Ydata = tf.one_hot(Ydata,31)
print(Xdata[0:2])

#-------------------------

#모델 디자인

model = tf.keras.models.Sequential([
    tf.keras.layers.LSTM( 100, input_shape=(25,31)),
    tf.keras.layers.Dense(31, activation='softmax')
])

model.compile(loss='categorical_crossentropy',optimizer='adam',metrics=['accuracy'])

model.fit(Xdata,Ydata,batch_size=64, epoch=30)#64개 데이터 학습후 w(가중치) 값 변경

model.save(r'bigdata\model\model1')