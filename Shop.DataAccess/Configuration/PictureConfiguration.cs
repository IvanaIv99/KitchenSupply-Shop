using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Shop.Domain;

namespace Shop.DataAccess.Configuration
{
    public class PictureConfiguration : IEntityTypeConfiguration<Picture>
    {
        

        public void Configure(EntityTypeBuilder<Picture> builder)
        {
            builder.Property(x => x.ImagePath).HasMaxLength(200).IsRequired();
            builder.HasIndex(x => x.ImagePath).IsUnique();
        }
    }
}
