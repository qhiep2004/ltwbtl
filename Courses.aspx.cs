using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Courses : Page
    {
        private const int PageSize = 9; // Number of courses per page

        // CurrentPage property
        public int CurrentPage
        {
            get => ViewState["CurrentPage"] != null ? (int)ViewState["CurrentPage"] : 1;
            set => ViewState["CurrentPage"] = value;
        }

        // TotalPages property
        public int TotalPages
        {
            get => ViewState["TotalPages"] != null ? (int)ViewState["TotalPages"] : 1;
            set => ViewState["TotalPages"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["QLcourse"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Get total count of courses
                SqlCommand countCommand = new SqlCommand("SELECT COUNT(*) FROM Courses", connection);
                int totalCourses = (int)countCommand.ExecuteScalar();
                TotalPages = (int)Math.Ceiling((double)totalCourses / PageSize);

                // Fetch courses for the current page
                SqlCommand queryCommand = new SqlCommand("SELECT CourseID, Title, Description, Duration, LecturesCount, Rating, Level, Category, ImageURL " +
                                                         "FROM Courses ORDER BY Title OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY", connection);
                queryCommand.Parameters.AddWithValue("@Offset", (CurrentPage - 1) * PageSize);
                queryCommand.Parameters.AddWithValue("@PageSize", PageSize);

                SqlDataReader reader = queryCommand.ExecuteReader();
                CourseRepeater.DataSource = reader;
                CourseRepeater.DataBind();

                // Bind pagination
                BindPagination();
            }
        }

        private void BindPagination()
        {
            List<int> pageNumbers = new List<int>();
            for (int i = 1; i <= TotalPages; i++)
            {
                pageNumbers.Add(i);
            }

            PageNumberRepeater.DataSource = pageNumbers;
            PageNumberRepeater.DataBind();
        }

        protected void PreviousPage_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                LoadCourses();
            }
        }

        protected void NextPage_Click(object sender, EventArgs e)
        {
            if (CurrentPage < TotalPages)
            {
                CurrentPage++;
                LoadCourses();
            }
        }

        protected void PageNumberRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Page")
            {
                CurrentPage = Convert.ToInt32(e.CommandArgument);
                LoadCourses();
            }
        }

        protected string RenderStars(double rating)
        {
            int fullStars = (int)Math.Floor(rating);
            int halfStars = (int)Math.Round(rating - fullStars);
            int emptyStars = 5 - fullStars - halfStars;

            string starsHtml = string.Empty;

            for (int i = 0; i < fullStars; i++)
                starsHtml += "<span class='star full'></span>";
            for (int i = 0; i < halfStars; i++)
                starsHtml += "<span class='star half'></span>";
            for (int i = 0; i < emptyStars; i++)
                starsHtml += "<span class='star empty'></span>";

            return starsHtml;
        }
    }
}
