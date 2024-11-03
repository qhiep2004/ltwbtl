using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace BTL
{
    public partial class CourseDetail : Page
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["QLcourse"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourseDetails();
                LoadLectures();
            }
        }

        private void LoadCourseDetails()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Description, ImageURL FROM Courses WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseID", Request.QueryString["CourseID"]);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblCourseTitle.Text = reader["Title"].ToString();
                    lblCourseDescription.Text = reader["Description"].ToString();
                    imgCourse.ImageUrl = reader["ImageURL"].ToString();
                }

                conn.Close();
            }
        }

        private void LoadLectures()
        {
            List<Lecture> lectures = new List<Lecture>();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT Title, Duration, URL FROM Lecture WHERE CourseID = @CourseID";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        int courseId;
                        if (int.TryParse(Request.QueryString["CourseID"], out courseId))
                        {
                            command.Parameters.AddWithValue("@CourseID", courseId);
                        }
                        else
                        {
                            lblLecturesHeader.Text = "Invalid Course ID.";
                            lblLecturesHeader.Visible = true;
                            return;
                        }

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (!reader.HasRows)
                            {
                                lblLecturesHeader.Text = "No lectures found for this course.";
                                lblLecturesHeader.Visible = true;
                                return;
                            }

                            while (reader.Read())
                            {
                                lectures.Add(new Lecture
                                {
                                    Title = reader["Title"].ToString(),
                                    Duration = reader["Duration"].ToString(),
                                    URL = reader["URL"].ToString()
                                });
                            }
                        }
                    }
                }

                // Display data in GridView
                gvLectures.DataSource = lectures;
                gvLectures.DataBind();

                lblLecturesHeader.Visible = true;
                gvLectures.Visible = true;
            }
            catch (Exception ex)
            {
                lblLecturesHeader.Text = "Error loading lectures: " + ex.Message;
                lblLecturesHeader.Visible = true;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Handle course registration
            Session["IsUserRegistered"] = true;
            LoadLectures();
        }
    }

    public class Lecture
    {
        public string Title { get; set; }
        public string Duration { get; set; }
        public string URL { get; set; }
    }
}
