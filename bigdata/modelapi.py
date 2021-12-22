import tensorflow as tf



#0. 첫입력값 만들기
#1. predict (딥러닝)으로 다음문자 예측
#2. 예측한 문자들 리스트에 저장
#3. 첫 입력값을 빼기
#4. 예측한 다음문자를 뒤에 넣기
#5. 원핫인코딩해서, expand dims



#모델불러오기
Pmodel = tf.keras.models.load_model(r'bigdata\model\model1\model1')


#-------------랜덤한 처음노래 고르기 (첫 입력값 생성)--------
import os
import numpy as np


text = open(r'bigdata\data\pianoabc.txt','r').read() #abc코드로 치환된 악보파일

#bag of words
unictext = list(set(text))#중복제거
unictext.sort() #정렬

# 텍스트를 숫자로 치환 utilities
text_to_num = {}
num_to_text = {}
for i, data in enumerate(unictext):
    text_to_num[data] = i
    num_to_text[i] = data
    
숫자악보 = []
for i in text:
    숫자악보.append(text_to_num[i])
    
첫입력 = 숫자악보[27:27+25]

#첫입력값 전처리

첫입력 = tf.one_hot(첫입력,31)
첫입력 = tf.expand_dims(첫입력, axis=0)# 쉐입 3차원으로 맞춰주기 3차원 배열

from decimal import *
#예측값들의 모음 (예측악보)
music = []
for i in range(200):
    #예측값 뽑기(다음 음 뽑기)
    예측값 = Pmodel.predict(첫입력)#예측값에는 31개의 모든 음의 다음음이 될 확률을 담고있음
    #큰예측값 = np.argmax(예측값[0]) #31개의 확률이 들어있는 리스트에서 최대 확률값만 출력
    #print(예측값)
    
    랜덤예측값 = np.random.choice(숫자악보, 1, p = 예측값[0]) #랜덤성 부여
    

    다음입력값 = 첫입력.numpy()[0][1:]
    music.append(랜덤예측값)
    #원핫인코딩
    one_hot_num = tf.one_hot(랜덤예측값, 31)

    첫입력 = np.vstack([ 다음입력값, one_hot_num.numpy() ])
    첫입력 = tf.expand_dims(첫입력,axis=0)
    

print(music)
exit()
music_text = []
for i in music:
    music_text.append(num_to_text[i])
    
music_text = ''.join(music_text)

print(music_text)