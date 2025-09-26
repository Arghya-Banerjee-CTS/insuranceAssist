import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, inject } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { environment } from '../../../../../../environments/environment.development';
import { Claim } from '../../../../../core/services/api/claim/claim';

@Component({
  selector: 'app-client-new-claim',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './client-new-claim.html',
  styleUrl: './client-new-claim.css'
})
export class ClientNewClaim {

  private fb = inject(FormBuilder);
  private claimService = inject(Claim);
  private http = inject(HttpClient);

  newClaimForm: FormGroup = new FormGroup({});

  policyDetails = {
        policyID: "",  tier: "", startDate: "", endDate: "", premium: "", remainingCoverage: ""

      }

  ngOnInit(){
    this.newClaimForm = this.fb.group({
         claimType: ['', Validators.required],
         procedureNotes: ['', Validators.required],
         claimAmount: ['', [Validators.required, Validators.pattern('^[0-9]+$')]],
      });

      const userId = localStorage.getItem('userId');
      

      this.http.get(`${environment.apiUrl}/private/policy/get/${userId}`).subscribe({
        next: (res) => {
          // console.log('API is reachable:', res);
          this.policyDetails = res as any; 
          
        },
        error: (err) => {
          console.error('API is not reachable:', err);
        }
      });
  }

  onCreateClaim() {

      const claimDetails = { 
        clientId: localStorage.getItem('userId'), 
        claimType: this.newClaimForm.get('claimType')?.value,
        procedureNotes: this.newClaimForm.get('procedureNotes')?.value,
        claimAmount: this.newClaimForm.get('claimAmount')?.value
      };

      console.log(claimDetails);

      if(this.newClaimForm.valid){
        this.claimService.onCreateClaim(claimDetails).subscribe({
          next: (res: any) => {
            alert('Claim created successfully!');
          },
          error: (err: any) => {
            console.error('Error creating claim:', err);  
            alert('Failed to create claim. Please try again.');
          }
        });
      }
    }
}
