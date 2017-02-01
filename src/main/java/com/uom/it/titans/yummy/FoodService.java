package com.uom.it.titans.yummy;

import com.mongodb.*;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import com.mongodb.util.JSON;
import org.apache.log4j.Logger;

import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.ws.rs.core.Response;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 * Class containing all services related to yummy food app
 */
@Path("/foodservice")
public class FoodService {

    final static Logger LOGGER = Logger.getLogger(FoodService.class);

    /**
     * Test method to see whether web service is working.
     *
     * @param msg sent as a parameter
     * @return example if msg = hi -> Jersey say : hi
     */
    @GET
    @Path("/{param}")
    public Response getMsg(@PathParam("param") String msg) {
        LOGGER.info("Food Service Test Method is Called with param : " + msg);
        String output = "Jersey say : " + msg;
        return Response.status(200).entity(output).build();
    }

    /**
     * Test method to get all restaurants from DB.
     *
     * @return json with all restaurant data
     */
    @GET
    @Path("getAllRestaurantsTest")
    public Response getAllRestaurantsTest() throws UnknownHostException {
        LOGGER.info("Food Service Get All Restaurant Data is Called ");
        DB db = DBConnection.getConnection();
        DBCollection restaurantCollection = db.getCollection("Restaurant");

        DBCursor cursor = restaurantCollection.find();
        JSON json = new JSON();
        String serialize = JSON.serialize(cursor);
        return Response.status(200).entity(serialize).build();
    }

    /**
     * TODO
     * http://localhost:8080/rest/foodservice/foodWise?fo=Pizza&ci=Moratuwa
     *
     * @return
     * @throws UnknownHostException
     */
    @Path("/foodWise")
    @GET                 // http://localhost:8080/rest/hello/message/Pizza/Moratuwa
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response createMessage(@Context UriInfo ui) throws UnknownHostException {

        MultivaluedMap<String, String> queryParams = ui.getQueryParameters();

        String Food_Item = queryParams.get("fo").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Current_City = queryParams.get("ci").toString().replaceAll("\\[", "").replaceAll("\\]", "");


        if (Food_Item.trim().length() > 0 && Current_City.trim().length() > 0) {  //trim() returns a string with no leading or trailing white spaces
            try {

                DB db = DBConnection.getConnection();
                DBCollection foodItemCollection = db.getCollection("Food_Item");


                BasicDBObject whereQuery = new BasicDBObject();
                whereQuery.put("Food_Item_Name", Food_Item);  // select document where satisfy this situation
                BasicDBObject fields = new BasicDBObject();
                fields.put("Food_Item_Id", 1);  //  1 means only return Food_Item_Id field  .. 0 means return all fields but not this specified field


                DBCursor cursor = foodItemCollection.find(whereQuery, fields);  // If we print cursor.next() , It will as a object just like a document not even a string type

                BasicDBObject obj = (BasicDBObject) cursor.next();
                String msg = obj.getString("Food_Item_Id");  //print only value related to this key in above cursor

                BasicDBObject whereQuery2 = new BasicDBObject();

                List<BasicDBObject> objjj = new ArrayList<BasicDBObject>();
                objjj.add(new BasicDBObject("AvailableFoodItems", msg));
                objjj.add(new BasicDBObject("NearestCity", Current_City));
                whereQuery2.put("$and", objjj);

                DBCollection restaurantCollection = db.getCollection("Restaurant");
                DBCursor cursor3 = restaurantCollection.find(whereQuery2);



                String serialize = JSON.serialize(cursor3);
                return Response.status(200).entity(serialize).build();


            } catch (Exception e) {
                String respond = "Sorry can't find a best restaurant related to your choice";
                URI uri = UriBuilder.fromPath("http://localhost:8080/test1.jsp").queryParam("returnmsg1", respond).build();
                return Response.seeOther(uri).build();
            }


        }
        String warning = "Please enter your choose.We will find out the best Restaurants";
        URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg1", warning).build();
        return Response.seeOther(uri).build();


    }

    /**
     * TODO
     * http://localhost:8080/rest/foodservice/restaurantWise/res=PizzaHutMoratuwa
     *
     * @param ResName
     * @return
     * @throws UnknownHostException
     */
    @Path("/restaurantWise")
    @GET
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response createMessage2(@Context UriInfo ui) throws UnknownHostException {

        MultivaluedMap<String, String> queryParams = ui.getQueryParameters();

        String ResName = queryParams.get("res").toString().replaceAll("\\[", "").replaceAll("\\]", "");


        if (ResName.trim().length() > 0) {


            try {

                DB db = DBConnection.getConnection();

                DBCollection mycollec = db.getCollection("Restaurant");


                BasicDBObject whereQuery = new BasicDBObject();
                whereQuery.put("Restaurant_Name", ResName);
          //      BasicDBObject fields = new BasicDBObject();
           //     fields.put("Restaurant_Name", 0);
                DBCursor cursor = mycollec.find(whereQuery);



                String serialize = JSON.serialize(cursor);
                return Response.status(200).entity(serialize).build();
            } catch (Exception e) {
                String respond = "Sorry can't find a best restaurant related to your choice";
                URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg2", respond).build();
                return Response.seeOther(uri).build();
            }


        }
        String warning = "Please enter your choose.We will find out the best Restaurants";
        URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg2", warning).build();
        return Response.seeOther(uri).build();


    }


    /**
     * TODO
     * http://localhost:8080/rest/foodservice/locationWise/loc=Katubedda
     *
     * @param ResLoc
     * @return
     * @throws UnknownHostException
     */
    @Path("/locationWise")
    @GET
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response createMessage3(@Context UriInfo ui) throws UnknownHostException {

        MultivaluedMap<String, String> queryParams = ui.getQueryParameters();

        String ResLoc = queryParams.get("loc").toString().replaceAll("\\[", "").replaceAll("\\]", "");


        if (ResLoc.trim().length() > 0) {


            try {

                DB db = DBConnection.getConnection();

                DBCollection mycollec = db.getCollection("Restaurant");


                BasicDBObject whereQuery = new BasicDBObject();
                whereQuery.put("NearestCity", ResLoc);
                BasicDBObject fields = new BasicDBObject();
                fields.put("Restaurant_Name", 1);

                DBCursor cursor = mycollec.find(whereQuery, fields);
                ///  BasicDBObject obj = (BasicDBObject) cursor.next();
                // String msg = obj.getString("Restaurant_Name");


                JSON json = new JSON();
                String serialize = JSON.serialize(cursor);
                return Response.status(200).entity(serialize).build();
            } catch (Exception e) {
                String respond = "Sorry can't find a best restaurant related to your choice";
                URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg3", respond).build();
                return Response.seeOther(uri).build();
            }


        }
        String warning = "Please enter your choose.We will find out the best Restaurants";
        URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg3", warning).build();
        return Response.seeOther(uri).build();


    }

    /**
     * TODO
     *
     * @param msg
     * @return
     * @throws UnknownHostException
     */


    @GET
    @Path("/mongo/{param}")
    public Response getMongo(@PathParam("param") String msg) throws UnknownHostException {

        String output = "Jersey say : " + msg;
        //MongoClient mongo = new MongoClient( "localhost" , 27017 );
        //DB db = mongo.getDB("database name");

        return Response.status(200).entity(output).build();


    }

    @Path("/register")
    @GET                 // http://localhost:8080/rest/hello/message/Pizza/Moratuwa
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response registerRestaurant(@Context UriInfo ui) throws UnknownHostException {

        MultivaluedMap<String, String> queryParams = ui.getQueryParameters();

         String Restaurant_ID ;
        String Restaurant_Name = queryParams.get("rname").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String RUsername = queryParams.get("uname").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Password = queryParams.get("pwd").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String OFacility = queryParams.get("ofac").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Email = queryParams.get("email").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String RContact = queryParams.get("rconta").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String NearestCity = queryParams.get("city").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String AvailableFoodItems = queryParams.get("fooditems").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Location = queryParams.get("location").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String image = queryParams.get("image").toString().replaceAll("\\[", "").replaceAll("\\]", "");



        if (Restaurant_Name.trim().length() > 0 && RUsername.trim().length() > 0 && Password.trim().length() > 0 && OFacility.trim().length() > 0 && Email.trim().length() > 0 && RContact.trim().length() > 0 && NearestCity.trim().length() > 0 && AvailableFoodItems.trim().length() > 0 && image.trim().length() > 0) {  //trim() returns a string with no leading or trailing white spaces

            try {

                DB db = DBConnection.getConnection();
                DBCollection restaurant = db.getCollection("Restaurant");
                Long i = restaurant.count();

                Restaurant_ID = "R"+Long.toString(i);

                BasicDBObject document = new BasicDBObject();

                document.put("Restaurant_ID", Restaurant_ID);
                document.put("Restaurant_Name", Restaurant_Name);
                document.put("RUsername", RUsername);
                document.put("Password", Password);
                document.put("OFacility", OFacility);
                document.put("Email", Email);
                document.put("RContact", RContact);
                document.put("NearestCity", NearestCity);
                document.put("AvailableFoodItems", AvailableFoodItems);
                document.put("Location", Location);
                document.put("RImage", image);


                restaurant.insert(document);

                String status = "Successfully Registered" + Restaurant_Name;

                return Response.status(200).entity(status).build();


            } catch (Exception e) {
                String status = "Successfully Not Registered " + Restaurant_Name;

                return Response.status(200).entity(status).build();
            }


        }

        String status = "Successfully Not 2 Registered" + Restaurant_Name;

        return Response.status(200).entity(status).build();


    }

    //personl account

    @Path("/customerSignUp")
    @GET                 // http://localhost:8080/rest/hello/message/Pizza/Moratuwa
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response customerSignUp(@Context UriInfo ui) throws UnknownHostException {

        MultivaluedMap<String, String> queryParams = ui.getQueryParameters();

        String Customer_ID ;
        String Customer_Full_Name = queryParams.get("name").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Contact_Number = queryParams.get("phone").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Email = queryParams.get("email").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String NIC = queryParams.get("nic").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Username = queryParams.get("username").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String Passward = queryParams.get("pwd").toString().replaceAll("\\[", "").replaceAll("\\]", "");

        if (Customer_Full_Name.trim().length() > 0 && Contact_Number.trim().length() > 0 && Email.trim().length() > 0 && NIC.trim().length() > 0 && Email.trim().length() > 0 && Username.trim().length() > 0 && Passward.trim().length() > 0 ) {  //trim() returns a string with no leading or trailing white spaces

            try {

                DB db = DBConnection.getConnection();
                DBCollection customer = db.getCollection("Customer");
                Long i = customer.count();

                Customer_ID = "C"+Long.toString(i);

                BasicDBObject document = new BasicDBObject();

                document.put("Customer_ID", Customer_ID);
                document.put("Customer_Full_Name", Customer_Full_Name);
                document.put("Contact_Number", Contact_Number);
                document.put("Email", Email);
                document.put("NIC", NIC);
                document.put("Email", Email);
                document.put("Username", Username);
                document.put("Passward", Passward);


                customer.insert(document);

                String status = "Successfully Registered" + Customer_Full_Name;

                return Response.status(200).entity(status).build();


            } catch (Exception e) {
                String status = " Not Registered Try Again " + Customer_Full_Name;

                return Response.status(200).entity(status).build();
            }


        }

        String status = "Please Register" + Customer_Full_Name;

        return Response.status(200).entity(status).build();


    }

    //login
    //personl account

    @Path("/customerSignIn")
    @GET                 // http://localhost:8080/rest/hello/message/Pizza/Moratuwa
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response customerSignIn(@Context UriInfo ui) throws UnknownHostException {

        MultivaluedMap<String, String> queryParams = ui.getQueryParameters();


        String username = queryParams.get("cname").toString().replaceAll("\\[", "").replaceAll("\\]", "");
        String pwd = queryParams.get("pwd").toString().replaceAll("\\[", "").replaceAll("\\]", "");

        if (username.trim().length() > 0 && pwd.trim().length() > 0 ) {  //trim() returns a string with no leading or trailing white spaces

            try {

                DB db = DBConnection.getConnection();
                DBCollection customer = db.getCollection("Customer");

                BasicDBObject whereQuery = new BasicDBObject();
                List<BasicDBObject> upwd = new ArrayList<BasicDBObject>();
                upwd.add(new BasicDBObject("Username", username));
                upwd.add(new BasicDBObject("Passward", pwd));
                whereQuery.put("$and", upwd);

                DBCursor cursor = customer.find(whereQuery);
                if(cursor.length()>0){


                    String status = "You are Sign In :" + username;

                    return Response.status(200).entity(status).build();

                }else{
                    String status = "Please Sign Up ";

                    return Response.status(200).entity(status).build();
                }



            } catch (Exception e) {
                String status = "Please Sign In .Unless you have an account,you have to Sign Up ";

                return Response.status(200).entity(status).build();
            }


        }

        String status = "Empty fields";

        return Response.status(200).entity(status).build();


    }




    //Still use testing purposes
    public static void main(String[] args) throws UnknownHostException {



        }

}