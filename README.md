# Todo_List

這個專案主要練習基本 Rails 架構功能，讓我對於操作 Rails 網路開發加深印象
## Model 架構圖
<img src="https://github.com/Minoyo1111/Todo_list/blob/develop/todolist%E9%97%9C%E8%81%AF%E5%9C%96.jpg" width="375">



## 專案內容包括：

+ 可新增自己的任務。
+ 使用者登入後，只能看見自己建立的任務。
+ 可設定任務的開始及結束時間。
+ 可設定任務的優先順序（高、中、低）。
+ 可設定任務目前的狀態（待處理、進行中、已完成）。
+ 可依狀態篩選任務。
+ 可以任務的標題、內容進行搜尋。
+ 可為任務加上分類標籤。
+ 任務列表，並可依優先順序、開始時間及結束時間等進行排序。

## 佈署 HEROKU 步驟
1. 安裝 Heroku： $ Cli brew tap heroku/brew && brew install heroku
2. 終端機登入： $ heroku login
3. 建立 heroku上 的 app 名稱： $ heroku create todo-list-18-bronze
4. 推上 heroku： $ git push heroku master
5. 在 heroku 上建立資料庫： $ heroku run rails db:migrate
6. 導入網站: $ heroku open

## framework 版號
+ gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
+ gem 'pg', '>= 0.18', '< 2.0'
+ gem 'puma', '~> 4.1'
+ gem 'sass-rails', '>= 6'
+ gem 'webpacker', '~> 4.0'
+ gem 'turbolinks', '~> 5'
+ gem 'jbuilder', '~> 2.7'
+ gem 'bootsnap', '~> 1.7', '>= 1.7.2', require: false
+ gem 'rails-i18n', '~> 6.0'
