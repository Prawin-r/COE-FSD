package com.myTraining.core.servlets;

import com.day.cq.wcm.api.Page;
import com.day.cq.wcm.api.PageManager;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;
import org.osgi.service.component.annotations.Component;
import org.osgi.framework.Constants;

import javax.servlet.Servlet;
import java.io.IOException;
import java.util.Iterator;

@Component(service = Servlet.class,
        property = {
                Constants.SERVICE_DESCRIPTION + "=Book Fetch Servlet",
                "sling.servlet.paths=/bin/mytraining/books",
                "sling.servlet.methods=GET"
        })
public class BookServlet extends SlingAllMethodsServlet {

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PageManager pageManager = request.getResourceResolver().adaptTo(PageManager.class);
        Page booksRootPage = pageManager.getPage("/content/myTraining/us/en/books");

        JsonArray booksArray = new JsonArray();

        if (booksRootPage != null) {
            Iterator<Page> bookPages = booksRootPage.listChildren();

            while (bookPages.hasNext()) {
                Page bookPage = bookPages.next();

                if (!bookPage.isHideInNav()) { // Exclude hidden pages if needed
                    JsonObject bookObject = new JsonObject();
                    bookObject.addProperty("title", bookPage.getTitle());
                    bookObject.addProperty("path", bookPage.getPath() + ".html"); // Ensure the URL ends with .html
                    booksArray.add(bookObject);
                }
            }
        }

        JsonObject responseObject = new JsonObject();
        responseObject.add("books", booksArray);

        response.setStatus(SlingHttpServletResponse.SC_OK);
        response.getWriter().write(responseObject.toString());
    }
}
