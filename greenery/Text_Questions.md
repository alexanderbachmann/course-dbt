**1) What are good indicators of a user who will likely purchase again?** <br>
-- Answer: Usage of discounts/promotions, types of products bought, demographics (Age, Gender, Ethnicity), Location. <br>
 **What about indicators of users who are likely NOT to purchase again?** <br>
 Answer: Experience, Return of Product, Satisfaction, demographics (Age, Gender, Ethnicity), Location, time in the website, Price.  <br>
 **If you had more data what features would you want to look into to answer this question?** <br>
 Answer: Interests of that particular person, Purchases of our competitors, Income of our <br> customers, Are they satisfied with our products?


 <br>

 **2) Explain the marts models you added. WHy did you organize the models in the way you did?** <br>

 **Intermediate models:** One of the intermediate models that I addedd was the product quantity. With this intermediate model we can answer the question as to which product has sold the most. I believe this is a question that will come a lot from stakeholders and that would avoid reusing this same logic from other data analysts. I also believe that by joining with product_guid we can gather further metrics by having the total quantities sold of a specific product. The other similar intermediate product that I added is the int_user_quantity which gives the total number of products bought by user which could give further indication as to which user bought the most products. 


 **Dim Models:**
 Dim models you gives further information about users and products. In the case of products what I did was join the tables order items, products and promos to see which products is going through a specific promo and have that information by product name, product price, inventory etc. I did something similar for the user table and added some extra dimensions using case when statements to see if the client was from the local (US) or an international market. (Assuming Greenery is in the US). What I did here to find extra information about our users was to join the users table with the address table.

 **Facts Models:** 
I added two facts models one belonging to the marketing subfolder and another belonging to the product subfolder. In the marketing subfolder we have the user_order_facts model which allows us to find out what was the discounted price of the product. We do have  the order total of the transaction however, I assumed that the discounted price was not taking into consideration. So in this model I included the discount to the order total column (transformation). In the product subfolder I added a model that just counts all the unique session_guids by users in order to see which user had the most page views. 


## Part 2: dbt Tests
We added some more models and transformed some data! Now we need to make sure they’re accurately reflecting the data. Add dbt tests into your dbt project on your existing models from Week 1, and new models from the section above

**What assumptions are you making about each model? (i.e. why are you adding each test?)**
- I am adding several types of tests. In the case of using the not_null test I want to make sure that all product, orders and/or sessions have a unique identified.
Using the not_null test will warn me if there is any case in which a unique identifier was not assigned.

**Did you find any “bad” data as you added and ran tests on your models? How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?**
- I wouldn't say bad data however, there were some test in which I ran the unique test which basically avoids us having any sort of duplication.
However, I assume that during the staging model we do have duplicate unique identifiers such as product_guid since one person could have bought the same product more than once.
In case this model would have require us to have a unique observation, I could have modified the unique identifier to a different one and avoid the test to fail.
