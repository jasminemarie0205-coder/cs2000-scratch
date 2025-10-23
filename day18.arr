use context dcic2024
include csv
include data-source

data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end


the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
pride-pred= book("Pride and Prejudice", "Jane Austen", 448)
great-g = book("The Great Gatsby", "F. Scott Fitzgerald", 180)

#1
fun summary-string(the-book :: BookRecord) -> String:
  doc:"returns a summary string for a book, including the title, author, and pages"
  
  new-pages = num-to-string(the-book.pages)
  the-book.title + " is made by " + the-book.author + " and is " + new-pages + " pages"
  
where:
  summary-string(great-g) is "The Great Gatsby is made by F. Scott Fitzgerald and is 180 pages"
  summary-string(pride-pred) is "Pride and Prejudice is made by Jane Austen and is 448 pages"
end

#2
fun is-long-book(the-book :: BookRecord) -> Boolean:
  doc: "returns whether or not the book has more than 350 pages."
  
  if (the-book.pages > 350):
    true
  else:
    false
  end
where:
  is-long-book(great-g) is false
  is-long-book(pride-pred) is true
end

#3
data PodcastRecord:
  | podcast(name :: String, hosts :: String, content :: String)
end

#4

crime-junkie = podcast("Crime Junkie", "Ashley Flowers and Brit Prawat", "crime cases")


fun podcast-summary(the-podcast :: PodcastRecord) -> String:
  doc: "produces a string summarizing a Podcast"
  "The podcast " + the-podcast.name + " is hosted by " + the-podcast.hosts + " and is about " + the-podcast.content
  
where:
  podcast-summary(crime-junkie) is  "The podcast Crime Junkie is hosted by Ashley Flowers and Brit Prawat and is about crime cases"
end

#5

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

data RecipeRecord:
  | recipe(title :: String, servings :: Number, prep-time :: Number)
end

fun row-to-recipe(r :: Row) -> RecipeRecord:
  doc:"consumes a row"
  
  recipe(r["title"], r["servings"], r["prep-time"])
where:
  row-to-recipe(recipes.row-n(0)) is recipe("Classic Pancakes",4,15)
end

new-table=build-column(recipes, "Recipe Type", row-to-recipe)