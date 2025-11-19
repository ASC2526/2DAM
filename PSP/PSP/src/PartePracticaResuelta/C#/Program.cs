using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejercicios
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Task<int> t = TareaCostosaAsync();
            Console.WriteLine("Este mensaje se debería mostrar mientras se realiza la tarea costosa");
            Console.WriteLine("El resultado de la tarea costosa debería mostrarse en cuanto finalice");
            int res = await t;
            Console.WriteLine(res);
            Console.ReadKey();
        }

        /* Método que simula una tarea costosa que devuelve un número. 
         * No podemos modificar su código ni firma */

        static int TareaCostosa()
        {
            Task.Delay(2000).Wait();
            Random r = new Random();
            return r.Next();
        }

        static async Task<int> TareaCostosaAsync()
        {
            int res = await Task.Run(() =>
            {
                return TareaCostosa();
            });

            return res;

        }
    }
}
