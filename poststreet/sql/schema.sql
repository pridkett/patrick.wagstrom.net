create table avatar (
       id integer primary key autoincrement not null,
       name varchar(255) not null,
       width integer,
       height integer,
       create_date datetime default null,
       create_by integer references users(id),
       modify_date datetime default null,
       modify_by integer references users(id));
create trigger avatar_create_date after insert on avatar
begin
    update avatar set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;

create table users (
       id integer primary key autoincrement not null,
       name varchar(255) not null,
       real_name varchar(255) not null,
       email varchar(255) not null,
       url varchar(255) not null,
       password varchar(255) not null,
       avatar_id integer default null references avatar(id),
       create_date datetime default null,
       modify_date datetime default null);
create trigger users_create_date after insert on users
begin
    update users set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;

create table translator_class (
       id integer primary key autoincrement not null,
       name varchar(64) not null,
       create_date datetime default null,
       create_by integer references users(id));
create trigger translator_class_create_date after insert on translator_class
begin
    update translator_class set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;

create table translator (
       id integer primary key autoincrement not null,
       name varchar(64) not null,
       translator_class_id integer not null references translator_class(id),
       data text,
       create_date datetime default null,
       create_by integer references users(id),
       modify_date datetime default null,
       modify_by integer references users(id));
create trigger translator_create_date after insert on translator
begin
    update translator set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;

create table weblog (
       id integer primary key autoincrement not null,
       title varchar(255),
       subtitle varchar(255) default null,
       prefix varchar(255) default null,
       translator_id integer default null references translator(id),
       comment_translator_id integer default null references translator(id),
       create_date datetime default null,
       create_by integer references users(id),
       modify_date datetime default null,
       modify_by integer references users(id));
create trigger weblog_create_date after insert on weblog
begin
    update weblog set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;

create table tag (
       id integer primary key autoincrement not null,
       name varchar(255) not null,
       create_date datetime default null );
create trigger tag_create_date after insert on tag
begin
    update tag set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;
create index tag_name_idx on tag(name);

create table category (
       id integer primary key autoincrement not null,
       name varchar(64) not null,
       weblog_id integer not null references weblog(id),
       parent_id integer default null references category(id),
       create_date datetime default null );
create trigger category_create_date after insert on category
begin
    update category set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;
create index category_name_idx on category(name);

create table entry (
       id integer primary key autoincrement not null,
       name varchar(255) not null,
       title varchar(255) not null,
       translator_id integer default null references translator(id),
       comment_translator_id integer default null references translator(id),
       body text default null,
       translated_body text default null,
       weblog_id integer not null references weblog(id),
       category_id integer default null references category(id),
       create_date datetime default null,
       create_by integer not null references users(id),
       modify_date datetime default null,
       modify_by integer not null references users(id),
       publish_date datetime default null,
       published bool default TRUE);
create trigger entry_create_date after insert on entry
begin
    update entry set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;
create index entry_weblog_idx on entry(weblog_id);
create index entry_category_idx on entry(category_id);

create table tag_entry (
       id integer primary key autoincrement not null,
       entry_id integer not null references entry(id),
       tag_id integer not null references tag(id),
       create_date datetime default null,
       create_by integer not null references users(id));
create trigger tag_entry_create_date after insert on tag_entry
begin
    update tag_entry set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;
create index tag_entry_tag_idx on tag_entry(tag_id);
create index tag_entry_entry_idx on tag_entry(entry_id);

create table comment (
       id integer primary key autoincrement not null,
       entry_id integer not null references entry(id),
       title varchar(255),
       parent_id integer default null references comment(id),
       body text default null,
       translated_body text default null,
       name varchar(255) default null,
       email varchar(255) default null,
       url varchar(255) default null,
       remote_addr varchar(64) default null,
       create_date datetime default null,
       create_by integer references users(id),
       modify_date datetime default null,
       modify_by integer references users(id));
create trigger comment_create_date after insert on comment
begin
    update comment set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;
create index comment_entry_idx on comment(entry_id);
create index comment_parent_idx on comment(parent_id);


-- New entities for top entry management
create table top_content (
        id integer primary key autoincrement not null,
        weblog_id integer not null references weblog(id),
        create_date datetime default null,
        filename varchar(255) default null);
create trigger top_content_create_date after insert on top_content
begin
	update top_content set create_date=DATETIME('NOW') WHERE rowid = new.rowid;
end;

create table top_content_tags (
        id integer primary key autoincrement not null,
        top_content_id integer not null references top_content(id),
        tag_id integer not null references tag(id),
        rank integer not null );

create table top_content_entries (
        id integer primary key autoincrement not null,
        top_content_id integer not null references top_content(id),
        entry_id integer not null references entry(id),
        rank integer not null );

create table top_content_categories (
        id integer primary key autoincrement not null,
        top_content_id integer not null references top_content(id),
        category_id integer not null references category(id),
        rank integer not null );

insert into users (name, real_name, email, url, password) values ('pridkett', 'Patrick Wagstrom', 'patrick@wagstrom.net', 'http://patrick.wagstrom.net/weblog/', 'qwerty');

insert into translator_class (name, create_by) select 'XSLT', users.id from users WHERE users.name='pridkett' limit 1;
insert into translator(translator_class_id, create_by, name, data) select translator_class.id, users.id, 'Weblog Entry XSLT Processor', 'file:$STATIC/translators/entry.xsl' FROM translator_class, users WHERE translator_class.name='XSLT' and users.name='pridkett' LIMIT 1;
insert into translator(translator_class_id, create_by, name, data) select translator_class.id, users.id, 'Weblog Comment XSLT Processor', 'file:$STATIC/translators/comment.xsl' FROM translator_class, users WHERE translator_class.name='XSLT' and users.name='pridkett' limit 1;

insert into translator_class (name, create_by) select 'BEAUTIFUL_SOUP', users.id FROM users WHERE users.name='pridkett' limit 1;
insert into translator(translator_class_id, create_by, name) select translator_class.id, users.id, 'Beautiful Soup Prettifier' FROM translator_class, users WHERE translator_class.name='BEAUTIFUL_SOUP' and users.name='pridkett' LIMIT 1;

insert into translator_class (name, create_by) select 'SOURCE_HIGHLIGHT', users.id FROM users WHERE users.name='pridkett' limit 1;
insert into translator(translator_class_id, create_by, name) select translator_class.id, users.id, 'Pygments Source Code Highlighter' FROM translator_class, users WHERE translator_class.name='SOURCE_HIGHLIGHT' and users.name='pridkett' LIMIT 1;

insert into translator_class (name, create_by) select 'CHAIN_TRANSLATOR', users.id FROM users WHERE users.name='pridkett' limit 1;
-- WARNING: this isn't pretty code and it may not properly chain together everything when 
insert into translator(translator_class_id, create_by, name, data) select translator_class.id, users.id, 'Highlight -> Beautiful Soup -> XML Entry Prettifier', '4:3:1' FROM translator_class, users WHERE translator_class.name='CHAIN_TRANSLATOR' and users.name='pridkett' LIMIT 1;
insert into translator(translator_class_id, create_by, name, data) select translator_class.id, users.id, 'Beautiful Soup -> XML Comment Prettifier', '3:2' FROM translator_class, users WHERE translator_class.name='CHAIN_TRANSLATOR' and users.name='pridkett' LIMIT 1;

insert into weblog(title, subtitle, translator_id, comment_translator_id, create_by) select 'My Delusional Dream', 'Thoughts of a Cautious Technocrat', e_translator.id, c_translator.id, users.id FROM users, translator e_translator, translator c_translator WHERE users.name='pridkett' AND e_translator.name='Highlight -> Beautiful Soup -> XML Entry Prettifier' AND c_translator.name='Beautiful Soup -> XML Comment Prettifier' LIMIT 1;
