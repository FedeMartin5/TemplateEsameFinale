using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TemplateEsameAPI.Models;
using TemplateEsameAPI.Services;

namespace TemplateEsameAPI.Controllers
{
    [Route("[controller]/[action]")]
    [ApiController]
    public class FilmController(FilmService filmService) : Controller
    {
        [HttpGet]
        [Authorize]
        public ActionResult<List<Film>> Test()
        {
            try
            {
                List<Film> data = filmService.GetFilms();

                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                return Ok(data);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "internal server error");
            }
        }

        [HttpPost]
        public ActionResult<bool> PostTest(Attore attore)
        {
            try
            {
                bool ret = filmService.PostTest(attore);

                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }

                return Ok(ret);
            }
            catch (Exception ex)
            {
               return StatusCode(500, "internal server error");
            }
        }
    }
}
