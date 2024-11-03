using System;
using System.IO;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace BTL
{
    public partial class UploadMaterials : System.Web.UI.Page
    {
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    // Get the course ID from the TextBox instead of the QueryString
                    int courseId;
                    if (!int.TryParse(CourseIdTextBox.Text, out courseId))
                    {
                        StatusLabel.Text = "Vui lòng nhập ID khóa học hợp lệ.";
                        return;
                    }

                    string fileName = Path.GetFileName(FileUploadControl.FileName);
                    string filePath = "/Uploads/" + fileName;
                    FileUploadControl.SaveAs(Server.MapPath(filePath));

                    // Set the MaterialName and MaterialUrl
                    string materialName = fileName; // Using file name as MaterialName
                    string materialUrl = filePath;   // Using file path as MaterialUrl

                    string connectionString = WebConfigurationManager.ConnectionStrings["QLcourse"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        // Update SQL query to match the new table structure
                        string query = "INSERT INTO Materials (CourseId, MaterialName, MaterialUrl) VALUES (@CourseId, @MaterialName, @MaterialUrl)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@CourseId", courseId);
                        cmd.Parameters.AddWithValue("@MaterialName", materialName);
                        cmd.Parameters.AddWithValue("@MaterialUrl", materialUrl);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    StatusLabel.Text = "Tải lên thành công!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Lỗi: " + ex.Message;
                }
            }
            else
            {
                StatusLabel.Text = "Vui lòng chọn tệp để tải lên.";
            }
        }
    }
}
