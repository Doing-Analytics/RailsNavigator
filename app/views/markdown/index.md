# Active Record Query Interface
## 了解Rails中的Active Record查詢接口
See my [About](/about/) page for details.   

<p>
如果你習慣使用原生SQL查詢數據庫記錄，那麼你通常會發現在Rails中有更好的方法執行相同的操作。Active Record可以在大多數數據庫系統上為您執行查詢，包括MySQL，MariaDB，PostgreSQL和SQLite。無論您使用哪種數據庫系統，Active Record方法的格式始終相同。
</p>
__本指南__的範例會涉及以下一個或多個模型


|表頭|表頭| 
| ---- | ---- | 
|單元格|單元格| |單元格|單元格|  
[foo]: http://example.com/  "Optional Title Here"

```ruby
class Author < ApplicationRecord
  has_many :books, -> { order(year_published: :desc) }
end
```

```ruby
class Book < ApplicationRecord
  belongs_to :supplier
  belongs_to :author
  has_many :reviews
  has_and_belongs_to_many :orders, join_table: 'books_orders'

  scope :in_print, -> { where(out_of_print: false) }
  scope :out_of_print, -> { where(out_of_print: true) }
end
```

<div class="footer">
    &copy; Ted x Ning 
</div>