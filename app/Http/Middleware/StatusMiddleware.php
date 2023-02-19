<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class StatusMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (auth()->check()) {
            if (auth()->user()->status == 0) {
                auth()->logout();

                return redirect()->route('login')->with('message', "Your Account is in active. For futher details please contact admin");
            }
        }
        return $next($request);
    }
}
