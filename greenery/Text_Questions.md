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