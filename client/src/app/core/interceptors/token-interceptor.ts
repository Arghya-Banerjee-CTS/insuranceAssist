import { HttpErrorResponse, HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { Router } from '@angular/router';
import { catchError, throwError } from 'rxjs';

export const tokenInterceptor: HttpInterceptorFn = (req, next) => {

  const router = inject(Router);

  if (req.url.includes('/api/v1/public/login')||req.url.includes('/api/v1/public/register')) {
    return next(req);
  }
  const token = localStorage.getItem('token');

  const newReq = token ? req.clone({headers: req.headers.set('Authorization', `Bearer ${token}`),}) : req;

  
  // return next(newReq) ;

  return next(newReq).pipe(
    catchError((error: HttpErrorResponse) => {
      if (error.status === 401) {
        localStorage.clear();
        router.navigate(['/auth']);
        alert("Token expired: You are being logged out. Login again please.");
      }
      return throwError(() => error);
    })
  );
};
