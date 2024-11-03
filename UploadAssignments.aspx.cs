using System;
using System.IO;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace BTL
{
    public partial class UploadAssignments : System.Web.UI.Page
    {
        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    // Get course ID from TextBox
                    int courseId;
                    if (!int.TryParse(CourseIdTextBox.Text, out courseId))
                    {
                        StatusLabel.Text = "Vui lòng nhập ID khóa học hợp lệ.";
                        return;
                    }

                    // Get assignment details
                    string assignmentName = AssignmentNameTextBox.Text;
                    DateTime dueDate;

                    // Parse due date
                    if (!DateTime.TryParse(DueDateTextBox.Text, out dueDate))
                    {
                        StatusLabel.Text = "Vui lòng nhập ngày hạn hợp lệ.";
                        return;
                    }

                    // File upload handling
                    string fileName = Path.GetFileName(FileUploadControl.FileName);
                    string filePath = "/Uploads/" + fileName;
                    FileUploadControl.SaveAs(Server.MapPath(filePath));

                    // Database insertion
                    string connectionString = WebConfigurationManager.ConnectionStrings["QLcourse"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Assignments (CourseId, AssignmentName, DueDate, AssignmentUrl) VALUES (@CourseId, @AssignmentName, @DueDate, @AssignmentUrl)";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@CourseId", courseId);
                        cmd.Parameters.AddWithValue("@AssignmentName", assignmentName);
                        cmd.Parameters.AddWithValue("@DueDate", dueDate);
                        cmd.Parameters.AddWithValue("@AssignmentUrl", filePath);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    StatusLabel.Text = "Tải lên bài tập thành công!";
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
