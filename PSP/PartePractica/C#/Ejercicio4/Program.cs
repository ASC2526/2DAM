using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejercicio4
{
    class Program
    {
        static async Task Main(string[] args)
        {
            int res = ContarPrimos(2000000);
            Console.WriteLine("¡Hola mundo!"); // Queremos que esta línea se ejecute mientras se calculan los primos
            Console.WriteLine(res); // Queremos que esta línea se ejecute cuando el cálculo haya finalizado
            Console.ReadKey();

        }

 
        public static int ContarPrimos(int limite)
        {
            int contador = 0;

            for (long i = 2; i < limite; i++)
            {
                if (EsPrimo(i))
                {
                    contador++;
                }
            }

            return contador;
        }

        public static bool EsPrimo(long n)
        {
            if (n < 2) return false;
            for (long i = 2; i * i <= n; i++)
            {
                if (n % i == 0)
                {
                    return false;
                }
            }
            return true;
        }


    }
}
