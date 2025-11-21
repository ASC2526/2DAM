using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejercicio11
{
    class Program
    {
        static async Task Main(string[] args)
        {
            Cocinero cocinero = new Cocinero();
            Paella p = new Paella();

            // Preparar caldo
            Caldo c = await cocinero.PrepararCaldo();

            // Calentar paella y sofreir ingredientes
            Task tarea1 = cocinero.CalentarPaella(p);
            Task tarea2 = cocinero.SofreirIngredientes(p, new List<string>(){ "tomate", "pollo", "judías planas", "garrafó", "arroz"});

            await tarea1;
            await tarea2;
            // Echar el caldo
            await cocinero.EcharCaldo(p, c);

            //Cocinar
            await cocinero.Cocinar(p);

            Console.WriteLine("Paella lista: " + p);
            Console.ReadKey();

        }
    }
}
