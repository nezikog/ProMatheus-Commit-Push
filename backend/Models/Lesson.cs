using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models
{
    [Table("lesson")]
    public class Lesson
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("title")]
        public string Title { get; set; } = string.Empty;

        [Column("text")]
        public string Text { get; set; } = string.Empty;

        [Column("course_id")]
        public int CourseId { get; set; }

        [Column("class_id")]
        public int ClassId { get; set; }

    }
}