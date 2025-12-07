---
title: 컴퓨터 비전 기초 (Computer Vision Basics)
author: AI Roadmap Team
date: 2025-12-07
layout: post
---

컴퓨터 비전은 컴퓨터가 디지털 이미지나 비디오를 이해하고 분석할 수 있게 하는 AI 분야입니다.

## 이미지의 구조

디지털 이미지는 픽셀(pixel)의 배열로 구성됩니다.

- **그레이스케일**: 2D 배열 (높이 × 너비)
- **컬러 이미지**: 3D 배열 (높이 × 너비 × 채널)

## OpenCV 기초

### 이미지 읽기 및 표시

```python
import cv2
import numpy as np

# 이미지 읽기
img = cv2.imread('image.jpg')

# 이미지 크기 확인
height, width, channels = img.shape
print(f"이미지 크기: {width}x{height}, 채널: {channels}")

# 그레이스케일 변환
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# 이미지 저장
cv2.imwrite('gray_image.jpg', gray)
```

### 이미지 처리

```python
# 이미지 리사이즈
resized = cv2.resize(img, (300, 200))

# 이미지 회전
rows, cols = img.shape[:2]
M = cv2.getRotationMatrix2D((cols/2, rows/2), 45, 1)
rotated = cv2.warpAffine(img, M, (cols, rows))

# 블러 처리
blurred = cv2.GaussianBlur(img, (5, 5), 0)
```

## CNN을 활용한 이미지 분류

### PyTorch 예제

```python
import torch
import torch.nn as nn
import torchvision.transforms as transforms

class SimpleCNN(nn.Module):
    def __init__(self):
        super(SimpleCNN, self).__init__()
        self.conv1 = nn.Conv2d(3, 16, kernel_size=3, padding=1)
        self.conv2 = nn.Conv2d(16, 32, kernel_size=3, padding=1)
        self.pool = nn.MaxPool2d(2, 2)
        self.fc1 = nn.Linear(32 * 8 * 8, 128)
        self.fc2 = nn.Linear(128, 10)
        self.relu = nn.ReLU()

    def forward(self, x):
        x = self.pool(self.relu(self.conv1(x)))
        x = self.pool(self.relu(self.conv2(x)))
        x = x.view(-1, 32 * 8 * 8)
        x = self.relu(self.fc1(x))
        x = self.fc2(x)
        return x

# 모델 생성
model = SimpleCNN()
```

## 주요 응용 분야

- **이미지 분류**: 이미지가 어떤 카테고리에 속하는지 판단
- **객체 탐지**: 이미지 내 객체의 위치와 종류 파악
- **이미지 분할**: 픽셀 단위로 영역 구분
- **얼굴 인식**: 얼굴 검출 및 인식
