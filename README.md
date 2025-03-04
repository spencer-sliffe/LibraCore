# LibraCore Django Backend

## Install and Run

1. **Clone the Repo**: Download and install Repository from [here](https://github.com/spencer-sliffe/LibraCore.git).
   - **macOS/Linux**: 
     ```bash
     git clone https://github.com/spencer-sliffe/LibraCore.git
     cd libracore
     ```
   - **Windows**:
     ```bash
     git clone https://github.com/spencer-sliffe/LibraCore.git
     cd libracore
     ```

2. **Start Venv**:
   - **macOS/Linux**: 
     ```bash
     python3 -m venv venv
     source venv/bin/activate
     ```
   - **Windows**:
     ```bash
     python -m venv venv
     venv\Scripts\activate
     ```

3. **Install Dependencies**:
   - **macOS/Linux**: 
     ```bash
     pip install -r requirements.txt
     ```
   - **Windows**:
     ```bash
     pip install -r requirements.txt
     ```

4. **Setup .env** (Skip for now):
   - **macOS/Linux**: 
     - Create a `.env` file in the base `libracore` directory (The one w/ manage.py and requirements.txt).
     - Use the following template and replace placeholders as needed:
   - **Windows**: 
     - Same steps as macOS/Linux.

5. **Migrate**:
   - **macOS/Linux**: 
     ```bash
     python manage.py migrate
     ```
   - **Windows**:
     ```bash
     python manage.py migrate
     ```

6. **Create super User**:
   - **macOS/Linux**: 
     ```bash
     python manage.py createsuperuser
     ```
   - **Windows**:
     ```bash
     python manage.py createsuperuser
     ```
	 
7. **Run Django Project**:
   - **macOS/Linux**: 
     ```bash
     python manage.py runserver
     ```
   - **Windows**:
     ```bash
     python manage.py runserver
     ```

8. **Run Django Project**:
   - **macOS/Linux**: 
     ```bash
     localhost:8000/admin
     ```
   - **Windows**:
     ```bash
     localhost:8000/admin
     ```

9. **Login with your super user account and should be up and running:)**
