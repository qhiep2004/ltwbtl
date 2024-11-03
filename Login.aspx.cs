using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace BTL
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ErrorMessage.Text = "";  // Xóa các thông báo lỗi trước đó
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string email = emailInput.Value;
            string password = passInput.Value;
            string hashedPassword = HashPassword(password);

            string connectionString = ConfigurationManager.ConnectionStrings["QLcourse"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash", conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                conn.Open();
                int userCount = (int)cmd.ExecuteScalar();

                if (userCount > 0)
                {
                    // Đăng nhập thành công
                    Session["UserEmail"] = email;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    // Đăng nhập thất bại
                    ErrorMessage.Text = "Invalid email or password.";
                    ErrorMessage.Visible = true;
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
