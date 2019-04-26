package affamato;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.apache.http.client.utils.URIBuilder;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import main.java.affamato.Exception;
import main.java.affamato.URIBuilder;

public class grocerylistPageServlet extends HttpServlet{
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        User user = userService.getCurrentUser();
    	String query = req.getParameter("search"); //this is working. 	
    	
        try {
        	URIBuilder b = new URIBuilder("http://www.affamato.xyz/search"); 
        	b.addParameter("type", "ingredient");
        	b.addParameter("user", user.toString());
        	b.addParameter("q", query);
        	
        	resp.sendRedirect(b.toString());
        	if(query == null) resp.getWriter().println("query is null");
        	} catch (Exception e) {
        		
        		e.printStackTrace();
        		resp.sendRedirect("/landingPage.jsp"); //not sure what to redirect to
        	}       
    	
    	//perhaps this needs to be in the JSP
        //Cook thisCook = Cook.getCook(user);
        //JSONArray thisLists = thisCook.getGroceryLists(); //returns a JSONArray of JSONArrays

        resp.sendRedirect("/grocerylistPage.jsp");
    }

}