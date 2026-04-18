using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace backend.Models;

[Table("test")]
public class Test
{
    [Key]
    [Column("id")]
    public int Id { get; set; }

    [Column("course_id")]
    public int CourseId { get; set; }

    [Column("questions")]
    public string Questions { get; set; } = null!;

    [Column("answer")]
    public string Answer { get; set; } = null!;

    [Column("difficulty")]
    public int Difficulty { get; set; }
}