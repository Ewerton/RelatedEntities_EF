//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EF_TESTE
{
    using System;
    using System.Collections.Generic;
    
    public partial class Fisioterapeuta
    {
        public Fisioterapeuta()
        {
            this.Paciente = new HashSet<Paciente>();
        }
    
        public int Id { get; set; }
        public string Nome { get; set; }
    
        public virtual ICollection<Paciente> Paciente { get; set; }
    }
}
