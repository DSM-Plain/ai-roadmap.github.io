---
title: 텍스트 전처리 (Text Preprocessing)
author: AI Roadmap Team
date: 2025-12-07
layout: post
---

자연어 처리(NLP)의 첫 단계는 텍스트 데이터를 모델이 이해할 수 있는 형태로 변환하는 것입니다.

## 주요 전처리 단계

### 1. 토큰화 (Tokenization)

텍스트를 단어나 문장 단위로 분리합니다.

```python
from nltk.tokenize import word_tokenize, sent_tokenize

text = "자연어 처리는 재미있습니다. AI는 놀랍습니다."

# 문장 토큰화
sentences = sent_tokenize(text)
print(sentences)

# 단어 토큰화
words = word_tokenize(text)
print(words)
```

### 2. 불용어 제거 (Stopword Removal)

의미가 적은 단어들을 제거합니다.

```python
from nltk.corpus import stopwords

stop_words = set(stopwords.words('korean'))
filtered_words = [w for w in words if w not in stop_words]
```

### 3. 정규화 (Normalization)

#### 소문자 변환
```python
text_lower = text.lower()
```

#### 어간 추출 (Stemming)
```python
from nltk.stem import PorterStemmer

stemmer = PorterStemmer()
stemmed = [stemmer.stem(word) for word in words]
```

## 한국어 전처리

### KoNLPy 사용

```python
from konlpy.tag import Okt

okt = Okt()

text = "자연어 처리는 인공지능의 핵심 분야입니다."

# 형태소 분석
morphs = okt.morphs(text)
print(f"형태소: {morphs}")

# 명사 추출
nouns = okt.nouns(text)
print(f"명사: {nouns}")

# 품사 태깅
pos = okt.pos(text)
print(f"품사: {pos}")
```

## 벡터화 (Vectorization)

### TF-IDF
```python
from sklearn.feature_extraction.text import TfidfVectorizer

corpus = [
    "인공지능은 미래 기술입니다",
    "머신러닝은 인공지능의 하위 분야입니다",
    "딥러닝은 머신러닝의 발전된 형태입니다"
]

vectorizer = TfidfVectorizer()
tfidf_matrix = vectorizer.fit_transform(corpus)
print(tfidf_matrix.toarray())
```
