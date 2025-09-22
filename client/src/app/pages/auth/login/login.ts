import { HttpClient } from '@angular/common/http';
import { Component, inject, OnInit } from '@angular/core';
import { ReactiveFormsModule, FormGroup, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import { environment } from '../../../../environments/environment.development';
import { LoginService } from '../../../core/services/api/login/login';


@Component({
  selector: 'app-login',
  imports: [ReactiveFormsModule],
  templateUrl: './login.html',
  styleUrl: './login.css'
})
export class Login {

  router = inject(Router);
  loginService = inject(LoginService);

  loginForm: FormGroup = new FormGroup({
    role: new FormControl(""),
    username : new FormControl(""),
    password : new FormControl("")
  });


  onLogin() {
    const formValue = this.loginForm.value;
    const selectedRole = this.loginForm.get('role')?.value;

    this.loginService.onLogin(formValue).subscribe({
      next: (response:any) => {
        
        if(response && response.token){
          localStorage.setItem('token', response.token);
          localStorage.setItem('role', response.role);
          localStorage.setItem('userId', response.userId);

          console.log("Role from server: ", response.role);
          console.log("Selected Role: ", selectedRole);
          // debugger;

          if(response.role === 'CLIENT' && 
            this.loginForm.value.role === 'client'
          ){
            // debugger;
            this.router.navigateByUrl("/dashboard/client");
          }
          else if(response.role === 'AGENT' && 
            this.loginForm.value.role === 'agent'
          ){
            // debugger;
          this.router.navigateByUrl("/dashboard/agent");
          }
          else if(response.role !== selectedRole.toUpperCase()){
            alert(`You are registered as ${response.role}. Please select the correct role.`);
          }
        }
        else{
          alert("Invalid response from server.");
        }
      },
      error: (error) => {
        alert(error.error);
      }
    });
  }
}

//   private http = inject(HttpClient);
//   onLogin() {
//     const formValue = this.loginForm.value;
//     this.http.post(`${environment.apiUrl}/auth/login`, formValue).subscribe({
//       next: (response:any) => {
//         // if(response.result) {
//         //   alert('Login Successful');
//         //   this.router.navigateByUrl("/dashboard/client");
//         // }else{
//         //   alert(response.message);
//         // } 

        
//         // const token = response.token;
//         // const decoded = parseJwt(token); // decode JWT to get role

//         // localStorage.setItem('token', token);
//         // localStorage.setItem('role', decoded.role);

//         // if (decoded.role === 'client') {
//         //   this.router.navigate(['/dashboard/client']);
//         // } else if (decoded.role === 'agent') {
//         //   this.router.navigate(['/dashboard/agent']);
//         // }

//         debugger;

//         localStorage.setItem("token",response.accessToken);

//         if(response!=null){
//           this.router.navigateByUrl("/dashboard/client");
//           // console.log(response);
//         }

//       },
//       error: (error) => {
//         debugger;
//         alert(error.error);
//       }
//     });
//   } 
// }
