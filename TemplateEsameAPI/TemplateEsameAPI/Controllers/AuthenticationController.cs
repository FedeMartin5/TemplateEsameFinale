using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using TemplateEsameAPI.DTO;
using TemplateEsameAPI.Models;
using TemplateEsameAPI.Services;

namespace TemplateEsameAPI.Controllers
{
    [Route("[controller]/[action]")]
    [ApiController]
    public class AuthenticationController(IConfiguration configuration, AuthenticationService _authenticationService) : Controller
    {
        [HttpPost]
        public ActionResult<string> Register(UserDto request)
        {
            // Controllo se l'utente esiste già
            if (_authenticationService.UserExists(request.Username))
            {
                return BadRequest("L'utente esiste già");
            }

            // Genero l'Hash della password con la libreria BCrypt
            string passwordHash = BCrypt.Net.BCrypt.HashPassword(request.Password);

            var user = new User
            {
                Username = request.Username,
                PasswordHash = passwordHash
            };

            _authenticationService.RegisterUser(user);

            string token = _authenticationService.CreateToken(user);

            return Ok(token);
        }

        [HttpPost]
        public ActionResult<string> Login(UserDto request)
        {
            var user = _authenticationService.GetUserByUsername(request.Username);
            if (user == null || !BCrypt.Net.BCrypt.Verify(request.Password, user.PasswordHash))
            {
                return BadRequest("Credenziali Errate");
            }

            string token = _authenticationService.CreateToken(user);
            return Ok(token);
        }

       
    }
}
