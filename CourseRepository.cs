using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Configuration;
using BTL;

public class CourseRepository
{
    private string connectionString = ConfigurationManager.ConnectionStrings["QLcourse"].ConnectionString;

    public List<Course> GetAllCourses()
    {
        var courses = new List<Course>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Courses";
            SqlCommand cmd = new SqlCommand(query, conn);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                courses.Add(new Course
                {
                    CourseID = Convert.ToInt32(reader["CourseID"]),
                    Title = reader["Title"].ToString(),
                    Description = reader["Description"].ToString(),
                    Duration = reader["Duration"].ToString(),
                    LecturesCount = Convert.ToInt32(reader["LecturesCount"]),
                    Rating = Convert.ToDouble(reader["Rating"]),
                    Level = reader["Level"].ToString(),
                    Category = reader["Category"].ToString(),
                    ImageURL = reader["ImageURL"].ToString()
                });
            }
        }

        return courses;
    }
}
