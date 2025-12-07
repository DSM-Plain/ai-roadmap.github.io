---
title: 신경망 입문 (Neural Networks Introduction)
author: AI Roadmap Team
date: 2025-12-07
layout: post
---

# 신경망 입문 (Neural Networks Introduction)

신경망은 인간의 뇌 구조에서 영감을 받은 머신러닝 모델입니다.

## 신경망의 구조

### 기본 구성 요소

1. **입력층 (Input Layer)**: 데이터를 받아들이는 층
2. **은닉층 (Hidden Layer)**: 특징을 추출하고 학습하는 층
3. **출력층 (Output Layer)**: 최종 결과를 출력하는 층

## 퍼셉트론 (Perceptron)

가장 간단한 형태의 신경망 단위입니다.

```python
import numpy as np

class Perceptron:
    def __init__(self, input_size, learning_rate=0.01):
        self.weights = np.random.randn(input_size)
        self.bias = 0
        self.lr = learning_rate

    def predict(self, x):
        activation = np.dot(x, self.weights) + self.bias
        return 1 if activation >= 0 else 0

    def train(self, X, y, epochs=100):
        for _ in range(epochs):
            for xi, yi in zip(X, y):
                prediction = self.predict(xi)
                error = yi - prediction
                self.weights += self.lr * error * xi
                self.bias += self.lr * error
```

## 활성화 함수 (Activation Functions)

### ReLU (Rectified Linear Unit)
```python
def relu(x):
    return np.maximum(0, x)
```

### Sigmoid
```python
def sigmoid(x):
    return 1 / (1 + np.exp(-x))
```

## PyTorch 예제

```python
import torch
import torch.nn as nn

class SimpleNN(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(SimpleNN, self).__init__()
        self.layer1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.layer2 = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        x = self.layer1(x)
        x = self.relu(x)
        x = self.layer2(x)
        return x

# 모델 생성
model = SimpleNN(input_size=10, hidden_size=20, output_size=2)
```
