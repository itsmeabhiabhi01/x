<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Twitter Clone</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }
        
        body {
            display: flex;
            height: 100vh;
            background-color: #000;
            color: #fff;
        }
        
        /* Left sidebar */
        .sidebar {
            width: 275px;
            padding: 10px;
            border-right: 1px solid #2f3336;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        
        .logo {
            padding: 10px;
            margin-bottom: 10px;
        }
        
        .logo svg {
            width: 28px;
            height: 28px;
            fill: #fff;
        }
        
        .nav-item {
            display: flex;
            align-items: center;
            padding: 12px;
            margin: 4px 0;
            border-radius: 9999px;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .nav-item:hover {
            background-color: #181818;
        }
        
        .nav-item.active {
            font-weight: bold;
        }
        
        .nav-item svg {
            width: 26px;
            height: 26px;
            margin-right: 16px;
        }
        
        .tweet-btn {
            background-color: #1d9bf0;
            color: white;
            border: none;
            border-radius: 9999px;
            padding: 16px 32px;
            font-size: 17px;
            font-weight: bold;
            margin-top: 10px;
            cursor: pointer;
            width: 90%;
            transition: background-color 0.2s;
        }
        
        .tweet-btn:hover {
            background-color: #1a8cd8;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            margin-top: auto;
            padding: 12px;
            border-radius: 9999px;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        
        .user-profile:hover {
            background-color: #181818;
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 12px;
            background-color: #333;
        }
        
        .user-info {
            flex: 1;
        }
        
        .user-name {
            font-weight: bold;
            font-size: 15px;
        }
        
        .user-handle {
            color: #71767b;
            font-size: 15px;
        }
        
        /* Main content */
        .main-content {
            flex: 1;
            max-width: 600px;
            border-right: 1px solid #2f3336;
            overflow-y: auto;
        }
        
        .header {
            position: sticky;
            top: 0;
            background-color: rgba(0, 0, 0, 0.65);
            backdrop-filter: blur(12px);
            z-index: 10;
            padding: 15px 20px;
            border-bottom: 1px solid #2f3336;
        }
        
        .header h1 {
            font-size: 20px;
            font-weight: bold;
        }
        
        .tweet-box {
            padding: 16px;
            border-bottom: 1px solid #2f3336;
        }
        
        .tweet-form {
            display: flex;
        }
        
        .tweet-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #333;
            margin-right: 12px;
        }
        
        .tweet-input {
            flex: 1;
        }
        
        .tweet-input textarea {
            width: 100%;
            background: transparent;
            border: none;
            color: white;
            font-size: 20px;
            resize: none;
            outline: none;
            padding: 12px 0;
            min-height: 60px;
        }
        
        .tweet-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 16px;
            padding-top: 12px;
            border-top: 1px solid #2f3336;
        }
        
        .tweet-icons {
            display: flex;
        }
        
        .tweet-icon {
            width: 36px;
            height: 36px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-right: 4px;
            cursor: pointer;
            color: #1d9bf0;
            transition: background-color 0.2s;
        }
        
        .tweet-icon:hover {
            background-color: #1d9bf011;
        }
        
        .tweet-submit {
            background-color: #1d9bf0;
            color: white;
            border: none;
            border-radius: 9999px;
            padding: 8px 16px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            opacity: 0.5;
        }
        
        .tweet-submit.active {
            opacity: 1;
        }
        
        /* Tweets */
        .tweets {
            display: flex;
            flex-direction: column;
        }
        
        .tweet {
            padding: 16px;
            border-bottom: 1px solid #2f3336;
            display: flex;
            transition: background-color 0.2s;
        }
        
        .tweet:hover {
            background-color: #080808;
        }
        
        .tweet-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #333;
            margin-right: 12px;
        }
        
        .tweet-content {
            flex: 1;
        }
        
        .tweet-header {
            display: flex;
            align-items: center;
            margin-bottom: 4px;
        }
        
        .tweet-name {
            font-weight: bold;
            margin-right: 4px;
        }
        
        .tweet-username, .tweet-time {
            color: #71767b;
            margin-right: 4px;
        }
        
        .tweet-text {
            margin-bottom: 12px;
            line-height: 1.4;
        }
        
        .tweet-image {
            width: 100%;
            border-radius: 16px;
            margin-bottom: 12px;
            background-color: #333;
            height: 300px;
        }
        
        .tweet-actions {
            display: flex;
            justify-content: space-between;
            max-width: 425px;
            color: #71767b;
        }
        
        .tweet-action {
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: color 0.2s;
        }
        
        .tweet-action svg {
            width: 18px;
            height: 18px;
            margin-right: 4px;
            fill: currentColor;
        }
        
        .tweet-action.comment:hover {
            color: #1d9bf0;
        }
        
        .tweet-action.retweet:hover {
            color: #00ba7c;
        }
        
        .tweet-action.like:hover {
            color: #f91880;
        }
        
        .tweet-action.share:hover {
            color: #1d9bf0;
        }
        
        /* Right sidebar */
        .right-sidebar {
            width: 350px;
            padding: 16px;
            overflow-y: auto;
        }
        
        .search-box {
            background-color: #202327;
            border-radius: 9999px;
            padding: 12px 16px;
            display: flex;
            align-items: center;
            margin-bottom: 16px;
        }
        
        .search-box svg {
            width: 18px;
            height: 18px;
            fill: #71767b;
            margin-right: 8px;
        }
        
        .search-box input {
            background: transparent;
            border: none;
            color: white;
            font-size: 15px;
            outline: none;
            width: 100%;
        }
        
        .trends {
            background-color: #16181c;
            border-radius: 16px;
            margin-bottom: 16px;
        }
        
        .trends-header {
            padding: 16px;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 1px solid #2f3336;
        }
        
        .trend-item {
            padding: 16px;
            cursor: pointer;
            transition: background-color 0.2s;
            border-bottom: 1px solid #2f3336;
        }
        
        .trend-item:last-child {
            border-bottom: none;
        }
        
        .trend-item:hover {
            background-color: #1e1e1e;
        }
        
        .trend-category {
            font-size: 13px;
            color: #71767b;
            margin-bottom: 4px;
        }
        
        .trend-name {
            font-weight: bold;
            margin-bottom: 4px;
        }
        
        .trend-count {
            font-size: 13px;
            color: #71767b;
        }
        
        .who-to-follow {
            background-color: #16181c;
            border-radius: 16px;
        }
        
        .who-to-follow-header {
            padding: 16px;
            font-size: 20px;
            font-weight: bold;
            border-bottom: 1px solid #2f3336;
        }
        
        .follow-item {
            padding: 16px;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.2s;
            border-bottom: 1px solid #2f3336;
        }
        
        .follow-item:last-child {
            border-bottom: none;
        }
        
        .follow-item:hover {
            background-color: #1e1e1e;
        }
        
        .follow-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #333;
            margin-right: 12px;
        }
        
        .follow-info {
            flex: 1;
        }
        
        .follow-name {
            font-weight: bold;
            margin-bottom: 2px;
        }
        
        .follow-username {
            color: #71767b;
            margin-bottom: 2px;
        }
        
        .follow-btn {
            background-color: white;
            color: black;
            border: none;
            border-radius: 9999px;
            padding: 8px 16px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .footer {
            padding: 16px;
            color: #71767b;
            font-size: 13px;
        }
        
        .footer-links {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 4px;
        }
        
        .footer-link {
            margin-right: 12px;
            margin-bottom: 4px;
            cursor: pointer;
        }
        
        .footer-link:hover {
            text-decoration: underline;
        }
        
        @media (max-width: 1000px) {
            .right-sidebar {
                display: none;
            }
        }
        
        @media (max-width: 600px) {
            .sidebar {
                width: auto;
            }
            
            .nav-item span {
                display: none;
            }
            
            .tweet-btn {
                width: auto;
                padding: 16px;
                border-radius: 50%;
            }
            
            .tweet-btn span {
                display: none;
            }
            
            .user-info {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"></path></g>
            </svg>
        </div>
        
        <div class="nav-item active">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M12 1.696L.622 8.807l1.06 1.696L3 9.679V19.5C3 20.881 4.119 22 5.5 22h13c1.381 0 2.5-1.119 2.5-2.5V9.679l1.318.824 1.06-1.696L12 1.696zM12 16.5c-1.933 0-3.5-1.567-3.5-3.5s1.567-3.5 3.5-3.5 3.5 1.567 3.5 3.5-1.567 3.5-3.5 3.5z"></path></g>
            </svg>
            <span>Home</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M10.25 3.75c-3.59 0-6.5 2.91-6.5 6.5s2.91 6.5 6.5 6.5c1.795 0 3.419-.726 4.596-1.904 1.178-1.177 1.904-2.801 1.904-4.596 0-3.59-2.91-6.5-6.5-6.5zm-8.5 6.5c0-4.694 3.806-8.5 8.5-8.5s8.5 3.806 8.5 8.5c0 1.986-.682 3.815-1.824 5.262l4.781 4.781-1.414 1.414-4.781-4.781c-1.447 1.142-3.276 1.824-5.262 1.824-4.694 0-8.5-3.806-8.5-8.5z"></path></g>
            </svg>
            <span>Explore</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M19.993 9.042C19.48 5.017 16.054 2 11.996 2s-7.49 3.021-7.999 7.051L2.866 18H7.1c.463 2.282 2.481 4 4.9 4s4.437-1.718 4.9-4h4.236l-1.143-8.958zM12 20c-1.306 0-2.417-.835-2.829-2h5.658c-.412 1.165-1.523 2-2.829 2zm-6.866-4l.847-6.698C6.364 6.272 8.941 4 11.996 4s5.627 2.268 6.013 5.295L18.864 16H5.134z"></path></g>
            </svg>
            <span>Notifications</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M1.998 5.5c0-1.381 1.119-2.5 2.5-2.5h15c1.381 0 2.5 1.119 2.5 2.5v13c0 1.381-1.119 2.5-2.5 2.5h-15c-1.381 0-2.5-1.119-2.5-2.5v-13zm2.5-.5c-.276 0-.5.224-.5.5v2.764l8 3.638 8-3.636V5.5c0-.276-.224-.5-.5-.5h-15zm15.5 5.463l-8 3.636-8-3.638V18.5c0 .276.224.5.5.5h15c.276 0 .5-.224.5-.5v-8.037z"></path></g>
            </svg>
            <span>Messages</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M3 4.5C3 3.12 4.12 2 5.5 2h13C19.88 2 21 3.12 21 4.5v15c0 1.38-1.12 2.5-2.5 2.5h-13C4.12 22 3 20.88 3 19.5v-15zM5.5 4c-.28 0-.5.22-.5.5v15c0 .28.22.5.5.5h13c.28 0 .5-.22.5-.5v-15c0-.28-.22-.5-.5-.5h-13zM16 10H8V8h8v2zm-8 2h8v2H8v-2z"></path></g>
            </svg>
            <span>Lists</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M4 4.5C4 3.12 5.119 2 6.5 2h11C18.881 2 20 3.12 20 4.5v18.44l-8-5.71-8 5.71V4.5zM6.5 4c-.276 0-.5.22-.5.5v14.56l6-4.29 6 4.29V4.5c0-.28-.224-.5-.5-.5h-11z"></path></g>
            </svg>
            <span>Bookmarks</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M7.501 19.917L7.471 21H.472l.029-1.027c.184-6.618 3.736-8.977 7-8.977.963 0 1.95.212 2.87.672-.444.478-.851 1.03-1.212 1.656-.507-.204-1.054-.329-1.658-.329-2.767 0-4.57 2.223-4.938 6.004H7.56c-.023.302-.05.599-.059.917zm15.998.056L23.528 21H9.472l.029-1.027c.184-6.618 3.736-8.977 7-8.977s6.816 2.358 7 8.977zM21.437 19c-.367-3.781-2.17-6.004-4.938-6.004s-4.57 2.223-4.938 6.004h9.875zm-4.938-9c-.799 0-1.527-.279-2.116-.73-.836-.64-1.384-1.638-1.384-2.77 0-1.93 1.567-3.5 3.5-3.5s3.5 1.57 3.5 3.5c0 1.132-.548 2.13-1.384 2.77-.589.451-1.317.73-2.116.73zm-1.5-3.5c0 .827.673 1.5 1.5 1.5s1.5-.673 1.5-1.5-.673-1.5-1.5-1.5-1.5.673-1.5 1.5zM7.5 3C9.433 3 11 4.57 11 6.5S9.433 10 7.5 10 4 8.43 4 6.5 5.567 3 7.5 3zm0 2c-.827 0-1.5.673-1.5 1.5S6.673 8 7.5 8 9 7.327 9 6.5 8.327 5 7.5 5z"></path></g>
            </svg>
            <span>Communities</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"></path></g>
            </svg>
            <span>Premium</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M5.651 19h12.698c-.337-1.8-1.023-3.21-1.945-4.19C15.318 13.65 13.838 13 12 13s-3.317.65-4.404 1.81c-.922.98-1.608 2.39-1.945 4.19zm.486-5.56C7.627 11.85 9.648 11 12 11s4.373.85 5.863 2.44c1.477 1.58 2.366 3.8 2.632 6.46l.11 1.1H3.395l.11-1.1c.266-2.66 1.155-4.88 2.632-6.46zM12 4c-1.105 0-2 .9-2 2s.895 2 2 2 2-.9 2-2-.895-2-2-2zM8 6c0-2.21 1.791-4 4-4s4 1.79 4 4-1.791 4-4 4-4-1.79-4-4z"></path></g>
            </svg>
            <span>Profile</span>
        </div>
        
        <div class="nav-item">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M3.75 12c0-4.56 3.69-8.25 8.25-8.25s8.25 3.69 8.25 8.25-3.69 8.25-8.25 8.25S3.75 16.56 3.75 12zM12 1.75C6.34 1.75 1.75 6.34 1.75 12S6.34 22.25 12 22.25 22.25 17.66 22.25 12 17.66 1.75 12 1.75zm-4.75 11.5c.69 0 1.25-.56 1.25-1.25s-.56-1.25-1.25-1.25S6 11.31 6 12s.56 1.25 1.25 1.25zm9.5 0c.69 0 1.25-.56 1.25-1.25s-.56-1.25-1.25-1.25-1.25.56-1.25 1.25.56 1.25 1.25 1.25zM13.25 12c0 .69-.56 1.25-1.25 1.25s-1.25-.56-1.25-1.25.56-1.25 1.25-1.25 1.25.56 1.25 1.25z"></path></g>
            </svg>
            <span>More</span>
        </div>
        
        <button class="tweet-btn">
            <span>Post</span>
        </button>
        
        <div class="user-profile">
            <div class="user-avatar"></div>
            <div class="user-info">
                <div class="user-name">User Name</div>
                <div class="user-handle">@username</div>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Home</h1>
        </div>
        
        <div class="tweet-box">
            <div class="tweet-form">
                <div class="tweet-avatar"></div>
                <div class="tweet-input">
                    <textarea placeholder="What is happening?!"></textarea>
                    <div class="tweet-actions">
                        <div class="tweet-icons">
                            <div class="tweet-icon">
                                <svg viewBox="0 0 24 24" aria-hidden="true">
                                    <g><path d="M3 5.5C3 4.119 4.119 3 5.5 3h13C19.881 3 21 4.119 21 5.5v13c0 1.381-1.119 2.5-2.5 2.5h-13C4.119 21 3 19.881 3 18.5v-13zM5.5 5c-.276 0-.5.224-.5.5v9.086l3-3 3 3 5-5 3 3V5.5c0-.276-.224-.5-.5-.5h-13zM19 15.414l-3-3-5 5-3-3-3 3V18.5c0 .276.224.5.5.5h13c.276 0 .5-.224.5-.5v-3.086zM9.75 7C8.784 7 8 7.784 8 8.75s.784 1.75 1.75 1.75 1.75-.784 1.75-1.75S10.716 7 9.75 7z"></path></g>
                                </svg>
                            </div>
                            <div class="tweet-icon">
                                <svg viewBox="0 0 24 24" aria-hidden="true">
                                    <g><path d="M3 5.5C3 4.119 4.12 3 5.5 3h13C19.88 3 21 4.119 21 5.5v13c0 1.381-1.12 2.5-2.5 2.5h-13C4.12 21 3 19.881 3 18.5v-13zM5.5 5c-.276 0-.5.224-.5.5v3.086l3-3L5.5 5zm6.5 6l-7 7h13.5c.276 0 .5-.224.5-.5v-13l-7 7zM8 8.5c0-.828.672-1.5 1.5-1.5s1.5.672 1.5 1.5S10.328 10 9.5 10 8 9.328 8 8.5z"></path></g>
                                </svg>
                            </div>
                            <div class="tweet-icon">
                                <svg viewBox="0 0 24 24" aria-hidden="true">
                                    <g><path d="M6 5c-1.1 0-2 .895-2 2s.9 2 2 2 2-.895 2-2-.9-2-2-2zM2 7c0-2.209 1.79-4 4-4s4 1.791 4 4-1.79 4-4 4-4-1.791-4-4zm20 1H12V6h10v2zM6 15c-1.1 0-2 .895-2 2s.9 2 2 2 2-.895 2-2-.9-2-2-2zm-4 2c0-2.209 1.79-4 4-4s4 1.791 4 4-1.79 4-4 4-4-1.791-4-4zm20 1H12v-2h10v2zM7 7c0 .552-.45 1-1 1s-1-.448-1-1 .45-1 1-1 1 .448 1 1z"></path></g>
                                </svg>
                            </div>
                            <div class="tweet-icon">
                                <svg viewBox="0 0 24 24" aria-hidden="true">
                                    <g><path d="M8 9.5C8 8.119 8.672 7 9.5 7S11 8.119 11 9.5 10.328 12 9.5 12 8 10.881 8 9.5zm6.5 2.5c.828 0 1.5-1.119 1.5-2.5S15.328 7 14.5 7 13 8.119 13 9.5s.672 2.5 1.5 2.5zM12 16c-2.224 0-3.021-2.227-3.051-2.316l-1.897.633c.05.15 1.271 3.684 4.949 3.684s4.898-3.533 4.949-3.684l-1.896-.638c-.033.095-.83 2.322-3.053 2.322zm10.25-4.001c0 5.652-4.598 10.25-10.25 10.25S1.75 17.652 1.75 12 6.348 1.75 12 1.75 22.25 6.348 22.25 12zm-2 0c0-4.549-3.701-8.25-8.25-8.25S3.75 7.451 3.75 12s3.701 8.25 8.25 8.25 8.25-3.701 8.25-8.25z"></path></g>
                                </svg>
                            </div>
                            <div class="tweet-icon">
                                <svg viewBox="0 0 24 24" aria-hidden="true">
                                    <g><path d="M6 3V2h2v1h6V2h2v1h1.5C18.88 3 20 4.119 20 5.5v2h-2v-2c0-.276-.22-.5-.5-.5H16v1h-2V5H8v1H6V5H4.5c-.28 0-.5.224-.5.5v12c0 .276.22.5.5.5h3v2h-3C3.12 20 2 18.881 2 17.5v-12C2 4.119 3.12 3 4.5 3H6zm9.5 8c-2.49 0-4.5 2.015-4.5 4.5s2.01 4.5 4.5 4.5 4.5-2.015 4.5-4.5-2.01-4.5-4.5-4.5zM9 15.5C9 11.91 11.91 9 15.5 9s6.5 2.91 6.5 6.5-2.91 6.5-6.5 6.5S9 19.09 9 15.5zm5.5-2.5h2v2.086l1.71 1.707-1.42 1.414-2.29-2.293V13z"></path></g>
                                </svg>
                            </div>
                        </div>
                        <button class="tweet-submit">Post</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="tweets">
            <!-- Tweet 1 -->
            <div class="tweet">
                <div class="tweet-avatar"></div>
                <div class="tweet-content">
                    <div class="tweet-header">
                        <span class="tweet-name">Elon Musk</span>
                        <span class="tweet-username">@elonmusk</span>
                        <span class="tweet-time">· 2h</span>
                    </div>
                    <div class="tweet-text">
                        Exciting progress with Starship! Next test flight coming soon.
                    </div>
                    <div class="tweet-image"></div>
                    <div class="tweet-actions">
                        <div class="tweet-action comment">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366c4.49 0 8.129 3.64 8.129 8.13 0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067c-4.49.1-8.183-3.51-8.183-8.01zm8.005-6c-3.317 0-6.005 2.69-6.005 6 0 3.37 2.77 6.08 6.138 6.01l.351-.01h1.761v2.3l5.087-2.81c1.951-1.08 3.163-3.13 3.163-5.36 0-3.39-2.744-6.13-6.129-6.13H9.756z"></path></g>
                            </svg>
                            <span>1.2K</span>
                        </div>
                        <div class="tweet-action retweet">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M4.5 3.88l4.432 4.14-1.364 1.46L5.5 7.55V16c0 1.1.896 2 2 2H13v2H7.5c-2.209 0-4-1.79-4-4V7.55L1.432 9.48.068 8.02 4.5 3.88zM16.5 6H11V4h5.5c2.209 0 4 1.79 4 4v8.45l2.068-1.93 1.364 1.46-4.432 4.14-4.432-4.14 1.364-1.46 2.068 1.93V8c0-1.1-.896-2-2-2z"></path></g>
                            </svg>
                            <span>5.7K</span>
                        </div>
                        <div class="tweet-action like">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M16.697 5.5c-1.222-.06-2.679.51-3.89 2.16l-.805 1.09-.806-1.09C9.984 6.01 8.526 5.44 7.304 5.5c-1.243.07-2.349.78-2.91 1.91-.552 1.12-.633 2.78.479 4.82 1.074 1.97 3.257 4.27 7.129 6.61 3.87-2.34 6.052-4.64 7.126-6.61 1.111-2.04 1.03-3.7.477-4.82-.561-1.13-1.666-1.84-2.908-1.91zm4.187 7.69c-1.351 2.48-4.001 5.12-8.379 7.67l-.503.3-.504-.3c-4.379-2.55-7.029-5.19-8.382-7.67-1.36-2.5-1.41-4.86-.514-6.67.887-1.79 2.647-2.91 4.601-3.01 1.651-.09 3.368.56 4.798 2.01 1.429-1.45 3.146-2.1 4.796-2.01 1.954.1 3.714 1.22 4.601 3.01.896 1.81.846 4.17-.514 6.67z"></path></g>
                            </svg>
                            <span>45.2K</span>
                        </div>
                        <div class="tweet-action share">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M12 2.59l5.7 5.7-1.41 1.42L13 6.41V16h-2V6.41l-3.3 3.3-1.41-1.42L12 2.59zM21 15l-.02 3.51c0 1.38-1.12 2.49-2.5 2.49H5.5C4.11 21 3 19.88 3 18.5V15h2v3.5c0 .28.22.5.5.5h12.98c.28 0 .5-.22.5-.5L19 15h2z"></path></g>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Tweet 2 -->
            <div class="tweet">
                <div class="tweet-avatar"></div>
                <div class="tweet-content">
                    <div class="tweet-header">
                        <span class="tweet-name">NASA</span>
                        <span class="tweet-username">@NASA</span>
                        <span class="tweet-time">· 5h</span>
                    </div>
                    <div class="tweet-text">
                        Our Perseverance rover has collected its first sample of Martian rock for potential return to Earth. This is a historic moment in space exploration!
                    </div>
                    <div class="tweet-image"></div>
                    <div class="tweet-actions">
                        <div class="tweet-action comment">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366c4.49 0 8.129 3.64 8.129 8.13 0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067c-4.49.1-8.183-3.51-8.183-8.01zm8.005-6c-3.317 0-6.005 2.69-6.005 6 0 3.37 2.77 6.08 6.138 6.01l.351-.01h1.761v2.3l5.087-2.81c1.951-1.08 3.163-3.13 3.163-5.36 0-3.39-2.744-6.13-6.129-6.13H9.756z"></path></g>
                            </svg>
                            <span>3.8K</span>
                        </div>
                        <div class="tweet-action retweet">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M4.5 3.88l4.432 4.14-1.364 1.46L5.5 7.55V16c0 1.1.896 2 2 2H13v2H7.5c-2.209 0-4-1.79-4-4V7.55L1.432 9.48.068 8.02 4.5 3.88zM16.5 6H11V4h5.5c2.209 0 4 1.79 4 4v8.45l2.068-1.93 1.364 1.46-4.432 4.14-4.432-4.14 1.364-1.46 2.068 1.93V8c0-1.1-.896-2-2-2z"></path></g>
                            </svg>
                            <span>12.4K</span>
                        </div>
                        <div class="tweet-action like">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M16.697 5.5c-1.222-.06-2.679.51-3.89 2.16l-.805 1.09-.806-1.09C9.984 6.01 8.526 5.44 7.304 5.5c-1.243.07-2.349.78-2.91 1.91-.552 1.12-.633 2.78.479 4.82 1.074 1.97 3.257 4.27 7.129 6.61 3.87-2.34 6.052-4.64 7.126-6.61 1.111-2.04 1.03-3.7.477-4.82-.561-1.13-1.666-1.84-2.908-1.91zm4.187 7.69c-1.351 2.48-4.001 5.12-8.379 7.67l-.503.3-.504-.3c-4.379-2.55-7.029-5.19-8.382-7.67-1.36-2.5-1.41-4.86-.514-6.67.887-1.79 2.647-2.91 4.601-3.01 1.651-.09 3.368.56 4.798 2.01 1.429-1.45 3.146-2.1 4.796-2.01 1.954.1 3.714 1.22 4.601 3.01.896 1.81.846 4.17-.514 6.67z"></path></g>
                            </svg>
                            <span>87.6K</span>
                        </div>
                        <div class="tweet-action share">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M12 2.59l5.7 5.7-1.41 1.42L13 6.41V16h-2V6.41l-3.3 3.3-1.41-1.42L12 2.59zM21 15l-.02 3.51c0 1.38-1.12 2.49-2.5 2.49H5.5C4.11 21 3 19.88 3 18.5V15h2v3.5c0 .28.22.5.5.5h12.98c.28 0 .5-.22.5-.5L19 15h2z"></path></g>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Tweet 3 -->
            <div class="tweet">
                <div class="tweet-avatar"></div>
                <div class="tweet-content">
                    <div class="tweet-header">
                        <span class="tweet-name">Tech News</span>
                        <span class="tweet-username">@technews</span>
                        <span class="tweet-time">· 8h</span>
                    </div>
                    <div class="tweet-text">
                        Apple announces new iPhone 15 with USB-C charging, finally! Also featuring a titanium frame and improved camera system.
                    </div>
                    <div class="tweet-image"></div>
                    <div class="tweet-actions">
                        <div class="tweet-action comment">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366c4.49 0 8.129 3.64 8.129 8.13 0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067c-4.49.1-8.183-3.51-8.183-8.01zm8.005-6c-3.317 0-6.005 2.69-6.005 6 0 3.37 2.77 6.08 6.138 6.01l.351-.01h1.761v2.3l5.087-2.81c1.951-1.08 3.163-3.13 3.163-5.36 0-3.39-2.744-6.13-6.129-6.13H9.756z"></path></g>
                            </svg>
                            <span>2.1K</span>
                        </div>
                        <div class="tweet-action retweet">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M4.5 3.88l4.432 4.14-1.364 1.46L5.5 7.55V16c0 1.1.896 2 2 2H13v2H7.5c-2.209 0-4-1.79-4-4V7.55L1.432 9.48.068 8.02 4.5 3.88zM16.5 6H11V4h5.5c2.209 0 4 1.79 4 4v8.45l2.068-1.93 1.364 1.46-4.432 4.14-4.432-4.14 1.364-1.46 2.068 1.93V8c0-1.1-.896-2-2-2z"></path></g>
                            </svg>
                            <span>4.3K</span>
                        </div>
                        <div class="tweet-action like">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M16.697 5.5c-1.222-.06-2.679.51-3.89 2.16l-.805 1.09-.806-1.09C9.984 6.01 8.526 5.44 7.304 5.5c-1.243.07-2.349.78-2.91 1.91-.552 1.12-.633 2.78.479 4.82 1.074 1.97 3.257 4.27 7.129 6.61 3.87-2.34 6.052-4.64 7.126-6.61 1.111-2.04 1.03-3.7.477-4.82-.561-1.13-1.666-1.84-2.908-1.91zm4.187 7.69c-1.351 2.48-4.001 5.12-8.379 7.67l-.503.3-.504-.3c-4.379-2.55-7.029-5.19-8.382-7.67-1.36-2.5-1.41-4.86-.514-6.67.887-1.79 2.647-2.91 4.601-3.01 1.651-.09 3.368.56 4.798 2.01 1.429-1.45 3.146-2.1 4.796-2.01 1.954.1 3.714 1.22 4.601 3.01.896 1.81.846 4.17-.514 6.67z"></path></g>
                            </svg>
                            <span>25.7K</span>
                        </div>
                        <div class="tweet-action share">
                            <svg viewBox="0 0 24 24" aria-hidden="true">
                                <g><path d="M12 2.59l5.7 5.7-1.41 1.42L13 6.41V16h-2V6.41l-3.3 3.3-1.41-1.42L12 2.59zM21 15l-.02 3.51c0 1.38-1.12 2.49-2.5 2.49H5.5C4.11 21 3 19.88 3 18.5V15h2v3.5c0 .28.22.5.5.5h12.98c.28 0 .5-.22.5-.5L19 15h2z"></path></g>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Right Sidebar -->
    <div class="right-sidebar">
        <div class="search-box">
            <svg viewBox="0 0 24 24" aria-hidden="true">
                <g><path d="M10.25 3.75c-3.59 0-6.5 2.91-6.5 6.5s2.91 6.5 6.5 6.5c1.795 0 3.419-.726 4.596-1.904 1.178-1.177 1.904-2.801 1.904-4.596 0-3.59-2.91-6.5-6.5-6.5zm-8.5 6.5c0-4.694 3.806-8.5 8.5-8.5s8.5 3.806 8.5 8.5c0 1.986-.682 3.815-1.824 5.262l4.781 4.781-1.414 1.414-4.781-4.781c-1.447 1.142-3.276 1.824-5.262 1.824-4.694 0-8.5-3.806-8.5-8.5z"></path></g>
            </svg>
            <input type="text" placeholder="Search">
        </div>
        
        <div class="trends">
            <div class="trends-header">Trends for you</div>
            <div class="trend-item">
                <div class="trend-category">Technology · Trending</div>
                <div class="trend-name">#AI</div>
                <div class="trend-count">1.2M posts</div>
            </div>
            <div class="trend-item">
                <div class="trend-category">Sports · Trending</div>
                <div class="trend-name">World Cup</div>
                <div class="trend-count">856K posts</div>
            </div>
            <div class="trend-item">
                <div class="trend-category">Politics · Trending</div>
                <div class="trend-name">Elections 2024</div>
                <div class="trend-count">723K posts</div>
            </div>
            <div class="trend-item">
                <div class="trend-category">Entertainment · Trending</div>
                <div class="trend-name">#NewMovie</div>
                <div class="trend-count">512K posts</div>
            </div>
            <div class="trend-item">
                <div class="trend-category">Business · Trending</div>
                <div class="trend-name">Stock Market</div>
                <div class="trend-count">432K posts</div>
            </div>
        </div>
        
        <div class="who-to-follow">
            <div class="who-to-follow-header">Who to follow</div>
            <div class="follow-item">
                <div class="follow-avatar"></div>
                <div class="follow-info">
                    <div class="follow-name">Bill Gates</div>
                    <div class="follow-username">@BillGates</div>
                </div>
                <button class="follow-btn">Follow</button>
            </div>
            <div class="follow-item">
                <div class="follow-avatar"></div>
                <div class="follow-info">
                    <div class="follow-name">Tim Cook</div>
                    <div class="follow-username">@tim_cook</div>
                </div>
                <button class="follow-btn">Follow</button>
            </div>
            <div class="follow-item">
                <div class="follow-avatar"></div>
                <div class="follow-info">
                    <div class="follow-name">SpaceX</div>
                    <div class="follow-username">@SpaceX</div>
                </div>
                <button class="follow-btn">Follow</button>
            </div>
        </div>
        
        <div class="footer">
            <div class="footer-links">
                <div class="footer-link">Terms of Service</div>
                <div class="footer-link">Privacy Policy</div>
                <div class="footer-link">Cookie Policy</div>
                <div class="footer-link">Accessibility</div>
                <div class="footer-link">Ads info</div>
                <div class="footer-link">More</div>
            </div>
            <div>© 2023 Twitter Clone</div>
        </div>
    </div>

    <script>
        // Enable/disable tweet button based on input
        const tweetTextarea = document.querySelector('.tweet-input textarea');
        const tweetSubmit = document.querySelector('.tweet-submit');
        
        tweetTextarea.addEventListener('input', function() {
            if (this.value.trim().length > 0) {
                tweetSubmit.classList.add('active');
            } else {
                tweetSubmit.classList.remove('active');
            }
        });
        
        // Simulate tweet submission
        tweetSubmit.addEventListener('click', function() {
            const tweetContent = tweetTextarea.value.trim();
            if (tweetContent.length > 0) {
                alert(`Tweet posted: "${tweetContent}"`);
                tweetTextarea.value = '';
                tweetSubmit.classList.remove('active');
            }
        });
        
        // Make follow buttons interactive
        const followButtons = document.querySelectorAll('.follow-btn');
        followButtons.forEach(button => {
            button.addEventListener('click', function() {
                if (this.textContent === 'Follow') {
                    this.textContent = 'Following';
                    this.style.backgroundColor = 'transparent';
                    this.style.color = 'white';
                    this.style.border = '1px solid #71767b';
                } else {
                    this.textContent = 'Follow';
                    this.style.backgroundColor = 'white';
                    this.style.color = 'black';
                    this.style.border = 'none';
                }
            });
        });
        
        // Make tweet actions interactive
        const tweetActions = document.querySelectorAll('.tweet-action');
        tweetActions.forEach(action => {
            action.addEventListener('click', function() {
                const countElement = this.querySelector('span');
                if (countElement) {
                    let count = parseInt(countElement.textContent.replace(/[^\d]/g, ''));
                    if (this.classList.contains('like')) {
                        this.classList.toggle('liked');
                        if (this.classList.contains('liked')) {
                            count++;
                            this.style.color = '#f91880';
                        } else {
                            count--;
                            this.style.color = '#71767b';
                        }
                        countElement.textContent = count >= 1000 ? (count/1000).toFixed(1) + 'K' : count;
                    } else if (this.classList.contains('retweet')) {
                        this.classList.toggle('retweeted');
                        if (this.classList.contains('retweeted')) {
                            count++;
                            this.style.color = '#00ba7c';
                        } else {
                            count--;
                            this.style.color = '#71767b';
                        }
                        countElement.textContent = count >= 1000 ? (count/1000).toFixed(1) + 'K' : count;
                    }
                }
            });
        });
    </script>
</body>
</html>
