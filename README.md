## IMDB-Postgresql-database
parsing csv files collected from imdb database and storing them in a postgresql database.
## ERD
![erd](https://user-images.githubusercontent.com/108439954/236516941-1f2551c6-6fe1-4d8d-9272-38a079592b9c.png)
## Data description 
- There are 8 tables in the imdb database:

1- actors – stores actors data including name and actor_id.

2- contents – stores films/tv_shows data such as title, release_year,content_rating,user_voting, etc.

3- content_actors – stores the relationships between contents and actors.

4- content_directors - stores the relationships between contens and directors.

5- content_genres - stores the relationships between contents and genres.

6- directors - stores the information about directors including name and director_id.

7- episode_list - stores the inforamtion about episodes for each season of the tv shows.

8- languages - stores the information about the languages. (independent table)
