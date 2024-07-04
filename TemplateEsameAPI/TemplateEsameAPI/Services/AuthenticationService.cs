using Dapper;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using MySqlConnector;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using TemplateEsameAPI.Models;

namespace TemplateEsameAPI.Services
{
    public class AuthenticationService(MySqlConnection _sqlService, IConfiguration configuration)
    {
        public bool UserExists(string username)
        {
            try
            {
                var sql = "SELECT COUNT(1) FROM users WHERE username = @Username";
                return _sqlService.ExecuteScalar<bool>(sql, new { Username = username });
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        public void RegisterUser(User user)
        {
            try
            {
                var sql = "INSERT INTO users (username, password, id_role) VALUES (@Username, @PasswordHash, 2)";
                _sqlService.Query(sql, user);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public User GetUserByUsername(string username)
        {
            try
            {
                var sql = "SELECT username, password as passwordHash FROM users WHERE username = @Username";
                return _sqlService.Query<User>(sql, new { Username = username }).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public string CreateToken(User user)
        {
            // Aggiungo al claim del token il mio username, al claim posso aggiungere molteplici info che poi vengono codificate nel token
            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Username)
            };

            //Chiave per creare il token e verificare il token
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration.GetSection("Jwt:Token").Value!));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                    claims: claims,
                    expires: DateTime.UtcNow.AddDays(1),
                    signingCredentials: creds
                );

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);

            return jwt;
        }
    }
}
