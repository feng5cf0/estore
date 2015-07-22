/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/7/20 16:35:35                           */
/*==============================================================*/


drop table if exists t_cart;

drop table if exists t_member_info;

drop table if exists t_member;

drop table if exists t_goods;

drop table if exists t_goods_category;

drop table if exists t_money;

drop table if exists t_order;

drop table if exists t_order_goods;

drop table if exists t_post;

drop table if exists t_address;

/*==============================================================*/
/* Table: t_cart                                                */
/*==============================================================*/
create table t_cart
(
   cart_id              integer not null auto_increment,
   member_id            integer,
   goods_id             integer,
   amount               integer,
   price_amount         decimal(7,2),
   is_onsale            integer,
   price_onsale         decimal(7,2),
   is_delete            integer,
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             integer,
   reserve4             timestamp,
   reserve5             timestamp,
   reserve6             integer,
   primary key (cart_id)
);

alter table t_cart comment '购物车';

/*==============================================================*/
/* Table: t_goods                                               */
/*==============================================================*/
create table t_goods
(
   goods_id             integer not null auto_increment,
   goods_name           varchar(50) not null,
   goods_description    varchar(300),
   category_id          integer,
   is_avaliable         integer,
   picture              varchar(200),
   goods_url            varchar(200),
   goods_price          numeric(7,2),
   back_account         integer,
   front_account        integer,
   memo                 varchar(300),
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             integer,
   reserve4             timestamp,
   reserve5             timestamp,
   reserve6             integer,
   primary key (goods_id)
);

alter table t_goods comment '商品表';

/*==============================================================*/
/* Table: t_goods_category                                      */
/*==============================================================*/
create table t_goods_category
(
   category_id          integer not null auto_increment,
   category_name        varchar(30) not null,
   parent_category      integer not null,
   is_avaliable         integer,
   picture              varchar(200),
   memo                 varchar(200),
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             integer,
   reserve4             timestamp,
   reserve5             timestamp,
   reserve6             integer,
   primary key (category_id)
);

alter table t_goods_category comment '商品类别表';

/*==============================================================*/
/* Table: t_member                                              */
/*==============================================================*/
create table t_member
(
   member_id            INTEGER not null auto_increment,
   member_alias         varchar(20) not null,
   member_realname      varchar(50),
   member_type          varchar(50),
   member_password      numeric(50) not null,
   integral             decimal(10,2),
   avaliable            integer,
   is_email_avaliable   integer,
   last_login_time      timestamp,
   last_login_ip        varchar(64),
   create_time          timestamp,
   last_modify_time     timestamp,
   login_time           timestamp,
   login_ip             varchar(64),
   memo                 varchar(300),
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             timestamp,
   reserve4             timestamp,
   reserve5             integer,
   reserve6             integer,
   primary key (member_id)
);

alter table t_member comment '会员表';

/*==============================================================*/
/* Table: t_member_info                                         */
/*==============================================================*/
create table t_member_info
(
   member_id            INTEGER not null auto_increment,
   mobile_phone         varchar(20),
   telephone            varchar(20),
   email                varchar(50),
   photo                blob,
   sex                  integer,
   birthday             timestamp,
   location             varchar(100),
   memo                 varchar(300),
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             integer,
   reserve4             timestamp,
   reserve5             timestamp,
   reserve6             integer,
   primary key (member_id)
);

alter table t_member_info comment '会员表详细信息表';

/*==============================================================*/
/* Table: t_money                                               */
/*==============================================================*/
create table t_money
(
   money_id             integer not null auto_increment,
   money_name           varchar(50),
   rate                 decimal(5,2),
   memo                 varchar(200),
   primary key (money_id)
);

alter table t_money comment '多货币支持';

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   order_id             integer not null auto_increment,
   会员ID                 integer not null,
   price_amount         decimal(7,2),
   is_onsale            integer,
   price_onsale         decimal(7,2),
   money_type           integer,
   pay_money            decimal(7,2),
   address              varchar(100),
   create_time          timestamp,
   send_time            timestamp,
   send_type            integer,
   transfor_fee         decimal(7,2),
   status               integer,
   pay_pic              blob,
   send_pic             blob,
   handler_id           integer,
   memo                 varchar(300),
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             integer,
   reserve4             timestamp,
   reserve5             timestamp,
   reserve6             integer,
   primary key (order_id)
);

alter table t_order comment '订单表';

/*==============================================================*/
/* Table: t_order_goods                                         */
/*==============================================================*/
create table t_order_goods
(
   order_id             integer not null auto_increment,
   goods_id             integer not null,
   goods_amount         integer,
   price_one            decimal(7,2),
   price_all            decimal(7,2),
   money_type           integer,
   pay_money            decimal(7,2),
   reserve1             varchar(50),
   reserve2             varchar(50),
   reserve3             integer,
   reserve4             timestamp,
   reserve5             timestamp,
   reserve6             integer,
   primary key (order_id, goods_id)
);

alter table t_order_goods comment '订单关联商品表';

/*==============================================================*/
/* Table: t_post                                                */
/*==============================================================*/
create table t_post
(
   post_id              integer not null auto_increment,
   post_name            varchar(50),
   primary key (post_id)
);

alter table t_post comment '快递方式';

/*==============================================================*/
/* Table: 收货地址                                                  */
/*==============================================================*/
create table t_address
(
   address_id           integer not null auto_increment,
   member_id            integer,
   address              varchar(100),
   postcode             varchar(10),
   linkman_name         varchar(50),
   linkman_phone        varchar(20),
   is_avaliable         integer,
   memo                 varchar(30),
   primary key (address_id)
);
alter table t_address comment '送货地址';

alter table t_cart add constraint FK_Reference_4 foreign key (goods_id)
      references t_goods (goods_id) on delete restrict on update restrict;

alter table t_goods add constraint FK_Reference_2 foreign key (category_id)
      references t_goods_category (category_id) on delete restrict on update restrict;

alter table t_member_info add constraint FK_Reference_1 foreign key (member_id)
      references t_member (member_id) on delete restrict on update restrict;

alter table t_cart add constraint FK_Reference_3 foreign key (member_id)
      references t_member (member_id) on delete restrict on update restrict;
