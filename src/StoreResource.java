
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.Response.Status;

import com.mysql.jdbc.ResultSet;

@Path("store/")
public class StoreResource {
	private static final ItemList itemList = new ItemList();

	@GET
	@Path("items/{email}")
	@Produces("application/json; charset=UTF-8")
	public Response getAllEntries(@PathParam("email") String email) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {

			e1.printStackTrace();
		}

		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/mail", "root", "root");

			Statement st = con.createStatement();

			itemList.clear();
			ResultSet rs = (ResultSet) st
					.executeQuery("select * from friend where email='" + email
							+ "' order by id");

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String ad1 = rs.getString("ad1");
				String ad2 = rs.getString("ad2");
				String city = rs.getString("city");
				String state = rs.getString("state");
				String country = rs.getString("country");
				String zip = rs.getString("zip");
				String phone = rs.getString("phone");

				Item item = new Item();

				item.setId(id);
				item.setName(name);
				item.setAd1(ad1);
				item.setAd2(ad2);
				item.setCity(city);
				item.setState(state);
				item.setCountry(country);
				item.setZip(zip);
				item.setPhone(phone);

				itemList.add(item);

			}

			rs.close();
			st.close();
			con.close();
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}

		ResponseBuilder responseBuilder = null;

		if (itemList == null) {
			responseBuilder = Response.status(Status.NO_CONTENT);
		} else {
			responseBuilder = Response.status(Status.OK);
			responseBuilder.entity(itemList);
		}

		System.out.println("Hello!");

		Response response = responseBuilder.build();

		return response;
	}

	@POST
	@Path("items")
	@Consumes("application/json")
	public void createEntry(Item entry) {

		ResponseBuilder responseBuilder = null;

		try {
			synchronized (this)

			{
				itemList.add(entry);

			}
			responseBuilder = Response.status(Status.CREATED);
		} catch (Exception ex) {
			responseBuilder = Response.status(Status.NO_CONTENT);
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {

			e1.printStackTrace();
		}

		System.out.println(entry.getName());
		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/mail", "root", "root");
			String email = entry.getEmail();
			String name = entry.getName();
			String ad1 = entry.getAd1();
			String ad2 = entry.getAd2();
			String city = entry.getCity();
			String state = entry.getState();
			String country = entry.getCountry();
			String zip = entry.getZip();
			String phone = entry.getPhone();

			System.out.println("email : " + email + "name : " + name);

			String sql = "insert into friend (email,name, ad1, ad2, city, state, country, zip, phone) values('"
					+ email
					+ "','"
					+ name
					+ "','"
					+ ad1
					+ "','"
					+ ad2
					+ "','"
					+ city
					+ "','"
					+ state
					+ "','"
					+ country
					+ "','"
					+ zip
					+ "','" + phone + "')";
			Statement st = con.createStatement();

			int i = st.executeUpdate(sql);
			if (i > 0) {
				System.out.println("In loop");
			}

			st.close();
			con.close();
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	@PUT
	@Path("items")
	@Consumes("application/json")
	public void updateEntry(Item entry) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {

			e1.printStackTrace();
		}

		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/mail", "root", "root");
			Statement st = con.createStatement();

			int id = entry.getId();
			String name = entry.getName();
			String ad1 = entry.getAd1();
			String ad2 = entry.getAd2();
			String city = entry.getCity();
			String state = entry.getState();
			String country = entry.getCountry();
			String zip = entry.getZip();
			String phone = entry.getPhone();

			System.out.println("Name : " + name + id);

			String sqlupdate = "update friend set name='" + name + "', ad1 = '"
					+ ad1 + "', ad2 = '" + ad2 + "', city = '" + city
					+ "', state = '" + state + "', country = '" + country
					+ "', zip = '" + zip + "', phone = '" + phone
					+ "' where id =" + entry.getId();

			int i = 0;

			i = st.executeUpdate(sqlupdate);

			if (i > 0) {
				System.out.println("In loop");

			}

			st.close();
			con.close();
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	@DELETE
	@Path("items/{id}")
	public void deleteEntry(@PathParam("id") String id) {
		System.out.println("Hello in delete with id=" + id);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {

			e1.printStackTrace();
		}

		try {
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/mail", "root", "root");

			Statement st = con.createStatement();
			String sql = "delete from friend where id=" + id;
			int i = st.executeUpdate(sql);

			st.close();
			con.close();
		}

		catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}