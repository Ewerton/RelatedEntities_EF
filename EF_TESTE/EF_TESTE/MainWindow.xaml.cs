using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EF_TESTE
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            // Cleaning up the database

            using (var ctx = new Model1Container())
            {
                foreach (var item in ctx.Set<Paciente>().ToList())
                {
                    ctx.Set<Paciente>().Remove(item);
                    ctx.SaveChanges();
                }


                foreach (var item in ctx.Set<Fisioterapeuta>().ToList())
                {
                    ctx.Set<Fisioterapeuta>().Remove(item);
                    ctx.SaveChanges();
                }
            }



        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Fisioterapeuta f = new Fisioterapeuta();
            f.Nome = "Fisioterapeuta1";


            using (var ctx = new Model1Container())
            {
                ctx.Set<Fisioterapeuta>().Add(f);
                ctx.SaveChanges();
            }


            Fisioterapeuta f2 = new Fisioterapeuta();
            using (var ctx = new Model1Container())
            {
                f2 = ctx.Set<Fisioterapeuta>().FirstOrDefault();
            }


            Paciente p = new Paciente();
            p.Nome = "Paciente1";
            p.Fisioterapeuta = f2;

            using (var ctx = new Model1Container())
            {
                ctx.Set<Paciente>().Add(p);
                ctx.SaveChanges();
            }


            List<Fisioterapeuta> lstFisio = new List<Fisioterapeuta>();
            List<Paciente> lstPaciente = new List<Paciente>();
            using (var ctx = new Model1Container())
            {
                lstFisio = ctx.Set<Fisioterapeuta>().ToList();
                lstPaciente = ctx.Set<Paciente>().ToList();
            }

            dgFisioterapeuta.ItemsSource = lstFisio;
            dgPaciente.ItemsSource = lstPaciente;

        }
    }
}
