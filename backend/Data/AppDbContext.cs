using Microsoft.EntityFrameworkCore;
using backend.Models;

namespace backend.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Test> Tests { get; set; }
        public DbSet<UserTestResult> UserTestResults { get; set; }
        public DbSet<Class> Classes { get; set; }
        public DbSet<CourseClass> CourseClasses { get; set; }
        public DbSet<UserCourse> UserCourses { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // User mapping
            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("user");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Name).HasColumnName("name");
                entity.Property(e => e.Email).HasColumnName("email");
                entity.Property(e => e.Password).HasColumnName("password");
            });
            
            // Course mapping
            modelBuilder.Entity<Course>(entity =>
            {
                entity.ToTable("course");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Name).HasColumnName("name");
                entity.Property(e => e.Path).HasColumnName("path");
                entity.Property(e => e.Img).HasColumnName("img");
            });
            
            // Test mapping
            modelBuilder.Entity<Test>(entity =>
            {
                entity.ToTable("test");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.CourseId).HasColumnName("course_id");
                entity.Property(e => e.Questions).HasColumnName("questions");
                entity.Property(e => e.Answer).HasColumnName("answer");
                entity.Property(e => e.Difficulty).HasColumnName("difficulty");
            });
        }
    }
}