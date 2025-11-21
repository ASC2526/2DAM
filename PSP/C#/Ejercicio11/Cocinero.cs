using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Ejercicio11
{
    class Cocinero
    {
        public async Task<Caldo> PrepararCaldo()
        {
            Console.WriteLine("Preparando caldo...");
            await Task.Delay(5000);
            Caldo c = new Caldo();
            Console.WriteLine("Caldo preparado.");
            return c;
        }

        public async Task CalentarPaella(Paella p)
        {
            Console.WriteLine("Calentando aceite en la paella...");
            await Task.Delay(2000);
            p.Caliente = true;
            Console.WriteLine("Aceite caliente.");
        }

        public async Task SofreirIngredientes(Paella p, List<string> i)
        {
            // Espera activa hasta que la paella esté caliente
            while (!p.Caliente)
                await Task.Delay(100);

            if (p.AñadirIngredientes(i))
            {
                Console.WriteLine("Sofriendo ingredientes...");
                await Task.Delay(3000);
                Console.WriteLine("Ingredientes sofritos.");
            }
        }

        public async Task EcharCaldo(Paella p, Caldo c)
        {
            Console.WriteLine("Echando caldo a la paella...");
            p.AñadirCaldo(c);
            await Task.Delay(1000);
            Console.WriteLine("Caldo echado a la paella.");
        }

        public async Task Cocinar(Paella p)
        {
            Console.WriteLine("Cocinando paella...");
            await Task.Delay(5000);
            p.Cocinar();
            Console.WriteLine("Paella terminada.");
        }
    }
}
