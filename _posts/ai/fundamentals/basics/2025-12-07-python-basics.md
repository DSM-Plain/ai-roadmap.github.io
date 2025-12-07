---
title: AI를 위한 Python 기초
author: AI Roadmap Team
date: 2025-12-07
layout: post
---

Python은 AI 개발에 가장 널리 사용되는 프로그래밍 언어입니다.

## Python이 AI에 적합한 이유

1. **풍부한 라이브러리**: NumPy, Pandas, TensorFlow, PyTorch 등
2. **간결한 문법**: 빠른 프로토타이핑 가능
3. **활발한 커뮤니티**: 방대한 자료와 지원

## 필수 Python 라이브러리

### NumPy
수치 계산을 위한 기본 라이브러리

```python
import numpy as np

# 배열 생성
arr = np.array([1, 2, 3, 4, 5])
print(arr.mean())  # 평균 계산
```

### Pandas
데이터 분석을 위한 라이브러리

```python
import pandas as pd

# 데이터프레임 생성
df = pd.DataFrame({
    'name': ['Alice', 'Bob', 'Charlie'],
    'age': [25, 30, 35]
})
print(df.head())
```

## 실습 예제

```python
# 간단한 데이터 처리 예제
import numpy as np
import pandas as pd

# 데이터 생성
data = np.random.randn(100, 3)
df = pd.DataFrame(data, columns=['Feature1', 'Feature2', 'Feature3'])

# 기본 통계 확인
print(df.describe())
```