using Dapper;
using MySqlConnector;
using TemplateEsameAPI.Models;

namespace TemplateEsameAPI.Services
{
    public class FilmService(MySqlConnection sqlService)
    {
        public List<Film> GetFilms()
        {
            List<Film> filmsList = new List<Film>();
            try
            {
                var sql = "SELECT * FROM film";
                var films = sqlService.Query<Film>(sql);
                filmsList = films.ToList();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return filmsList;
        }

        public bool PostTest(Attore attore)
        {
            bool ret = false;
            try
            {
                var sql = $"INSERT INTO attore (nome, anno_nascita, nazionalita) VALUES ('{attore.nome}', {attore.anno_nascita}, '{attore.nazionalita}')";
                var result = sqlService.Query<Film>(sql);
                if(result != null)
                    ret = true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return ret;
        }
    }
}
