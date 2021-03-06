/*
  LFA Lab - Library to simplify local Fourier analysis.
  Copyright (C) 2018  Hannah Rittich

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program; if not, write to the Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

// vim: set filetype=cpp:

%include "MultiArray.i"

%template(MultiArrayComplex) MultiArray<std::complex<double> >;
%rename(_DenseStencil) DenseStencil;
class DenseStencil : public MultiArray<std::complex<double> >
{
    public:
        DenseStencil(
                ArrayFi start = ArrayFi::Zero(1),
                ArrayFi end = ArrayFi::Zero(1) );

        ~DenseStencil();

        void resize(ArrayFi start, ArrayFi end);

        void setZero(int dim);
        void setIdentity(int dim);

        DenseStencil diag() const;

        %extend {
            std::string __str__() {
                std::stringstream ss;
                ss << *$self;
                return ss.str();
            }
        }
};


