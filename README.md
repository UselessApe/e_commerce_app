# e_commerce_app

So what do I have to say about the project:
My goal was to build a two sided application, so you can buy stuff as a user and build an admin site where you can add products which contains price, description, name and of course an image. Users should be able to place an order, see their cart and see placed orders as well. All information should be transferred to a backend and storage as well.

Depending on your login credentials you get redirected to admin_home or User_home. I used Riverpod for state management. As a payment provider I choose Stripe. 


How & Notes:
I used google firebase as backend and implemented 3 services
firestore_service - general service which is used to push data from frontend to backend and vice versa (JSON)
payment_service - as the name says responsible for the payments and transferring it to STRIPE.
storage_service - stores images and userdata

Models I built:
bag_view_model
order_model
product_model
user_data_model


