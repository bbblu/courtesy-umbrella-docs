# 系統簡介

---

**組&emsp;&emsp;別：第 109409 組**  
**專題名稱：愛心傘租借系統**  
**指導教授：林宏仁 老師**  
**專題學生：10646003 黃峻彥 10646006 詹壹婷 10646007 李恩瑋 10646016 吳宇量**

---

### 一、前言
近年來的科技蓬勃發展，人手一支的智慧型手機，改變了整個世界的運作方式，同時也讓人們幾乎不受限地快速輕鬆的獲取資訊；我們可以迅速知道今天的新聞有哪些、上班上學路上的交通狀況、火車的到站時間，以及天氣預報等資訊，來幫助我們做出行程的安排和準備。

但計畫總是趕不上變化，即使做好再周全的安排，一旦出現自身無法控制的紕漏，或者一個環節出現失誤，就可能打亂整個行程。每個人都應該有過類似的經歷，像是到了車站才發現嚴重誤點，或者因為車禍而造成的道路堵塞；在各種出乎意料的狀況中，最常遇到的應該就屬下雨。

氣象預報並非100%的準確，也不是每個人都有那個空間或者習慣去攜帶摺疊式的雨傘，如果出門在外遇到一場突如其來的雨，大部分的人會選擇乾脆淋雨，或者在附近的便利商店買一把最便宜的傘。

可那種便利商店的傘，商品的定位上就屬於應急用，耐用性絕對不算高，經常風稍微大些、使用次數多了些，便出現損壞。再者，即使它足夠耐用，沒有帶傘習慣的人，下次還是可能遇到同樣的情況，而又陷入同樣的問題之中。

但雨傘的單價並不高，且毀損導致無法使用的概率相較其他常見的共享經濟更高，再加上傘本身會在非週期的短時間內出現大量需求，所以如何針對此種類的物品做出對應的機制，以控制商品的歸還率和損壞率，以及成功做到因應地點時間天氣狀況對站台的總數和傘的個數做出控制，將會是值得思考研究的問題。

### 二、系統功能簡介
透過手機APP能夠借取放在站台內的雨傘，經由伺服器儲存資料，實現A處借B處還的功能，並且蒐集使用者的反饋內容和借還資料，做出對應的處置，調節站台位置和數量。並對借還傘間隔時間過大的使用者作出推播提示歸還雨傘。

### 三、系統使用對象
- 民眾：使用APP掃描站台借取和歸還雨傘，並能回報問題和接收通知
- 管理者：使用伺服器端檢視站點剩餘傘數和空站台數，並管理使用者名單以及檢視使用者資料以及使用者借還傘記錄

### 四、系統特色

#### 一. 改變人們的生活方式
出門不再需要帶傘，甚至不需要看天氣預報。一但下雨就走到最近的站點，快速的借取一把傘，安全乾爽的到達目的地之後也不用再占著一隻手拿著雨傘，或者煩惱著濕漉漉的折疊傘無法收進包包，只要將傘歸還，就能輕輕鬆鬆地繼續接下來的行程。若忘記帶傘時偏偏遇上大雨，不需要花冤枉錢再去買一把只會使用一次的雨傘，或者繞道到幾乎不會有東西的愛心傘桶碰運氣，只要手機拿出來，簡單的操作，快速的借取一把雨傘後就能慢慢的走回家。

#### 二. 使用大數據分析調查並滿足客戶需求
透過資料蒐集，觀察哪些站點的租借率或哪些區域傘的流動率特別高，彈性的調整站點的傘的總數，並調查歸還率較低的站點，做出適當的處置。並且在一定的前提下，增加或者減少一個站點內擁有的雨傘數量，減少人力補充所耗費的成本或者物品閒置的成本。

### 五、系統開發工具
| 項目 | 使用工具 |
| -------- | -------- |
| 編輯器 | IntelliJ IDEA, Android Studio, XCode |
| 資料庫管理工具 | MySQL Workbench, DataGrip |
| 版本控制工具 | Git |
| API測試工具 | Postman |
| API文件 | Swagger |
| 文件製作 | Microsoft Word 2019 |
| 簡報製作 | Microsoft PowerPoint 2019 |
| UML工具 | Visual Paradigm for UML 7.2 Enterprise Edition |
| 雛形設計 | Adobe XD |
| 製圖工具 | Adobe Photoshop, Adobe Illustrator |
| 溝通工具 | LINE, Telegram |
| 版本控管 | GitHub |
| 剪輯軟體 | Adobe Premiere Pro |

### 六、系統使用環境
手機端: Android 4.1或以上、iOS 8.0或以上
伺服器端: Windows Server 2012 R2 Datacenter
網頁端: Chrome, Firefox, IE8 等或更高版本瀏覽器

### 七、結論及未來發展
i心傘希望能夠改變人們的生活方式，讓人們出門不用再觀看氣象預報也不需要隨身攜帶雨傘。未來希望和硬體方面的專家合作解決硬體的限制，並嘗試回收二手雨傘，讓尚可使用但被回收或者遺忘的無主雨傘加進系統的傘循環，促進環保並減少傘的浪費