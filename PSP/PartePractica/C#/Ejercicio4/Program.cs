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
            Task<string> t1 = CargarTemperaturaAsync();
            Task<string> t2 = CargarHumedadAsync();
            Task<string> t3 = CargarPresionAsync();

            Console.WriteLine("Este mensaje debería aparecer mientras se cargan los sensores...");

            string temperatura = await t1;
            string humedad = await t2;
            string presion = await t3;

            Console.WriteLine("Temperatura: " + temperatura);
            Console.WriteLine("Humedad: " + humedad);
            Console.WriteLine("Presión: " + presion);

            Console.ReadKey();
        }

        public static string CargarTemperatura()
        {
            Task.Delay(2000).Wait();
            return "22ºC";
        }

        public static Task<string> CargarTemperaturaAsync()
        {
            return Task.Run(() => CargarTemperatura());
        }

        public static string CargarHumedad()
        {
            Task.Delay(3000).Wait();
            return "45%";
        }

        public static Task<string> CargarHumedadAsync()
        {
            return Task.Run(() => CargarHumedad());
        }
        public static string CargarPresion()
        {
            Task.Delay(1500).Wait();
            return "1013 hPa";
        }
        public static Task<string> CargarPresionAsync()
        {
            return Task.Run(() => CargarPresion());
        }


    }
}
