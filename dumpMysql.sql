create table cities
(
    id         bigint unsigned auto_increment
        primary key,
    created_at timestamp    null,
    updated_at timestamp    null,
    name       varchar(255) not null,
    name_ru    varchar(255) not null
)
    collate = utf8mb4_unicode_ci;

create table failed_jobs
(
    id         bigint unsigned auto_increment
        primary key,
    uuid       varchar(255)                        not null,
    connection text                                not null,
    queue      text                                not null,
    payload    longtext                            not null,
    exception  longtext                            not null,
    failed_at  timestamp default CURRENT_TIMESTAMP not null,
    constraint failed_jobs_uuid_unique
        unique (uuid)
)
    collate = utf8mb4_unicode_ci;

create table migrations
(
    id        int unsigned auto_increment
        primary key,
    migration varchar(255) not null,
    batch     int          not null
)
    collate = utf8mb4_unicode_ci;

create table news
(
    id          bigint unsigned auto_increment
        primary key,
    created_at  timestamp    null,
    updated_at  timestamp    null,
    title       varchar(255) not null,
    poster      varchar(255) not null,
    description varchar(255) not null,
    content     text         not null
)
    collate = utf8mb4_unicode_ci;

create table city_news
(
    id      bigint unsigned auto_increment
        primary key,
    city_id bigint unsigned not null,
    news_id bigint unsigned not null,
    constraint cities_news_city_id_foreign
        foreign key (city_id) references cities (id),
    constraint cities_news_news_id_foreign
        foreign key (news_id) references news (id)
)
    collate = utf8mb4_unicode_ci;

create table password_resets
(
    email      varchar(255) not null,
    token      varchar(255) not null,
    created_at timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index password_resets_email_index
    on password_resets (email);

create table personal_access_tokens
(
    id             bigint unsigned auto_increment
        primary key,
    tokenable_type varchar(255)    not null,
    tokenable_id   bigint unsigned not null,
    name           varchar(255)    not null,
    token          varchar(64)     not null,
    abilities      text            null,
    last_used_at   timestamp       null,
    created_at     timestamp       null,
    updated_at     timestamp       null,
    constraint personal_access_tokens_token_unique
        unique (token)
)
    collate = utf8mb4_unicode_ci;

create index personal_access_tokens_tokenable_type_tokenable_id_index
    on personal_access_tokens (tokenable_type, tokenable_id);

create table users
(
    id                bigint unsigned auto_increment
        primary key,
    name              varchar(255) not null,
    email             varchar(255) not null,
    email_verified_at timestamp    null,
    password          varchar(255) not null,
    remember_token    varchar(100) null,
    created_at        timestamp    null,
    updated_at        timestamp    null,
    constraint users_email_unique
        unique (email)
)
    collate = utf8mb4_unicode_ci;

create table news_user
(
    id      bigint unsigned auto_increment
        primary key,
    user_id bigint unsigned not null,
    news_id bigint unsigned not null,
    constraint users_news_news_id_foreign
        foreign key (news_id) references news (id),
    constraint users_news_user_id_foreign
        foreign key (user_id) references users (id)
)
    collate = utf8mb4_unicode_ci;


UPDATE for_test.cities SET created_at = '2022-01-15 20:20:19', updated_at = '2022-01-15 20:20:20', name = 'moscow', name_ru = '????????????' WHERE id = 1;
UPDATE for_test.cities SET created_at = '2022-01-15 21:22:10', updated_at = '2022-01-15 21:22:08', name = 'yekaterinburg', name_ru = '????????????????????????' WHERE id = 2;
UPDATE for_test.migrations SET migration = '2014_10_12_000000_create_users_table', batch = 1 WHERE id = 1;
UPDATE for_test.migrations SET migration = '2014_10_12_100000_create_password_resets_table', batch = 1 WHERE id = 2;
UPDATE for_test.migrations SET migration = '2019_08_19_000000_create_failed_jobs_table', batch = 1 WHERE id = 3;
UPDATE for_test.migrations SET migration = '2019_12_14_000001_create_personal_access_tokens_table', batch = 1 WHERE id = 4;
UPDATE for_test.migrations SET migration = '2022_01_15_110214_create_news_table', batch = 1 WHERE id = 5;
UPDATE for_test.migrations SET migration = '2022_01_15_150411_create_cities_table', batch = 1 WHERE id = 6;
UPDATE for_test.migrations SET migration = '2022_01_15_150939_create_cities_news_table', batch = 1 WHERE id = 7;
UPDATE for_test.migrations SET migration = '2022_01_15_195231_update_news_table', batch = 2 WHERE id = 8;
UPDATE for_test.migrations SET migration = '2022_01_15_195758_create_users_news_table', batch = 3 WHERE id = 9;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '?????????????? ???????????? ???????????? ?????? ???????????????????? ???????????????? ????????????????', poster = '/storage/news/1.webp', description = '???????????????????? ?????????????????????? ????????????, ?? ?????????????? ???????????????????? ???????????????? ???????????????????? ???????????????? ??????????????????, ???????????????? "??????????????????".', content = '?????????? ?????????????? ???????????????? ???????????????????? ?????????????? ???????????????????? ????????????-????????????, ???????????????? ?????????? ???? ???????????? ??????????????????. ?? ??????????????????, ?????????????????????? ?????????? ???????????????????????? ????????????, ????????????????????????, ????????????????, ?????????????? ?????????????? ?? ???????????? ?????? ????????????????, ?????? ???? ???????? ????????????????????, ???????? ???????????? ?? ???????????????????????? ?????? ??????????????. ?????????? ???? ???????????? ???????????? ???????? ???????????????????? ?? ????????????, ???????? ?????????????? ???????????????????????? ??????????????????????, ???????????????????? ?????????????? ??????????????, ?????? ?????????? ???????? ?? ??????????????????, ?????????????????????? ???????????? ???? ???????????????????????? ???????????????????? ?? ????????????????, ?? ?????????? ?????????????? ???????????? ?? ???????????? ??????????????????????.
???????????? ?????????? ???????? ???????????? ?????????????? ??? ?? ???????????? ?? ?????????????????????????????? ?????????????? ????????, ?????? ????????????, ?????? ?????????? ????????????????????????, ?????????????? ?????? ???????????? ?? ???? ???????????????? ???????????????????????? ??????????????????.
?? ????????????, ???????????????? ???????????? ??????????, ???????????????? ?????????? ?????????? ?????????????? ?????????????? ?????? ????????????????. ?? ??????, ?????????????????????? ???? ?????????????? ??????????, ?????? ?????????????? ???? ???????????????????????? ???????????????????? ????????????????????????, ???????????? ???? ?????????????? ???????????????????????????????? ???? "??????????????????????????" ???????????????????? ?????????????? ?????????? ?????????????? ?????? ????????????????.
?????????? ?? ???????????????? ?????????????????????????????? 20 ??????????????. ???????????? ?????????? ?????? ???????????????????????? ??????????????, ???????????????? 13-?? ??????????, ?? ??????????-?????????????????????? (???? ??? ???? 17-??).' WHERE id = 1;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '?????????????? ?????????????? ???????????? ????????????, ???????? ???????? ???????????? ?????????????? ?????????????? ??????????', poster = '/storage/news/2.webp', description = '?????????????????? ?????????????? ?????????????? ?? ?????????????????????? ?????????????????? ?????????????? ??????????????-???????????????????????? ????????????', content = '???????????????? ?????????????????????????? ?????????????????? ?????????????? ?? ???????????????? ?? 1 ???????????????? ???? 30 ????????????.
????????????????????, ?????? ???????????????? ???????????????????????????? ?? ??????????????????, ?????????????? ?????? ???????? ???? ???????????? ???????????????????? ?????????????? ???????????????????? 4 896 ???????????? ???? ?????????? ?? ???????? ??????????????. ?????????? ?? ???????????? ???? ???????? ?????????? ???????????? ?????????????????????? ????????????-????-????????: ???????????????? ?? ???????? ?????????? ?????????????????? ?? ?????????????? ?? 4 983 ??????????.
???????????????? ???????????? ?????????????? ?????????????????????????????? ?????????? ??????????????-???????????????????????? ????????????, ?????????? ???? ???????????? ???????????????????? ?????????????? ?? ?????????????? ???????????????????? ?????????????????? ?????????? ?? ?????????????? 5 275 ????????????. ???? ?????????????????? ?????????? ?????????????? ???? ?????????????? ?????????? ???????????????? ?? 5 324 ??????????.
??????????-?????????????????? ?? ???????????? ???????????? ?? ???????? ???????????????? ?????????? ?? ???????????? ??????????. ?????????????? ???????? ???? ?????????????????????? ?? ?????? ???????????? ?????????????????? ???? ???????????? 5 541 ?? 5 546 ???????????? ????????????????????????????. ?? ?????????????? ?????????? ?????????? ??????, ??????????, ???????????? ?? ????????????????????????.' WHERE id = 2;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '?? ?????????????????????????? ?????????????? ?????????? ?????????????????? ?????????????????????????????? ??????????????????????', poster = '/storage/news/3.jpg', description = '?????????????????? ???????????????????? ?????????????????? ??????????, ?????????????????????????????? ???????????????????????? ?????????????????????? ?? ???????????????????????? ?????????????? ???????????? ?????????????? ?????????????? ???? 100+ Forum Russia, ?????????????? ?????????????? ?? 5 ???? 7 ?????????????? ?? ??????????????????????????, ?????????????????? ?? ?????????????????? ?????????????????????????? ????????????.', content = '?????????????????? ???????????????????? ?????????????????? ??????????, ?????????????????????????????? ???????????????????????? ?????????????????????? ?? ???????????????????????? ?????????????? ???????????? ?????????????? ?????????????? ???? 100+ Forum Russia, ?????????????? ?????????????? ?? 5 ???? 7 ?????????????? ?? ??????????????????????????, ?????????????????? ?? ?????????????????? ?????????????????????????? ????????????.
???????????? ????????????. ????????????????????????
1 ???????????? 2018, 11:35
?? ?????????????????????????? ?????????????? ?????????????????????? ?????????????????? ?????????????????? ????????????????????
?????????????????? ?????????????????????? ???????????? ?? ???????? ?????????????? V ?????????????????????????? ???????????? ?????????????????? ?? ?????????????????????? ?????????????????????????? 100+ Forum Russia ?? ?????????????????????????? ?????????????? ?????????????????? ?????????????????? ????????????????????, ?????????????????? ?? ?????????????????? ?????????????????????????? ????????????.
"?????? ???????????? ???????? ???????????????? ?????????? ????????????, ?????????? ???????????? ???????? ???????? ???????????????? ????????????????????, ?????? ?????????????????????? ???????????????????? ???????????????????????? ???????????????????????? ??????????????, ?????? ???????????????????????? ?????????????????? ????????????????????????, ?????????????? ???????????????? ?????????????????????????? ?? ???????????????? ???????????? ??? ???? ?????? ?????????????? ?????????????? ???????? ??????????????", ??? ???????????????????? ?? ???????????????????? ?????????? ???????????????????????? ?????????????? ???????????? ?????????????????????? ???????????? ???????? ????????????.
??????, ????????????????, ???????????????? ???????????? ???????? ???? ?????????????????????????? ?????????? ???????????? ???? ????????????. ???? ?????????????????? ?? ???????????????????????? ?????????????????????? ?? ???????????????????? ??????????????. ???????????????????? ?????????????????? ???? ?????????????????????????????? ?????????????? ???????????? ?????????????? ?? ???????????? ???????????? "???????????????????? ?????????????????? ??????????. ?????????? ????????????". ???????????? ???????????????? ???????????????? ???????????????????????? ?????????????????????? ?? ???????????? ?? ???????????? ?????????????????? ???????????????????????? ???????? Wowhaus ???????? ????????????.
?????????? ?????????????????? ?? ?????????????????????? ?????????????????????????? 100+ Forum Russia ???????????????????? ???????????????? ?? ??????????????????????????. ?? 2018 ???????? ???? ???????????? ?????????????????? ?????????? 10 ?????????? ?????????????????????? ???? ?????????? ????????.' WHERE id = 3;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 1', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 4;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 2', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 5;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 3', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 6;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 4', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 7;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 4', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 8;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '?????????????? ?????? ???????????? 1', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 9;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 5', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 10;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 6', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 11;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 7', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 12;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 8', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 13;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 9', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 14;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 10', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 15;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????????? ???????????? 11', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 16;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????? 12', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 17;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????? 13', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 18;
UPDATE for_test.news SET created_at = '2022-01-15 18:14:37', updated_at = '2022-01-15 18:14:36', title = '???????????? 14', poster = '/storage/news/404.png', description = '????????', content = '??????' WHERE id = 19;
UPDATE for_test.news SET created_at = '2022-01-15 21:21:08', updated_at = '2022-01-15 21:21:07', title = '?????????????? ?????? ?????? 1', poster = '/storage/news/404.png', description = '????????????????????', content = '????????????????????' WHERE id = 20;
UPDATE for_test.city_news SET city_id = 1, news_id = 1 WHERE id = 1;
UPDATE for_test.city_news SET city_id = 2, news_id = 2 WHERE id = 2;
UPDATE for_test.city_news SET city_id = 2, news_id = 3 WHERE id = 3;
UPDATE for_test.city_news SET city_id = 1, news_id = 9 WHERE id = 4;
UPDATE for_test.city_news SET city_id = 2, news_id = 20 WHERE id = 5;
UPDATE for_test.users SET name = 'Admin', email = 'den4ic2001@gmail.com', email_verified_at = null, password = '$2y$10$xN1rEpmLIocQbpv5XflEhOpBv80SwXUaWFjTvJGmEj3Hdgcl40bf.', remember_token = null, created_at = '2022-01-15 16:00:23', updated_at = '2022-01-15 16:00:23' WHERE id = 1;
UPDATE for_test.news_user SET user_id = 1, news_id = 1 WHERE id = 1;
UPDATE for_test.news_user SET user_id = 1, news_id = 2 WHERE id = 4;
UPDATE for_test.news_user SET user_id = 1, news_id = 3 WHERE id = 5;
UPDATE for_test.news_user SET user_id = 1, news_id = 2 WHERE id = 10;


