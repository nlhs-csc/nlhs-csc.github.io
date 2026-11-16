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

> 打競程如果記憶體夠可以直接匯入 `<bits/stdc++.h>`<br>

---

<!-- .slide: class="concept" -->

## 使用 std 命名空間

```cpp
using namespace std;
```
這行程式碼讓我們可以直接使用 `std` 命名空間中的名稱，而不用每次都加上 `std::`<br>

### 那 `std::` 是做什麼的呢？<br>

可以把函式庫想像成倉庫，我們要使用函式就要呼叫函式庫裡的東西<br>
但是直接寫我們要的東西，C++ 會找不到他在哪<br>
這時候就邀跟他說這個倉庫的名稱，也就是 `std` (`標準函式庫`)<br>
`::` 是範圍解析運算子，用來指定我們要使用哪個範圍中的名稱

---

<!-- .slide: class="concept" -->

## 輸入輸出

##### 我們先跳過 `int main() {}`，先說輸入輸出<br>
`std::cout` 是 C++ 中用來輸出的工具，他屬於 `std` 的 `<iostream>`

```cpp
cout << "Hello Wordl!";
```
這段程式碼就會在螢幕上輸出： `HelloWordl!` 

---

<!-- .slide: class="concept" -->

## 輸入輸出

`cout` 由 `c` 和 `out` 組成，同理輸入就會是 `c` 和 `in` 組合

```cpp
cin >> s;
```
這段程式碼就把輸入的東西給 `s`<br>
然後記住箭頭方向，很重要，等等會用到<br>

---

<!-- .slide: class="concept" -->

## 輸入輸出運算子

還記的剛剛的箭頭嗎
```cpp
cout << "HelloWorld!";
```

在 C++ 中，當我們要輸出東西的時候，我們會在 `cout` 後面接上 `<<`<br>
這個 `<<` 就是「輸出運算子」，會把東西往左傳遞<br>
所以這段程式碼就是將 `"HelloWorld!"` 往左邊傳給 `cout` 讓他輸出<br>

同樣的， `>>` 就是把 `cin` 讀取到的東西往右邊依序傳給每個 *變數<br>

---

<!-- .slide: class="concept" -->

## 連續輸出

那如果我們有很多東西要一次輸出呢？<br>
很簡單，用很多的 `<<` 把東西串起來就好了<br>

```cpp
cout << "Hello" << "World" << "!";
```

輸出的結果依然會是 `"HelloWorld!"`當然也可以分開寫：<br>

```cpp
cout << "Hello";
cout << "World";
```

> **注意：輸出不會自動換行！**

---

<!-- .slide: class="concept" -->

## 連續輸入

同樣的，很多東西要輸入，用很多的 `>>` 把東西接起來就好了<br>
```cpp
int a, b, c;
cin >> a >> b >> c;
```
當輸入 `1 2 3` 時<br>

則 `a = 1`, `b = 2`, `c = 3` <br>

> **注意：輸入會從第一個開始存資料！**

---

<!-- .slide: class="concept" -->

## 換行 & 跳脫自元

如果學過 C++，或許聽過
```cpp
cout << "HelloWorld!" << endl;
```
`endl` 充當了換行的任務，不過 `endl` 本身還會執行 `flash`，所以會消耗更多時間<br>
如果只想要單獨輸出換行，可以使用 `\n`<br>

```cpp
cout << "HelloWorld!" << '\n';
```

---

<!-- .slide: class="concept" -->

## 跳脫字元（Escape Characters）

眼尖的你一定注意到了，換行是由 `\`(反斜杠) 和 `n` 組成<br>
這個 `\` 就是所謂的跳脫字元，而 `n` 是「代號」，代表著換行的操作<br>
不同的「代號」有不一樣的功能，常見的有：<br>

| 字元 | 意義 |
|---|---|
| `\n` | 換行 |
| `\t` | Tab |
| `\'` | 雙引號 |
| `\"` | 雙引號 |
| `\\` | 反斜線 |

---

<!-- .slide: class="concept" -->

## 跳脫字元（Escape Characters）

引號 `\'`、`\"`？反斜線 `\\`？ 為什麼是這樣表示？<br>
原因是 `\` 會被解讀成「跳脫字元」而不是單純的「反斜線」<br>
所以需要多使用一個 `\` 來表示反斜線 `\\`<br>

同樣的，因為引號本身會被當作字元/字串的引號<br>
所以需要多使用一個 `\` 來區分要當作文字的引號還是字元/字串的引號<br>

```cpp
cout << '\" \' \\ \' \"';
```

> 執行結果：`" ' \ ' "`<br>

---

<!-- .slide: class="exercise" -->

## 題目

### [NLOJ-04](https://nloj.nlhs.tyc.edu.tw/problems/4)

Cheng 今天在魔法書上面看到一串魔法咒語 `/'\\*"owo"*//'\`<br>
Cheng 想要叫你把他輸出出來！

> 各位試試看吧

---

<!-- .slide: class="code" -->

## 題解

這題你會發現，有很多沒辦法直接輸出的符號<br>
要輸出的話很簡單，在前面放上 `\(跳脫字元)` 就可以了<br>

```cpp
#include <iostream>
using namespace std;

int main() {
    cout << "/\'\\\\*\"owo\"*//\'\\";
}
```

---

<!-- .slide: class="exercise" -->

## 題目

### [NLOJ-02](https://nloj.nlhs.tyc.edu.tw/problems/2)

如題，給你兩數值 $a ,\ b$，請你求出 $a + b$ 的值<br>
如果在這題只拿到 $30$ 分，Cheng 說請去面壁(X

> 注意一下題目給的範圍喔

---

<!-- .slide: class="review" -->

## 複習 — 資料型別

還記的那時候說過，當一個整數太大，他就不能用 `int` 儲存嗎<br>
多大呢？ `int` $\in [-2^{31} ,\ 2^{31} -1]$，大約是 $\pm 2.147 \times 10^9$<br>

但是如果 $a = 2^{31} -1$ 且 $b = 2^{31} -1$ 時<br>
$a + b = 2 \times (2^{31} -1) = 2^{32} - 2 \gt 2^{31} -1$<br>
所以我們不能用 `int` 儲存<br>

當資料太大 `int` 無法儲存的時候，我們可以使用 `long long`<br>
`long long` 的範圍 $\in [-2^{63} ,\ 2^{63} -1]$，大約是 $\pm 9.223 \times 10^{18}$<br>

---

<!-- .slide: class="code" -->

## 題解

```cpp
#include <iostream>
using namespace std;

int main() {
    long long a, b;
    cin >> a >> b;
    cout << (a + b) << "\n";
}
```

---

<!-- .slide: class="concept" -->

## I/O 優化

當今天有大量的東西需要輸入輸出的時候<br>
可以使用輸入輸出優化來避免 TLE (Time Limit Exceeded)<br>

```cpp
#include <bits/stdc++.h>

int main() {
    // 關閉同步 C 語言的 stdio
    std::ios::sync_with_stdio(false);

    // 解除綁定 flash
    std::cin.tie(nullptr);
}
```