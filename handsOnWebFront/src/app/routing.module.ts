import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { JobComponent } from './job/job.component';
import { JobDetailComponent } from './job/job-detail/job-detail.component';
import { JobApplicationComponent } from './job/job-application/job-application.component';
const routes: Routes = [
  { path: '', component: JobComponent },
  {
    path: 'job-details/:id',
    component: JobDetailComponent,
  },
  {
    path: 'job-application/:id',
    component: JobApplicationComponent,
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class RoutingModule { }
