## 1) Which orders changed from week 3 to week 4? 



## 2) Please create any additional dbt models needed to help answer these questions from our product team, and put your answers in a README in your repo.
I created an extra model to answer this question called "fct_product_funnel". The answer I got is <br>
- Page View: 58.14%
- Add to Cart: 30.64%
- Checkout: 11.22%


## 3a) dbt next steps for you 

a) if your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?
- The way I wuld pitch the value to the organization is showing the main key benefits of dbt:
1) **Easy transformations**: dbt allows us to create great transformations to our models, which makes the process much easier to get to the final data that we want for analysis.
2) **Documentation**: dbt allows us to document all of our tables and columns across our whole data infrastrucuture, which will allow new comers into the organization to see much easier all the important metrics when they join.
3) **Display dependencies**: The documentatin also allow us to see which tables depend on what. Also with exposures we can see which dashboards depend on which tables.
4) **Open source Packages**: dbt has a vast community of members that provide great packages to the community which could be used by other individuals for their future dbt projects making the process much more streamlined.
5) **Set alerts:** with dbt you can set alerts which will allow you to know when something is wrong with your data and will require immediate investigation.

b) if your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?
- If my organization is doing testing I would recommend using pre-hooks in order to run any test in the development environment in order to save costs.
- Also, with my previous employer I noticed they never used exposures with dashboards and it was a bit tricky to know which tables depended on which dashboard.

c) if you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?
- Using the logic for building our models (staging - dims - intermediate/facts)
- learning most of the capabilities of dbt
- start setting a dbt project
- making the process more streamlined

3B) Setting up for production / scheduled dbt run of your project And finally, before you fly free into the dbt night, we will take a step back and reflect: after learning about the various options for dbt deployment and seeing your final dbt project, how would you go about setting up a production/scheduled dbt run of your project in an ideal state? You don’t have to actually set anything up - just jot down what you would do and why and post in a README file.

In terms of scheduling I believe I would explore tools like Airflow or Dagster which are the most commonly know for this type of tasks.
I honestly, will create an artifacts tables as describe in the lecture of this week, to keep up the logs of all the table and to measure efficiency
when each of this tables run.
In terms of timing, assuming that we have all the data ready from the previous day I will run the flows of the orchestration around 4am which is a time where usually no one is working and the flow will usually run much faster. I personally experienced this with before and I knew that when flows runned throughout the day the complete orchestration will finish much later since there were a lot of users querying  the data which affected performance.
