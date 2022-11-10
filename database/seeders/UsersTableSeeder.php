<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = new User;
        $users->name = "Anggit Studio";
        $users->email = "admin@gmail.com";
        $users->phone = "08150505056";
        $users->password = bcrypt('admin'); 
        $users ->save();    }
}
