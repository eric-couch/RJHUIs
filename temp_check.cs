using System;
using System.Reflection;
using System.Linq;

// Load from the bin folder after a build
var binPath = @"c:\Users\ericc\source\repos\ReeseJonesHoldingsUIs\ReeseJonesHoldingsUIs\bin";
var dllFiles = System.IO.Directory.GetFiles(binPath, "DevExpress.Web.*.dll", System.IO.SearchOption.AllDirectories);

foreach(var dll in dllFiles) {
    try {
        var asm = Assembly.LoadFrom(dll);
        var types = asm.GetTypes().Where(t => 
            t.Name.Contains("Inserting") || 
            t.Name.Contains("Updating") || 
            t.Name.Contains("Deleting")).ToList();
        
        if(types.Any()) {
            Console.WriteLine($"Assembly: {asm.GetName().Name}");
            foreach(var type in types) {
                Console.WriteLine($"  {type.FullName}");
            }
        }
    } catch { }
}
