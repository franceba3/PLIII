from numpy import loadtxt
from matplotlib.pyplot import plot,show,xlabel,ylabel,figure,rcParams,legend,title



#señal un pico
uno=loadtxt(("cuadrada reconstruida un picoA.txt"),float)
t2=uno[:,0]
i2=uno[:,1]
rcParams["font.size"]="16"
f=figure()
f.set_figheight(8)
f.set_figwidth(20)
plot(t2,i2)
xlabel("Tiempo (s)",fontsize=20)
ylabel("Voltaje (V)",fontsize=20)
title("Reconstrucción de señal cuadrada usando el pico más intenso del espectro de Fourier")
show()


#señal dos picos
dos=loadtxt(("cuadrada reconstruida dos picosA.txt"),float)
t3=dos[:,0]
i3=dos[:,1]
rcParams["font.size"]="16"
f=figure()
f.set_figheight(8)
f.set_figwidth(20)
plot(t3,i3)
xlabel("Tiempo (s)",fontsize=20)
ylabel("Voltaje (V)",fontsize=20)
title("Reconstrucción de señal cuadrada usando los dos picos más intensos del espectro de Fourier")
show()


#señal tres picos
tres=loadtxt(("cuadrada reconstruida tres picosA.txt"),float)
t4=tres[:,0]
i4=tres[:,1]
rcParams["font.size"]="16"
f=figure()
f.set_figheight(8)
f.set_figwidth(20)
plot(t4,i4)
xlabel("Tiempo (s)",fontsize=20)
ylabel("Voltaje (V)",fontsize=20)
title("Reconstrucción de señal cuadrada usando los tres picos más intensos del espectro de Fourier")
show()


#señal todos picos
todos=loadtxt(("cuadrada reconstruida todos los picosA.txt"),float)
t=todos[:,0]
i=todos[:,1]
rcParams["font.size"]="16"
f=figure()
f.set_figheight(8)
f.set_figwidth(20)
plot(t,i)
xlabel("Tiempo (s)",fontsize=20)
ylabel("Voltaje (V)",fontsize=20)
title("Reconstrucción de señal cuadrada usando todos los picos del espectro de Fourier")
show()


#todas juntas
f=figure()
f.set_figheight(8)
f.set_figwidth(20)
rcParams['font.size'] = '16'
plot(uno[:,0],uno[:,1],label="Un pico")
plot(t3,i3,label="Dos picos")
plot(t4,i4,label="Tres picos")
plot(t,i,label="Todos los picos")
xlabel("Tiempo (s)",fontsize=20)
ylabel("Voltaje (V)",fontsize=20)
title("Reconstrucción de la señal cuadrada")
legend()
show()
