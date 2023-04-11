# Docker 이미지의 기반이 될 이미지 선택
FROM python:3.11.3

# 작업 디렉토리 생성
RUN mkdir /django_app
WORKDIR /django_app

# 호스트의 현재 디렉토리의 모든 파일을 컨테이너로 복사
COPY . /django_app

# 필요한 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# Django 프로젝트의 실행을 위한 환경 설정
# ENV DJANGO_SETTINGS_MODULE=myproject.settings
# RUN python manage.py collectstatic --noinput

# Django 서버 실행
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]