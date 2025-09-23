import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { Claim } from '../../../../../core/services/api/claim/claim';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-client-claim-history',
  imports: [CommonModule, FormsModule],
  templateUrl: './client-claim-history.html',
  styleUrl: './client-claim-history.css'
})

// class claimHistoryModel {
//   private 
// }

export class ClientClaimHistory {

  private claimService = inject(Claim);
  // private clientId: any = localStorage.getItem('userId');
  private clientId: any = '61d3bc4e-d308-4095-9b01-e77c6fdc7f6b';

  ngOnInit(){
    this.onClaimHistory();
  }

  resultDefault: any[] = [];
  result: any[] = [];

  filterStatus: string = '';
  filterType: string = '';
  activeStatus: string = '';
  activeType: string = '';
  filterStartDate?: string;
  filterEndDate?: string;
  filterSearchTerm: string = '';

  onClaimHistory(){
    this.claimService.onGetClaimHistory(this.clientId).subscribe({
      next: (result:any) => {
        this.result = result;
        this.resultDefault = result;
        console.log(result);
      }
    });
  }

  filterByStatus(status: string){
    this.filterStatus = status;
    this.activeStatus = status;
    this.applyFilters();
  }

  filterByType(type: string){
    this.filterType = type;
    this.activeType = type;
    this.applyFilters();
  }

  applyFilters(){
    this.result = this.resultDefault.filter(claim => {

      const isStatusCorrect = this.filterStatus ? claim.status === this.filterStatus : true;

      const isTypeCorrect = this.filterType ? claim.claimType === this.filterType : true;

      let matchesDate = true;
      if(this.filterStartDate){
        matchesDate = new Date(claim.openDate) >= new Date(this.filterStartDate);
      }

      if(matchesDate && this.filterEndDate){
        matchesDate = new Date(claim.openDate) <= new Date(this.filterEndDate);
      }

      const matchesSearch = this.filterSearchTerm
      ? claim.procedureNotes &&
        claim.procedureNotes.toString().toLowerCase()
          .includes(this.filterSearchTerm.toLowerCase())
      : true;

      return isStatusCorrect && isTypeCorrect && matchesDate && matchesSearch;
    });
  }

  resetStatusFilters(){
    this.filterStatus = '';
    this.activeStatus = '';
    this.applyFilters();
  }

  resetTypeFilters(){
    this.filterType = '';
    this.activeType = '';
    this.applyFilters();
  }

  resetFilters(){
    this.filterStatus = '';
    this.filterType = '';
    this.activeStatus = '';
    this.activeType = '';
    this.filterStartDate = undefined;
    this.filterEndDate = undefined;
    this.result = this.resultDefault;
  }

}
