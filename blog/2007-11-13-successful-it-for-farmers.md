---
comments: true
date: 2007-11-13 23:49:07
layout: post
slug: successful-it-for-farmers
title: Successful IT for farmers
wordpressid: 39
tags: agriculture,engineering,philippines
---

A few days ago, the Philippine Daily Inquirer posted a report on the province of Quezon's IT program for its farmers.Â  Here is an excerpt of the articles from [1]:


> Quezon farmers, entrepreneurs sell more by going online
By Myrna   Rodriguez-Co

MANILA, Philippines -- In Quezon Province, the farmers and entrepreneurs have begun selling their produce and goods in the Internet. They do this through the provinceâ€™s â€œE-commerce for Farmersâ€ project.




[![quezon-products](http://farm3.static.flickr.com/2091/2002706358_9f58cf347f.jpg)](http://www.flickr.com/photos/yecartes/2002706358/)


The work by the Ateneo's 4f group (I do not know who they are) is very laudable in terms of effectively using technology. For example, if you go to the [product list](http://216.198.224.88/commerce/productList.cfm) of Quezon's various produce, small and medium community enterprises like "Zenaida's Store", post their unique product.  The culture of using the Internet for commerce has deeply penetrate in the minds of their constituent entrepeneurs.  In terms of usability standards, the presentation of the website appealed to them.  It does not employ sophisticated online merchant tools like Paypal and using credit cards for purchases.  The project does not need to yet.  When you perform a query for more information about an Uraro (type of Philippine cookie) supplier, you will obtain basic company contact details such as email, mobile phone number and address.  Through this the testimonies of the users in the articles was that they were able to get contacts outside of their local networks.  This provided an opportunity for Quezon citizens to expand their market.


[![Lucena Grocer](http://farm3.static.flickr.com/2255/2002706342_ab01008483.jpg)](http://www.flickr.com/photos/yecartes/2002706342/)


Dr. Greg Tangonan's [2] keeps stressing that it is not important to be able to use and achieve the bleeding edge technologies.  What matters more is how you engage it to the community that has the greatest need and transform it into a multi-billion dollar industry!  The government can already claim success by sparking a paradigm shift in the province of Quezon about IT.  Although the report also states reluctance from common Internet phobias such as online theft of money and information the momentum is there for a complete change in our method of conducting agriculture in the country.

To explore around with the security concerts reported in the article, I went to the Lucena Grocer Online.  The design of the site was for government staff in Lucena to be able to purchase their groceries online.  I can only speculate with the purchase process.  Government staff probably requests a list of orders using their accounts and clicks on a "Purchase" button.  Then at the end of the day, they will receive their groceries at the exit counter of their offices.  The amount they spent on groceries are probably deducted automatically from their grocery allowance or salaries.  An ad about the Lucena grocer is display in the upper-right hand corner of the Quezon products list page. This model was probably released first for internal use and then made public because of a press release.  To confirm my assumptions, I created an account and bought a bottle of UFC banana ketchup for Php 12.50. Upon signing, up they only prompted me for contact information such as address, email and phone number.  The system did not ask any merchant account information.  Therefore the site was indeed designed for the internal use of the employees.  So a good security question is why did they released it in public?  An answer can be found when the system emailed my about my order of ketchup:


> Hello,

Please be informed that Lucena Online Grocer is real-time online
grocery system which is under process of ownership and management
transfer. Â Getting orders are on hold until further notice. Please be
also informed that we collect information from you (like your IP
address). Â Thank you so much for your interest with our service.

O. C. (Lucena Grocer)

On Nov 11, 2007 2:48 AM, xxxxxxx wrote:
>
>
> Total Amount of Order: P 12.50
> Â Telephone: Cellphone Number:
>
> Qty
> Brand / Description
>
> Unit Price
>
> Sub Total
>
> 1 Â  UFC Banana Catsup 320mL.
> Â 12.50
> Â 12.50


Apparently they are pushing the web application for public use.  They still have a lot to fix before going completely public.  The most disturbing security hole in the merchant application is that the website does not use a secure channel for its transactions.  In the URL you can see that the web page uses the standard "http" protocol and not through an SSL layer reflected by an "https" in the address bar of the browser.  So to the system administrator of the Quezon government's e-commerce office, please try to secure your web applications as soon as possible!  Your citizen's internet security concerns is apparently true and not simple common misconceptions.

[1] http://newsinfo.inquirer.net/breakingnews/infotech/view_article.php?article_id=100125
[2] Dr. Tangonan is a Professor in the Electronics, Computer and Communications Engineering Department of Ateneo de Manila Universit
