# Matlab Toolbox for X-13 Seasonal Filtering

The X-13 Toolbox for Matlab is a shell for interacting with the programs of the US Census Bureau, known as X-13ARIMA-SEATS, that perform seasonal filtering. The X-13 programs are the "industry standard" and are widely used by many statistical agencies and researchers. The toolbox ought therefore to be useful for statisticians or economists who use Matlab, and who lacked access to the standard seasonal adjustment method until now.

The toolbox contains a graphical user interface, called guix, that allows you to perform X-13 computations interactively. This can be useful for novice as well as expert users and is probably to best way to learn about the possibilities of X13.
The toolbox contains a documentation in a PDF as well as demo files that should help you understand how to use the toolbox. The X-13 program has a plethora of specifications one can fiddle around with. The best source to learn this is the original US Census Bureau documentation. Their website also has working papers devoted to this topic (see https://www.census.gov/srd/www/x13as/).

The toolbox supports the X-13ARIMA-SEATS and the X-12-ARIMA programs of the US Census Bureau. The older X-11 program is not supported, though. An approximate version of X-11 is implemented in Matlab as part of this toolbox. In addition, the toolbox contains some other programs that are independent of the Census programs. These programs (x11, method1, fixedseas, seas, camplet) can be used with arbitrary frequencies, not just monthly or quarterly data like the Census programs.

Note: To get the complete functionality the toolbox requires freely available executables from the US Census Bureau in order to run. It attempts to download these executables automatically for you whenever you need one that is not on your harddrive. Of course, that works only if you are online, and it is limited to Windows computers. Versions of these programs for other operating systems are available from the Census website, however, and can easily be installed manually.

Please comment below if you find this software useful ... or lacking.

### Cite As

Yvan Lengwiler (2024). X-13 Toolbox for Seasonal Filtering, [github/fengineering-ch/x13tbx¨(https://github.com/fengineering-ch/x13tbx). Retrieved March 13, 2024.
