---
title: 선형 회귀 (Linear Regression)
author: AI Roadmap Team
date: 2025-12-07
layout: post
---

# 선형 회귀 (Linear Regression)

선형 회귀는 가장 기본적인 지도 학습 알고리즘으로, 입력 변수와 출력 변수 간의 선형 관계를 모델링합니다.

## 선형 회귀의 개념

선형 회귀는 독립 변수 X와 종속 변수 y 사이의 관계를 다음과 같은 선형 방정식으로 표현합니다:

```
y = wx + b
```

- **w**: 가중치 (weight)
- **b**: 편향 (bias)

## Python 구현 예제

### scikit-learn 사용

```python
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import numpy as np

# 샘플 데이터 생성
X = np.array([[1], [2], [3], [4], [5]])
y = np.array([2, 4, 6, 8, 10])

# 모델 생성 및 학습
model = LinearRegression()
model.fit(X, y)

# 예측
X_test = np.array([[6], [7]])
predictions = model.predict(X_test)
print(f"Predictions: {predictions}")
```

## 손실 함수 (Loss Function)

선형 회귀는 평균 제곱 오차(MSE)를 손실 함수로 사용합니다:

```
MSE = (1/n) * Σ(y_actual - y_predicted)²
```

## 실전 활용

- 주택 가격 예측
- 매출 예측
- 수요 예측