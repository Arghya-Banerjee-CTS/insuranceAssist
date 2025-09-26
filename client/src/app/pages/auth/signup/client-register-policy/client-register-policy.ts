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
      id: 1,
      name: 'Gold',
      basePremium: 12500,
      coverage: '₹5,00,000',
      proceduresInsured: 'Regular healthcare users',
      deductible: 4000,
      premiumPerDependent: 3100 
    },
    {			
      id: 2,
      name: 'Silver',
      basePremium: 9200,
      coverage: '₹2,50,000',
      proceduresInsured: 'Families with occasional care',
      deductible: 6000,
      premiumPerDependent: 2300
    },
    {	
      id: 3,
      name: 'Bronze',
      basePremium: 7500,
      coverage: '₹10,00,000',
      proceduresInsured: 'Young, healthy individuals',
      deductible: 8000,
      premiumPerDependent: 700			
      
    },
    {			
      id: 4,
      name: 'Basic',
      basePremium: 6800,
      coverage: '₹5,00,000',
      proceduresInsured: 'General Consultation',
      deductible: 10000,
      premiumPerDependent: 1700
    },
    {
      id: 5,
      name: 'Platinum',
      basePremium: 14000,
      coverage: '₹20,00,000',
      proceduresInsured: 'Chronic conditions, seniors',
      deductible: 2000,
      premiumPerDependent: 3700
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
          
              // const clientId = localStorage.getItem('userId');
              // localStorage.setItem('userId', registerRes.client_id.toString());

              this.http.post(`${environment.apiUrl}/public/login`, {username: signupDetails.email.replace(/[@]|.com/g, ""), password: signupDetails.password}).subscribe({
                next: (loginRes:any) => {
                  if(loginRes && loginRes.token){
                    localStorage.setItem('token', loginRes.token);
                    localStorage.setItem('role', loginRes.role);
                    localStorage.setItem('userId', loginRes.userId);

              const clientId = localStorage.getItem('userId');
              const today = new Date();
              const startDate = today.toISOString().split('T')[0]; // yyyy-mm-dd
              const endDate = new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())
                .toISOString().split('T')[0]; // +1 year
              const policyType = this.selectedPlan!.id;          

              // 4. Creating policy
              this.http.post(`${environment.apiUrl}/private/policy/create`, {
                clientId,
                policyType,
                startDate,
                endDate,
                noOfDependents: this.numDependents
              }).subscribe({
                next: () => {

                  let completed = 0;
                  dependents.forEach((dep: { name: any; dob: any; contact: any; address: any; relationTypeId: any; gender: any; email: any; }) => {
                    const dependentPayload = {
                      name: dep.name,
                      dob: dep.dob, 
                      phone: dep.contact,
                      address: dep.address,
                      relationTypeId: dep.relationTypeId,
                      gender: dep.gender,
                      email: dep.email,
                      clientId: clientId
                    };

                    console.log(dependentPayload);
                    debugger;

                    this.http.post(`${environment.apiUrl}/private/dependent/create`, dependentPayload)
                      .subscribe({
                        next: () => {
                          completed++;
                        },
                        error: () => {
                            alert('Dependent creation failed.')
                        }
                      });
                  });
                  alert('Registration and policy creation successful!');
                  this.router.navigate(['/auth']);
                },
                error: () => {
                  alert('Policy creation failed.');
                }
              });
              }
            },
            error: () => {
              alert('Auto-login failed after registration.');
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
