package com.uom.it.titans.yummy;

import com.mongodb.*;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;


//@Path-----this annotation is  containing the desired URL the servlet should listen on.
@Path("/foodservice")  //hello
public class FoodService {

    /**
     * Test method to see whether web service is working.
     *
     * @param msg sent as a parameter
     * @return example if msg = hi -> Jersey say : hi
     */


    @GET
    @Path("/{param}")
    public Response getMsg(@PathParam("param") String msg) {


        String output = "Jersey say : " + msg;

        return Response.status(200).entity(output).build();

    }

    /**
     * TODO
     * http://localhost:8080/rest/foodservice/foodWise/fo=Pizza&ci=Moratuwa
     *
     * @param Food_Item
     * @param Current_City
     * @return
     * @throws UnknownHostException
     */
    @Path("/foodWise")
    @POST                 // http://localhost:8080/rest/hello/message/Pizza/Moratuwa
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response createMessage(@FormParam("fo") String Food_Item, @FormParam("ci") String Current_City) throws UnknownHostException {

        if (Food_Item.trim().length() > 0 && Current_City.trim().length() > 0) {  //trim() returns a string with no leading or trailing white spaces
           /* return Response.created(URI.create("/message/" + String.valueOf(UUID.randomUUID()))).entity(
            Food_Item+ "  &  " + Current_City+"...").build() ;
            */

            // This is a more real world "return"
            //return Response.created(URI.create("/messages/" + String.valueOf(UUID.randomUUID()))).build();

            //  String message = "FoodItem " + Food_Item + "  CurrentCity " + Current_City;

            try {

                MongoClient mongo = new MongoClient("localhost", 27017);
                DB mydb = mongo.getDB("Titans");
                DBCollection mycollec = mydb.getCollection("Food_Item");


                BasicDBObject whereQuery = new BasicDBObject();
                whereQuery.put("Food_Item_Name", Food_Item);  // select document where satisfy this situation
                BasicDBObject fields = new BasicDBObject();
                fields.put("Food_Item_Id", 1);  //  1 means only return Food_Item_Id field  .. 0 means return all fields but not this specified field


                DBCursor cursor = mycollec.find(whereQuery, fields);  // If we print cursor.next() , It will as a object just like a document not even a string type

                BasicDBObject obj = (BasicDBObject) cursor.next();
                String msg = obj.getString("Food_Item_Id");  //print only value related to this key in above cursor


           /* while (cursor.hasNext()) {
                System.out.println(cursor.next());
            }*/

                BasicDBObject whereQuery2 = new BasicDBObject();

                List<BasicDBObject> objjj = new ArrayList<BasicDBObject>();
                objjj.add(new BasicDBObject("AvailableFoodItems", msg));
                objjj.add(new BasicDBObject("NearestCity", Current_City));
                whereQuery2.put("$and", objjj);

                DBCollection mycollec2 = mydb.getCollection("Restaurant");
                DBCursor cursor3 = mycollec2.find(whereQuery2);


                BasicDBObject obj2 = (BasicDBObject) cursor3.next();
                String msg2 = obj2.getString("Restaurant_Name");


                URI uri = UriBuilder.fromPath("http://localhost:8080/RatingHome.jsp").queryParam("returnmsg1", msg2).build();
                return Response.seeOther(uri).build();
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
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response createMessage2(@FormParam("res") String ResName) throws UnknownHostException {

        if (ResName.trim().length() > 0) {


            try {

                MongoClient mongo = new MongoClient("localhost", 27017);
                DB mydb = mongo.getDB("Titans");
                DBCollection mycollec = mydb.getCollection("Restaurant");


                BasicDBObject whereQuery = new BasicDBObject();
                whereQuery.put("Restaurant_Name", ResName);
                BasicDBObject fields = new BasicDBObject();
                fields.put("Restaurant_Name", 0);

                DBCursor cursor = mycollec.find(whereQuery, fields);
                BasicDBObject obj = (BasicDBObject) cursor.next();
                String msg = obj.getString("OFacility");


                URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg2", msg).build();
                return Response.seeOther(uri).build();
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
     * http://localhost:8080/rest/foodservice/loadallrestaurants
     *
     * @return queryOutput=%5BPizzaHutMoratuwa,+Moratuwa,+PizzaHutKatubedda,+Katubedda,+PizzaHutDehiwala,+Dehiwala%5D
     * @throws UnknownHostException
     */
    @Path("/loadallrestaurants")
    @GET
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response loadAllRestaurants() throws IOException {


        MongoClient mongo = new MongoClient("localhost", 27017);
        DB mydb = mongo.getDB("Titans");
        DBCollection mycollec = mydb.getCollection("Restaurant");

        BasicDBObject whereQuery = new BasicDBObject();
        ArrayList<String> queryOutput = new ArrayList<String>(1000);

        int i = 1;

        while (i > 0) {

            String result = "R" + i;
            // String rname = "R" + i;
            // String ncity = "C" + i;

            try {

                whereQuery.put("Restaurant_ID", result);
                DBCursor cursor = mycollec.find(whereQuery);
                BasicDBObject obj = (BasicDBObject) cursor.next();

                String resname = obj.getString("Restaurant_Name");

                queryOutput.add(resname);

                String nearestcity = obj.getString("NearestCity");

                queryOutput.add(nearestcity);
                i++;


            } catch (Exception e) {
                break;
            }


        }


        URI uri = UriBuilder.fromPath("http://localhost:8080/test1.jsp").queryParam("queryOutput", queryOutput).build();
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
    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response createMessage3(@FormParam("loc") String ResLoc) throws UnknownHostException {

        if (ResLoc.trim().length() > 0) {


            try {

                MongoClient mongo = new MongoClient("localhost", 27017);
                DB mydb = mongo.getDB("Titans");
                DBCollection mycollec = mydb.getCollection("Restaurant");


                BasicDBObject whereQuery = new BasicDBObject();
                whereQuery.put("NearestCity", ResLoc);
                BasicDBObject fields = new BasicDBObject();
                fields.put("Restaurant_Name", 1);

                DBCursor cursor = mycollec.find(whereQuery, fields);
                BasicDBObject obj = (BasicDBObject) cursor.next();
                String msg = obj.getString("Restaurant_Name");


                URI uri = UriBuilder.fromPath("http://localhost:8080/index.jsp").queryParam("returnmsg3", msg).build();
                return Response.seeOther(uri).build();
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

    /**
     * TODO
     * http://localhost:8080/rest/foodservice/images
     *
     * @return
     * @throws UnknownHostException
     */

    @POST
    @Path("/images")
    public Response getMongoImages() throws IOException {

        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("Titans");
        DBCollection collection = db.getCollection("DBImageCollection");

        String newFileName = "R01";

        File imageFile = new File("C:\\DBImages\\PizzaHutKatubedda.jpg");

        // create a "photo" namespace
        GridFS gfsPhoto = new GridFS(db, "photo");

        // get image file from local drive
        GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);

        // set a new filename for identify purpose
        gfsFile.setFilename(newFileName);

        // save the image file into mongoDB
        gfsFile.save();
        GridFSDBFile imageForOutput = gfsPhoto.findOne(newFileName);
        imageForOutput.writeTo("http://localhost:8080/test1.jsp#sign");

        URI uri = UriBuilder.fromPath("http://localhost:8080/test1.jsp").queryParam("returnmsg3", imageForOutput).build();
        return Response.seeOther(uri).build();


    }

    //Still use testing purposes
    public static void main(String[] args) throws UnknownHostException {

        MongoClient mongo = new MongoClient("localhost", 27017);
        DB mydb = mongo.getDB("Titans");
        DBCollection mycollec = mydb.getCollection("Restaurant");

        BasicDBObject whereQuery = new BasicDBObject();

        int i = 1;
        ArrayList<String> queryOutput = new ArrayList<String>(1000);

        while (i > 0) {

            String result = "R" + i;
            // String rname = "R" + i;
            // String ncity = "C" + i;

            try {

                whereQuery.put("Restaurant_ID", result);
                DBCursor cursor = mycollec.find(whereQuery);
                BasicDBObject obj = (BasicDBObject) cursor.next();
                String resname = obj.getString("Restaurant_Name");
                queryOutput.add(resname);
                String nearestcity = obj.getString("NearestCity");
                queryOutput.add(nearestcity);
                i++;

                System.out.print(resname + " " + nearestcity);
                System.out.println();

            } catch (Exception e) {
                break;
            }

        }
        for (String str : queryOutput) {
            System.out.println("String = " + str);
        }


    }
}