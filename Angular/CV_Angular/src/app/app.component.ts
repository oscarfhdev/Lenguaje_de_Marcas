import { Component } from '@angular/core';
import { RouterModule, RouterOutlet } from '@angular/router';
import { MenubarComponent } from './menubar/menubar.component';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RouterModule, MenubarComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'CV_Angular';
}
