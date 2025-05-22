import { Routes } from '@angular/router';
import {HomepageComponent} from './homepage/homepage.component';
import {ContactMeComponent} from './contact-me/contact-me.component';
import {TechnologiesComponent} from './technologies/technologies.component';
import {AboutMeComponent} from './about-me/about-me.component';
import {FormationandexperienceComponent} from './formationandexperience/formationandexperience.component';

export const routes: Routes = [
  { path: '', component: HomepageComponent},
  { path: 'homepage', component: HomepageComponent},
  { path: 'contact_me', component: ContactMeComponent},
  { path: 'technologies', component: TechnologiesComponent},
  { path: 'about_me', component: AboutMeComponent},
  { path: 'formationandexperience', component: FormationandexperienceComponent},


];
