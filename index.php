<?php
// Define possible entry points for Sunlight CMS
$possibleEntryPoints = [
    'public/index.php',
    'www/index.php',
    'app/index.php',
    'install/index.php',
    'system/index.php'
];

// Check if any of the entry points exist
foreach ($possibleEntryPoints as $entryPoint) {
    if (file_exists(__DIR__ . '/' . $entryPoint)) {
        // Redirect to the entry point
        header('Location: ' . $entryPoint);
        exit;
    }
}

// If no entry point is found, display a message
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunlight CMS</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1 {
            color: #0066cc;
        }
        code {
            background-color: #f0f0f0;
            padding: 2px 5px;
            border-radius: 3px;
            font-family: monospace;
        }
        ul {
            padding-left: 20px;
        }
        .note {
            background-color: #fffde7;
            padding: 10px;
            border-left: 4px solid #ffd600;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Sunlight CMS</h1>
        <p>This is the root directory of your Sunlight CMS installation.</p>
        
        <div class="note">
            <p><strong>Note:</strong> No entry point was found for Sunlight CMS. Please check your installation.</p>
        </div>
        
        <h2>Directory Structure</h2>
        <p>The current directory contains:</p>
        <ul>
            <?php
            // List files and directories in the current directory
            $items = scandir(__DIR__);
            foreach ($items as $item) {
                if ($item != '.' && $item != '..') {
                    echo '<li>' . htmlspecialchars($item) . (is_dir(__DIR__ . '/' . $item) ? '/' : '') . '</li>';
                }
            }
            ?>
        </ul>
        
        <h2>Next Steps</h2>
        <p>If you're seeing this page, you may need to:</p>
        <ul>
            <li>Complete the installation of Sunlight CMS</li>
            <li>Check if the Sunlight CMS files are properly installed</li>
            <li>Verify that the correct entry point is accessible</li>
        </ul>
        
        <p>For more information, please refer to the <a href="https://github.com/sunlight-cms/skeleton">Sunlight CMS Skeleton documentation</a>.</p>
    </div>
</body>
</html>