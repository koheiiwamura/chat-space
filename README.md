# chat-space

## テーブル設計

## *users*
### association 
has_many :user_groups  
has_many :groups, through :user_groups  
has_many :comments  

### *property* 
- name  
- email  
- password  
- password_confirmation

## *user_groups*
### association  
belongs_to [:user, group]  

### property 

- user_id  
-  group_id

## *groups*

### association  
has_many :user_groups  
has_many :users, through :user_groups  
has_many :comments

### property   
- name

## *comments*  
### association  
belongs_to [:user, :group]

### property
 - user_id
 - text
 - group_id

* Ruby version
ruby 2.3.1p112
