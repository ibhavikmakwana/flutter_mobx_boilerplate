/*
 * BSD 2-Clause License
 *
 * Copyright (c) 2020, Bhavik Makwana
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

//
// You can use [Spider](https://github.com/BirjuVachhani/spider) package
// by [Birju Vachhani](https://github.com/BirjuVachhani) to generate Assets dart code from assets folder.
//
class SVGs {
  static const String _basePath = 'assets/svg';
  // Use `ic` keyword to identify that your image is an Icon.
  static const String icSomeName = '$_basePath/icNameOfTheSvg.svg';
  // Use `img` keyword to identify that your image is not an icon but bigger image.
  // Something like your on boarding assets,
  static const String imgSomeName = '$_basePath/imgNameOfTheSvg.svg';
}

class PNGs {
  static const String _basePath = 'assets/img';
  // Use `ic` keyword to identify that your image is an Icon.
  static const String icSomeName = '$_basePath/ic=mgNameOfTheSvg.svg';
  static const String imgSomeName = '$_basePath/icNameOfTheSvg.svg';
}
