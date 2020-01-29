/*Who checked out the book 'The Hobbit’?*/
select m.* from member m, checkout_item c, book b where m.id = c.member_id and c.book_id = b.id and b.title = "The Hobbit";

/*How many people have not checked out anything?*/
select count(*) from member m where not exists (select * from checkout_item c where c.member_id = m.id);

/*What books and movies aren't checked out?*/
select * from book b where not exists (select * from checkout_item c where c.book_id = b.id)
union
select * from movie m where not exists (select * from checkout_item c where c.movie_id = m.id);

/*Add the book 'The Pragmatic Programmer', and add yourself as a member. Check out 'The Pragmatic Programmer'.
Use your query from question 1 to verify that you have checked it out.
Also, provide the SQL used to update the database.*/

insert into book (title) values("The Pragmatic Programmer");
insert into member (name) values("Arne Laponin");

insert into checkout_item(member_id, book_id) select (select member.id from member where member.name = "Arne Laponin") as aa, (select book.id from book where book.title = "The Pragmatic Programmer") as bb;

select m.* from member m, checkout_item c, book b where m.id = c.member_id and c.book_id = b.id and b.title = "The Pragmatic Programmer";

/*Who has checked out more than 1 item?*/
select m.* from member m inner join checkout_item c on m.id=c.member_id group by m.id having count(*) > 1;
