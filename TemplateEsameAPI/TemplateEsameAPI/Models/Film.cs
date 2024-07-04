namespace TemplateEsameAPI.Models
{
    public class Film
    {
        public int codice_film { get; set; }
        public string titolo { get; set; }
        public short anno_produzione { get; set; }
        public string nazionalita { get; set; }
        public string regista { get; set; }
        public string genere { get; set; }
        public short durata { get; set; }
    }
}
