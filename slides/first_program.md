<!-- .slide: class="cover" -->

# 第 三 次社課

## 第一支程式

資研社｜競程組

---

<!-- .slide: class="concept" -->

## 本次進度

- 第一支程式
- 輸入與輸出
- 跳脫字元

---

<!-- .slide: class="concept" -->

## Code::blocks

桌面上應該會有一個軟體叫做 Code::Blocks<br>
打開他<br>

然後點左上角 `File` > `New` > `Project`<br>
選擇 `Console application（主控台應用程式）`然後點 `Go`<br>
依序選擇 `Next` > `C++` > `Next`<br>

`Project title` 輸入你想要的名稱，點 `...` 找到並點選 `桌面`<br>
最後按下 `Next` 就成功建立一個專案了<br>

> 如果去考 APCS，檔案要存在 backup，不然可能會出事

---

<!-- .slide: class="concept" -->

## NLOJ

大家先打開 [NLOJ](https://nloj.nlhs.tyc.edu.tw/) <br>
然後登入(註冊)帳號

未來多多少少會需要大家來這裡練習<br>
除了nloj，可能還會有其他網站，需要ㄉ時候再說吧 :D<br>

---

<!-- .slide: class="exercise" -->

## 題目

### [NLOJ-01](https://nloj.nlhs.tyc.edu.tw/problems/1)

為了慶祝 NLOJ 成功架設，$Cheng$ 想要叫你寫一個<br>
可以輸出 `"Hello, NLOJ!"`(不包含 "") 的程式，你能幫助他嗎？

---

<!-- .slide: class="code" -->

## 輸入輸出

實做出來會長這樣：<br>
```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "Hello, NLOJ!" << "\n";
    return 0;
}
``` 

---

<!-- .slide: class="concept" -->

## 輸入輸出

好複雜，Python 好簡單qq<br>
先來分段理解程式吧<br>

---

<!-- .slide: class="concept" -->

## 匯入函式庫

```cpp
#include <iostream>
```

`#include` 是指將特定函式庫匯入

`<iostream>` 是標準輸入輸出流<br>
- 當然可有其他的函式庫<br>
  按照需要的情況使用<br>

> 打競程如果記憶體夠可以直接匯入 `<bits/stdc++.h>`

---

<!-- .slide: class="concept" -->

## std::