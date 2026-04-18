namespace backend.Models
{
    public class Test
    {
        public int Id { get; set; }
        public int CourseId { get; set; }
        public string Questions { get; set; }
        public string Answer { get; set; }
        public int Difficulty { get; set; }
    }
}