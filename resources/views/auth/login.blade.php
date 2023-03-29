@extends('layouts.app')

@section('content')
    {{--<div class="wrapper vh-100">
        <div class="row align-items-center h-100">

          <form class="col-lg-3 col-md-4 col-10 mx-auto text-center" method="POST" action="{{ route('login') }}">
              @csrf
              @if(session()->has('message'))
            <p class="alert alert-info">
                {{ session()->get('message') }}
            </p>
            @endif
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('home') }}">
              <svg version="1.1" id="logo" class="navbar-brand-img brand-md" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
                <g>
                  <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
            </a>
            <h1 class="h6 mb-3">Sign in</h1>

            <div class="form-group">
              <label for="inputEmail" class="sr-only">Email address</label>
              <input id="email" type="email" class="form-control form-control-lg @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
            <div class="form-group">
              <label for="inputPassword" class="sr-only">Password</label>
             <input type="password" id="inputPassword" name="password" class="form-control form-control-lg" placeholder="Password" required="">
          <input id="password" type="password" class="form-control form-control-lg @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

          @error('password')
              <span class="invalid-feedback" role="alert">
                  <strong>{{ $message }}</strong>
              </span>
          @enderror
        </div>
        <div class="checkbox mb-3">
          <label>
            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Stay logged in </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Let me in</button>
        @if (Route::has('password.request'))
          <a class="btn btn-link" href="{{ route('password.request') }}">
              {{ __('Forgot Your Password?') }}
          </a>
      @endif
        <p class="mt-5 mb-3 text-muted">Docuhub© 2023</p>
      </form>
    </div>
  </div>
--}}
    <!-- Section: Design Block -->
    <section>
        <div class="px-2 py-3 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
            <div class="container">
                <div class="row gx-lg-5 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <h2 class="my-3 display-6 fw-bold ls-tight">
                            Trusted and Secured<br/>
                            <span class="text-primary">Document Management System </span>
                        </h2>
                        {{--                            <ul style="color: hsl(217, 10%, 50.8%)">--}}
                        {{--                                <li>HIPAA Compliant</li>--}}
                        {{--                                <li>HTTPS Transport Encryption</li>--}}
                        {{--                                <li>AES 256 Storage Encryption</li>--}}
                        {{--                                <li>Cloud-Based Implementation</li>--}}
                        {{--                                <li>End-to-End Workflow Solution</li>--}}
                        {{--                            </ul>--}}
                        <p>
                            Our HIPAA-compliant document management system offers a secure and trusted solution for healthcare providers to manage their documents digitally. Our cloud-based implementation protects sensitive patient information with HTTPS transport encryption and AES 256 storage encryption.
                        </p>
                        <p style="color: hsl(217, 10%, 50.8%)">
                            We are eliminating the challenges of paper files management and forms by introducing an easy to use document management software that has:
                        </p>
                        <ul style="color: hsl(217, 10%, 50.8%)">
                            <li>Data Security and Integrity</li>
                            <li>Structured Data Storage in One Place</li>
                            <li>Regular Data Backups</li>
                        </ul>
                    </div>
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card">
                            <div class="card-body py-5 px-md-5">
                                <form method="POST" action="{{ route('login') }}">
                                    @csrf
                                    @if(session()->has('message'))
                                        <p class="alert alert-info">
                                            {{ session()->get('message') }}
                                        </p>
                                    @endif
                                    <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('home') }}">
                                        <h2 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign in</h2>
                                    </a>

                                    <div class="form-group">
                                        <label for="inputEmail" class="form-label">Email address</label>
                                        <input id="email" type="email" class="form-control form-control-lg @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                        {{--                            <label class="form-label" for="inputEmail">Email address</label>--}}
                                        @error('email')
                                        <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword" class="form-label">Password</label>
                                        {{-- <input type="password" id="inputPassword" name="password" class="form-control form-control-lg" placeholder="Password" required=""> --}}
                                        <input id="password" type="password" class="form-control form-control-lg @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                        @error('password')
                                        <span class="invalid-feedback" role="alert">
{{--              <strong>{{ $message }}</strong>--}}
          </span>
                                        @enderror
                                    </div>
                                    <div class="checkbox mb-3">
                                        <label>
                                        {{--                            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> Stay logged in </label>--}}
                                    </div>
                                    <button class="btn btn-info btn-lg btn-block" type="submit">Let me in</button>
                                    @if (Route::has('password.request'))
                                        <p class="small mb-5 pb-lg-2">  <a class="text-muted" href="{{ route('password.request') }}">
                                                {{ __('Forgot Password?') }}
                                            </a></p>
                                    @endif
                                    <p class="mt-5 mb-3 text-muted text-center">Docuhub© 2023</p>
                                    {{--                        <div class="form-outline mb-4">
                                                            <input type="email" id="form2Example18" class="form-control form-control-lg" />
                                                            <label class="form-label" for="form2Example18">Email address</label>
                                                        </div>

                                                        <div class="form-outline mb-4">
                                                            <input type="password" id="form2Example28" class="form-control form-control-lg" />
                                                            <label class="form-label" for="form2Example28">Password</label>
                                                        </div>

                                                        <div class="pt-1 mb-4">
                                                            <button class="btn btn-info btn-lg btn-block" type="button">Login</button>
                                                        </div>

                                                        <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>
                                                        <p>Don't have an account? <a href="#!" class="link-info">Register here</a></p>
                                                --}}
                                </form>
                                {{--                               <form>
                                                                   <!-- 2 column grid layout with text inputs for the first and last names -->
                                                                   <div class="row">
                                                                       <div class="col-md-6 mb-4">
                                                                           <div class="form-outline">
                                                                               <input type="text" id="form3Example1" class="form-control" />
                                                                               <label class="form-label" for="form3Example1">First name</label>
                                                                           </div>
                                                                       </div>
                                                                       <div class="col-md-6 mb-4">
                                                                           <div class="form-outline">
                                                                               <input type="text" id="form3Example2" class="form-control" />
                                                                               <label class="form-label" for="form3Example2">Last name</label>
                                                                           </div>
                                                                       </div>
                                                                   </div>

                                                                   <!-- Email input -->
                                                                   <div class="form-outline mb-4">
                                                                       <input type="email" id="form3Example3" class="form-control" />
                                                                       <label class="form-label" for="form3Example3">Email address</label>
                                                                   </div>

                                                                   <!-- Password input -->
                                                                   <div class="form-outline mb-4">
                                                                       <input type="password" id="form3Example4" class="form-control" />
                                                                       <label class="form-label" for="form3Example4">Password</label>
                                                                   </div>

                                                                   <!-- Checkbox -->
                                                                   <div class="form-check d-flex justify-content-center mb-4">
                                                                       <input class="form-check-input me-2" type="checkbox" value="" id="form2Example33" checked />
                                                                       <label class="form-check-label" for="form2Example33">
                                                                           Subscribe to our newsletter
                                                                       </label>
                                                                   </div>

                                                                   <!-- Submit button -->
                                                                   <button type="submit" class="btn btn-primary btn-block mb-4">
                                                                       Sign up
                                                                   </button>

                                                                   <!-- Register buttons -->
                                                                   <div class="text-center">
                                                                       <p>or sign up with:</p>
                                                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                                                           <i class="fab fa-facebook-f"></i>
                                                                       </button>

                                                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                                                           <i class="fab fa-google"></i>
                                                                       </button>

                                                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                                                           <i class="fab fa-twitter"></i>
                                                                       </button>

                                                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                                                           <i class="fab fa-github"></i>
                                                                       </button>
                                                                   </div>
                                                               </form> --}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
