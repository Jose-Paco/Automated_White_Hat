#!/bin/bash


function 3_controlerror {
    trap '' INT TSTP # trap para recoger (atrapar) señales de control c y control z e invalidarlas
}
