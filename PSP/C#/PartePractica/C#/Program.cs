using System;
using System.Threading.Tasks;

namespace Ejercicios
{
    class Program
    {
        static async Task Main(string[] args)
        {
            // Llamamos a la versión ASÍNCRONA
            Task<int> tarea = TareaCostosaAsync();

            // ESTE MENSAJE debe aparecer mientras la tarea se ejecuta
            Console.WriteLine("Este mensaje se debería mostrar mientras se realiza la tarea costosa, no cuando finaliza");

            // Ahora sí esperamos el resultado
            int resultado = await tarea;

            // Resultado cuando ya ha terminado
            Console.WriteLine(resultado);

            Console.ReadKey();
        }

        static int TareaCostosa()
        {
            Task.Delay(2000).Wait();
            Random r = new Random();
            return r.Next();
        }

        // Método asíncrono que ejecuta la tarea costosa en un hilo del threadpool
        static Task<int> TareaCostosaAsync()
        {
            return Task.Run(() => TareaCostosa());
        }
    }
}
