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
```bash
git push heroku master
```


## "Serverless" Google Cloud Functions

Run:
```bash
gcloud beta functions deploy hello --runtime python37 --trigger-http
```

## Virtual Machine

It is much easier to create a new VM using Google's UI, so go there

Script:
* Create a VM

* SSH into the machine: 
```bash
gcloud compute --project "cloudkite-dev" ssh --zone "us-central1-c" "pyconkg-2018"
```
where "pyconkg-2018" is the name of a VM

* Get sudo access
```bash
sudo su
```

* Install dependencies
```bash
apt install python-pip
pip install virtualenv
```

* Create and activate virtual environment
```bash
cd /var
virtualenv -p python3 venv
source venv/bin/activate
```

* Run Flask with gunicorn
```bash
gunicorn hello:app --log-file - --bind 0.0.0.0:80
```

## Docker

```bash
docker build -t six-ways .
docker run -p 5000:5000 six-ways
```

## Kubernetes

Build an image with a proper tag and push it to Google Container Registry
```bash
docker build -t gcr.io/cloudkite-dev/six-ways . 
docker push gcr.io/cloudkite-dev/six-ways
```

Create a Deployment
```
kubectl create deployment hello -n pycon --image=gcr.io/cloudkite-dev/six-ways
```

Expose to public
```
kubectl expose deployment hello --namespace pycon --type=LoadBalancer --name=hello --port=80 --target-port=5000
```