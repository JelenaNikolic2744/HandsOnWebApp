import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { RoutingModule } from './routing.module';
import { HttpService } from './http-requests/http.service';
import { JobComponent } from './job/job.component';
import { JobListComponent } from './job/job-list/job-list.component';
import { JobService } from './job/job.service';
import { JobDetailComponent } from './job/job-detail/job-detail.component';
import { JobApplicationComponent } from './job/job-application/job-application.component';
import { AlertComponent } from './alert/alert.component';

@NgModule({
  declarations: [
    AppComponent,
    JobComponent,
    JobListComponent,
    JobDetailComponent,
    JobApplicationComponent,
    AlertComponent
  ],
  imports: [
    BrowserModule,
    ReactiveFormsModule,
    FormsModule,
    RoutingModule,
    HttpClientModule,
  ],
  providers: [HttpService, JobService],
  bootstrap: [AppComponent]
})
export class AppModule { }
