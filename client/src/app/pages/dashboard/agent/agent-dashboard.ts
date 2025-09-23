import { Component } from '@angular/core';
import { Overview } from './overview/overview';
import { ClaimApproval } from "./claim-approval/claim-approval";

@Component({
  selector: 'app-agent',
  imports: [Overview, ClaimApproval],
  templateUrl: './agent.html',
  styleUrl: './agent.css'
})
export class AgentDashboard {
  activeTab: 'overview' | 'claim-approval' | 'claim-history' | 'claim-status-log' = 'overview';
  setTab(tab: 'overview' | 'claim-approval' | 'claim-history' | 'claim-status-log') {
    this.activeTab = tab;
  }
}
