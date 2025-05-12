<?php
// Pre-filled configuration for Sunlight CMS installation
return [
    // Database configuration
    'database' => [
        'host' => 'db',
        'name' => 'sunlight',
        'user' => 'sunlight',
        'password' => 'sunlight_password',
        'prefix' => 'cms_',
    ],
    
    // Site configuration
    'site' => [
        'name' => 'Sunlight CMS',
        'description' => 'My Sunlight CMS Website',
        'email' => 'admin@example.com',
    ],
    
    // Admin account
    'admin' => [
        'username' => 'admin',
        'password' => 'admin', // Change this in production
        'email' => 'admin@example.com',
    ],
];