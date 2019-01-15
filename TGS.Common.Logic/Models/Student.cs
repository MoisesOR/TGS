using System;
using System.Collections.Generic;
using System.Text;

namespace TGS.Common.Logic.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Dni { get; set; }
        public DateTime BirthDate { get; set; }
        public int Age { get; set; }
        public DateTime CreationDate { get; set; }

        public Student()
        {

        }

        public Student(int id, string name, string lastName, string dni, int edad, DateTime birthDate)
        {
            //Log.Debug("Entra Persona");
            this.Id = id;
            this.Name = name;
            this.LastName = lastName;
            this.Dni = dni;
            this.Age = edad;
            this.BirthDate = birthDate;
            this.CreationDate = DateTime.Now;
            //Log.Debug("Sale Persona");
        }

        public Student(int id, string name, string lastName, string dni, int edad, DateTime birthDate, DateTime fechaHora, string guid)
        {
            //Log.Debug("Entra Persona");
            this.Id = id;
            this.Name = name;
            this.LastName = lastName;
            this.Dni = dni;
            this.Age = edad;
            this.BirthDate = birthDate;
            this.CreationDate = fechaHora;
            //Log.Debug("Sale Persona");
        }

        public override bool Equals(object obj)
        {
            //Log.Debug("Entra Equals");
            var persona = obj as Student;
            //Log.Debug("Sale Equals");
            return persona != null &&
                   Id == persona.Id &&
                   Name == persona.Name &&
                   LastName == persona.LastName &&
                   Dni == persona.Dni &&
                   BirthDate.ToString() == persona.BirthDate.ToString() &&
                   Age == persona.Age &&
                   CreationDate.ToString() == persona.CreationDate.ToString();
        }

        public override int GetHashCode()
        {
            //Log.Debug("Entra GetHashCode");
            var hashCode = 292974432;
            hashCode = hashCode * -1521134295 + Id.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Name);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(LastName);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Dni);
            hashCode = hashCode * -1521134295 + BirthDate.GetHashCode();
            hashCode = hashCode * -1521134295 + Age.GetHashCode();
            hashCode = hashCode * -1521134295 + CreationDate.GetHashCode();
            //Log.Debug("Sale GetHashCode");
            return hashCode;
        }
    }
}
