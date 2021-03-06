echo 'Run npm build'
npm run build
echo 'Done...'

echo 'Format index.html as Jinja template'
python format_index_html.py
echo 'Done...'

echo 'Install python modules'
pip install -r requirements.txt
echo 'Done...'

echo 'Install Django Admin Theme'
python manage.py loaddata admin_interface_theme_django.json
echo 'Done...'

echo 'Collect static'
python manage.py collectstatic --noinput
echo 'Done...'

echo 'Run migrations'
python manage.py migrate_schemas --shared
echo 'Done...'

export PORT=8000
echo 'Server runnning on port ' $PORT
python manage.py runserver
