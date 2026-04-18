using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("test")]
    public class Test
    {
        [Key]
        public int Id { get; set; }

        [Column("course_id")]
        public int CourseId { get; set; }

        [Column("questions")]
        public string Questions { get; set; } = string.Empty;

        [Column("answer")]
        public string Answer { get; set; } = string.Empty;

        [Column("difficulty")]
        public int Difficulty { get; set; }

        [Column("class_id")]
        public int ClassId { get; set; }

        [Column("subject")]
        public string Subject { get; set; } = string.Empty;

        [Column("lesson_id")]
        public int LessonId { get; set; }
    }
}