<!-- .slide: class="cover" -->

# 第 三 次社課

## 條件陳述式

資研社｜競程組

---

<!-- .slide: class="concept" -->

## 本次進度

1. 條件判斷
2. if-else
3. 巢狀 if

---

<!-- .slide: class="review" -->

## 複習一下

1. 布林值
2. 型別轉換

---

<!-- .slide: class="exercise" -->

## 題目

### [NLOJ-12](https://nloj.nlhs.tyc.edu.tw/problems/12)


[!image](public/images/nloj-12.png){600, 左 , }

給你 Cheng 的會考數學為 $S$ 分 (最多到小數後兩位)，請問他的數學會拿到什麼標示？<br>

---

<!-- .slide: class="concept" -->

我們該做什麼呢？<br>

> 1. 我們要先輸入一個分數 $S$ (兩位小數)<br>
> 2. 根據分數判斷所屬的級分區間<br>
> 3. 輸出對應的標示<br>

那，我們要怎麼讓程式判斷並執行呢？

---

<!-- .slide: class="concept" -->

## 判斷

有時候，我們會根據某些條件或情況，決定接下來要執行哪些指令<br>

例如剛剛的題目中：<br>

- 如果分數達到標準，就輸出 `A`
- 如果分數沒有達到標準，就輸出其他標示

但是，如果只有 `cin` 和 `cout`，程式只能依照我們寫好的順序執行指令<br>
沒辦法根據不同情況選擇不同的執行內容<br>

所以，我們需要使用**條件判斷**，讓程式能夠根據條件做出選擇<br>

---

<!-- .slide: class="code" -->

## 比較運算子

比較運算式的結果會是一個 `bool`，也就是：<br>
- `true`：條件成立
- `false`：條件不成立

```cpp
int score = 85;
cout << (score >= 60) << " " << (score < 60);
```

例如上面這段程式碼會輸出：`1 0`<br>

> 在 C++ 中，`true` 預設輸出為 `1`，`false` 預設輸出為 `0`

---

<!-- .slide: class="concept" -->

## 比較運算子

有以下幾種比較運算子：<br>

|相等|不相等|大或等於|小或等於|大於|小於|
|-|-|-|-|-|-|
|**==**|**!=**|**>=**|**<=**|**>**|**<**|

使用方式：`運算式A 比較運算子 運算式B` ，結果會是 `bool`<br>

---

<!-- .slide: class="concept" -->

## 邏輯運算子

邏輯運算子：`!`、`&&`、`||`，依序代表取 反 (not)、且 (and)、或 (or)<br>
> `!` 將條件結果反轉；`&&` 兩個條件都成立；`||` 至少一個條件成立<br>

> 假設有 `A` 跟 `B` 兩個運算式<br>

| `A` | `B` | `!A` | `A && B` | <code>A &#124;&#124; B</code> |
|-|-|-|-|-|
|0|0|1|0|0|
|0|1|1|0|1|
|1|0|0|0|1|
|1|1|0|1|1|

---

<!-- .slide: class="concept" -->

## 優先順序

跟數學一樣，C++ 的運算子都有[優先層級](https://en.cppreference.com/cpp/language/operator_precedence)<br>
當然，我們也可以利用括號來改變順序<br>

| 優先順序（高 → 低） | 運算子 | 優先順序（高 → 低） | 運算子 |
|---|---|---|---|
| 1 | `a::b` | 7 | `<<`、`>>` |
| 2 | `a++`、`a--` | 9 | `<`、`<=`、`>`、`>=` |
| 3 | `!` | 10 | `==`、`!=` |
| 5 | `*`、`/`、`%` | 14 | `&&` |
| 6 | `+`、`-` | 15 | <code>&#124;&#124;</code> |



---

<!-- .slide: class="code" -->

## if 條件式

```cpp
if ( 運算式 1 ) {
    程式區塊 1...
} else if ( 運算式 2 ) {
    程式區塊 2...
} else if ( 運算式 3 ) {
.
.
.
} else if ( 運算式 n ){
 區塊 n
} else {
    最終區塊
}
```

---

<!-- .slide: class="concept" -->

## if 條件式

這是基本的 `if-else` 結構，他會從 `運算式 1` 開始<br>
找到第一個成立的運算式後開始執行對應運算式的程式區塊<br>
執行完後跳過剩下的 `else`，並繼續往下執行剩下的程式<br>

並且，`運算式` 都會是 `bool`，所以可以直接填入一個 `bool` 的資料<br>
如果 `運算式` 不是 `bool` 時，C++ 會強制轉換 (型別轉換)<br>

---

<!-- .slide: class="concept" -->

## if 的執行流程

當程式執行到 `if` 時：<br>

1. 先判斷括號內的條件是否成立
2. 如果成立，就執行 `{}` 裡面的程式
3. 如果不成立，就跳過這個區塊
4. 繼續執行剩下的程式

---

<!-- .slide: class="code" -->

## if 的執行流程

```cpp
int score;
cin >> score;

if (score >= 60) {
    cout << "Pass, ";
}
cout << "End";
```

如果輸入一個 `>= 60` 的資料，會輸出 `Pass, End`，否則只會輸出 `End`

> 但是我們想讓 `< 60` 的資料輸出 `Fail, End`，怎麼辦呢

---

<!-- .slide: class="code" -->

## if-else 的執行流程

```cpp
int score;
cin >> score;

if (score >= 60) {
    cout << "Pass";
} else {
    cout << "Fail";
}

cout << ", End";
```

這樣，我們就能得到我們預期的結果了<br>

---

<!-- .slide: class="code" -->

## 小細節-條件順序

有時候，我們會有一些連貫性的判斷，這時候要注意判斷式的先後順序！<br>

```cpp
//A
if (score >= 60) cout << "及格";
else if (score >= 90) cout << "優秀";

// B
if (score >= 90) cout << "優秀";
else if (score >= 60) cout << "及格";
```

> 可以比較一下 A 和 B 的差異

---

<!-- .slide: class="code" -->

## NLOJ-12

所以，NLOJ 第12題 我們只要用很多的 if-else 就能完成了<br>

> 大家自己嘗試看看吧

---

<!-- .slide: class="concept" -->

## 巢狀 if

有時候，我們需要先滿足一個條件，才能進一步判斷其他條件<br>
這時候，就可以在 `if` 裡面再放入另一個 `if`，稱之為 **巢狀 if（Nested if）**<br>

例如：
- 如果今天有空
    - 如果天氣好，就去打球
    - 否則，就待在家
- 沒空的話，就繼續讀書

---

<!-- .slide: class="code" -->

## 巢狀 if 

```cpp
if ( 條件 1 ) {
    if ( 條件 2 ) {
        // 條件 1、條件 2 都成立
    } else {
        // 條件 1 成立，但條件 2 不成立
    }
} else {
    // 條件 1 不成立
}
```

> - 內層的 if 只有在外層條件成立時才會執行
> - 每一層的 else 都會對應到最近且尚未配對的 if

---

<!-- .slide: class="code" -->

## 巢狀 if 

假設我們要判斷一個人是否能參加比賽：

```cpp
int age = 16;
bool registered = true;

if (age >= 15) {
    if (registered) {
        cout << "可以參加比賽";
    } else {
        cout << "尚未報名";
    }
} else {
    cout << "年齡不符合";
}
```

輸出：`可以參加比賽`<br>

---

<!-- .slide: class="exercise" -->

## 題目們

[NLOJ-9](https://nloj.nlhs.tyc.edu.tw/problems/9)<br>
[NLOJ-13](https://nloj.nlhs.tyc.edu.tw/problems/13)<br>

> 不會的可以問喔 :D