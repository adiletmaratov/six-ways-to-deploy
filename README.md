# five-ways-to-deploy
The source code for my PyCon 2018 talk "Six ways to deploy you Python web app in 2018"

# Commands

## Ngrok
```bash
ngrok http 5000
```

## Heroku
Create Procfile which contains:
```
web: gunicorn hello:app --log-file -
```


Run:
```bash
heroku create
```

It will add a remote to your git called `heroku`

Push local repo to remote:
```
git push heroku master
```


## "Serverless" Google Cloud Functions

Run:
```
gcloud beta functions deploy hello --runtime python37 --trigger-http
```

## Virtual Machine

It is much easier to create a new VM using Google's UI, so go there

Script:
* Create a VM

* SSH into the machine: 
```
gcloud compute --project "cloudkite-dev" ssh --zone "us-central1-c" "pyconkg-2018"
```

* Get sudo access
```
sudo su
```

* Install python-pip
```
cd /var
apt install python-pip
```  

* Install virtualenv
```
pip install virtualenv
```

* Create and activate virtual environment
```
virtualenv -p python3 venv
source venv/bin/activate
```
