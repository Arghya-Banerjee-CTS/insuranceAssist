import { Component, inject } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../../environments/environment.development';

interface PlanDetails {
  id: number;
  name: string;
  basePremium: number;
  coverage: string;
  proceduresInsured: string;
  deductible: number;
  premiumPerDependent: number;
}

@Component({
  selector: 'app-client-register-policy',
  imports: [ReactiveFormsModule],
  templateUrl: './client-register-policy.html',
  styleUrl: './client-register-policy.css'
})



export class ClientRegisterPolicy {

  private http = inject(HttpClient);
  private router = inject(Router);
  private fb = inject(FormBuilder);


  choosePlanForm: FormGroup = this.fb.group({
    plan: ['', Validators.required]
  });
  

  plans: PlanDetails[] = [
    {
      id: 0,
      name: 'Basic',
      basePremium: 1000,
      coverage: '₹1,00,000',
      proceduresInsured: 'General Consultation, Diagnostics',
      deductible: 500,
      premiumPerDependent: 200
    },
    {
      id: 1,
      name: 'Bronze',
      basePremium: 2000,
      coverage: '₹2,50,000',
      proceduresInsured: 'General + Outpatient',
      deductible: 400,
      premiumPerDependent: 350
    },
    {
      id: 2,
      name: 'Silver',
      basePremium: 3500,
      coverage: '₹5,00,000',
      proceduresInsured: 'General + Outpatient + Dental',
      deductible: 300,
      premiumPerDependent: 500
    },
    {
      id: 3,
      name: 'Gold',
      basePremium: 5000,
      coverage: '₹10,00,000',
      proceduresInsured: 'All Silver + Maternity',
      deductible: 200,
      premiumPerDependent: 700
    },
    {
      id: 4,
      name: 'Platinum',
      basePremium: 8000,
      coverage: '₹20,00,000',
      proceduresInsured: 'All Gold + International',
      deductible: 100,
      premiumPerDependent: 1000
    }
  ];
  selectedPlan: PlanDetails | undefined;
  numDependents: number = 0;
  totalPremium: number = 0;
  
  ngOnInit() {
    const dependents = JSON.parse(localStorage.getItem('dependents') || '[]');
    this.numDependents = dependents.length;
    this.choosePlanForm.get('plan')?.valueChanges.subscribe(planName => {
      this.selectedPlan = this.plans.find(p => p.name === planName);
      this.calculateTotalPremium();
    });
  }

  calculateTotalPremium() {
    if (this.selectedPlan) {
      this.totalPremium = this.selectedPlan.basePremium +
        (this.selectedPlan.premiumPerDependent * this.numDependents);
    } else {
      this.totalPremium = 0;
    }
  }

  onSubmit() {
    if (this.choosePlanForm.valid && this.selectedPlan) {

      //1. prepare registration pyaload 
      const signupDetails = JSON.parse(localStorage.getItem('signupDetails') || '{}');

      const dependents = JSON.parse(localStorage.getItem('dependents') || '[]');

      const policyDetails = {
        plan: this.selectedPlan.name,
        totalPremium: this.totalPremium,
        numDependents: this.numDependents
      };

      debugger;
      // 2. Registering client
      this.http.post<{ client_id: number }>(`${environment.apiUrl}/public/register`, {...signupDetails}).subscribe({
        next: (registerRes) => {
          
          debugger;
          const client_id = registerRes.client_id;
 
          // 3. Preparing policy payload
          const today = new Date();
          const startDate = today.toISOString().split('T')[0]; // yyyy-mm-dd
          const endDate = new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())
            .toISOString().split('T')[0]; // +1 year
          const policyTypeId = this.selectedPlan!.id;          

          // 4. Creating policy
          this.http.post(`${environment.apiUrl}/private/policy/create`, {
            client_id,
            policyTypeId,
            startDate,
            endDate,
            noOfDependents: this.numDependents
          }).subscribe({
            next: () => {
              alert('Registration and policy creation successful!');
              this.router.navigate(['/auth']);
            },
            error: () => {
              alert('Policy creation failed.');
            }
          });
        },
        error: () => {
          alert('Registration failed.');
        }
      });

      this.router.navigate(['/auth']);
    }
  }


}
