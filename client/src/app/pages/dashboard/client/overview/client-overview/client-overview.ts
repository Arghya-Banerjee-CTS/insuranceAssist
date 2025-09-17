import { CommonModule } from '@angular/common';
import { inject, Injectable } from '@angular/core';
import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../../../environments/environment.development';

@Component({
  selector: 'app-client-overview',
  imports: [CommonModule],
  standalone: true,
  templateUrl: './client-overview.html',
  styleUrl: './client-overview.css'
})
export class ClientOverview {
  http = inject(HttpClient);
  // router = inject(Router);

  hospital(){
    console.log("hospital called");
    this.http.get( `${environment.apiUrl}/private/hospital/get`).subscribe({
      next: (response:any) => {
        console.log(response);
        },
      error: (error) => {
        alert(error.error);
      }
    });
  }
  

  


}
