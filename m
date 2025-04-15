Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3398A8974F
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 11:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C31C10E094;
	Tue, 15 Apr 2025 09:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqOpzx74";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38B210E2AB
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:00:03 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tTsx002505
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AQfepw9ye4d/Sw6PIpGIUW7pKP12q7jW28+QB4VgaF8=; b=VqOpzx74DYeT39j4
 IPfoYHGjfM8ZDyDmQKnuleirjPOxyXlgWQ6xpEd/P6QqBaXZqfnhudoB9gPvBIxW
 1bX9/y2cbXRHL772rXQelfk+AwStp3BoD7NALIvNVLo5c2wsC4dr36IgyJBnPgh0
 8QM4WvT4kIAJb9EJlQ5grJ32Kkc6dn+PLOvh3MkwIBZKcvOmEBT6PK+fB58mqAKd
 x80lW0mfYPrg9FZwDReJ1fKr/8uyxiINA+zaLeXHEjyRj4c+VtYf/nVx8TpwcT6O
 nSYNmbVQOW4DOII+F1FR4KI/vBptvY+EuWoEAaQIZx3oIGdrPXwzZsQtX7euEbK+
 Htydbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjy8bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:00:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5c82c6d72so962016885a.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 02:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744707602; x=1745312402;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AQfepw9ye4d/Sw6PIpGIUW7pKP12q7jW28+QB4VgaF8=;
 b=jD8+HMLYFpZ0lzJqEL9we32hWOvsQZdD3qQyFYfoWxWLItSZXt6gfTLwi056TRgmis
 lBelSkNoooYWgvz7KFBtjFFlxE+CAVUatnYCiVR/aLcBR/LmEM+NL//QJYLicyVEEB85
 97Xt7/MWJEFpRX9XZ+2Cib0/krUWjw2FCk41WcOvCYzjoLUmo0FjBqMiUwzZN1htod08
 TfLXAcr5eC0lwZrNJtuK0dlhIfu7dswkZD+UkJlTWO/bQMtM3kSy50EZPFd5umLXRfMD
 o80Yo0b7i+8SZ5Bcb0pHtnYXiKOLMqMukV2Bl3l1CahVUq7oIYRrbRoKOvPm3ypHYTnW
 LJqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoT/xIMmElGbXw10D3hqmVrPr6t6hWHQ0FXswdnNu90C7EfD/JRtbYyCwHdpeFmhJmF6jG0gc5ofs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSUF6YCBDcmqlCOgnf9W69vqqKICNXFOyXdL4VEtqc79nwxOUY
 zZH9T58UM0G9kDT7sK+C1DBxBZukfg54YA/dcpGOCUK9e5JjFoxBOJAgWtoebaooL3sctO/Q2xM
 yL/fkTuSLyw7d3/F++WfOcXmSB3uj6INHTkcT+/jWwGf28fRFJyIPoE556rp4c1fLny0=
X-Gm-Gg: ASbGncshd1Z6K7lfhOEax5xFxtZNvO+zCLtnpj2tBvTqfGF4WTvW3STFvHJ2+KVLnSo
 JdMICPihszbDcwCMLheb2lACL9Tysktk86GwxLD0KAiDA2u/K0WfVDC3gus6G+9uzV3esIzrCga
 IxB1awWSbeBFqWTgc6iY1gjKg2OMbZOjStzvmk0xx0XY5PDmNXk5Vw6zuIYQ+XqJ2DSovxAVeY/
 YELjE3BCNQp2FSv+/+ndgikFjeAdeIMEtZFjIKy+dd3mXfJd3mxGhAE11K0JWQIkjuqs6dl79Xj
 7gQ7HDThVh9XpWzw7+XC/Y4fr0Qz+/ZLuD4tKScOL699p4zlHKWjLsgoW5WXCUCTeS1qIDGJNJe
 aHbmotDFKnrvsGh/D9Hba0K9ZYqurhQHCi8kz+Uy7pz8a4a9utnjDygU/GktB
X-Received: by 2002:a05:620a:170b:b0:7c5:55f9:4bbf with SMTP id
 af79cd13be357-7c7af0c0e77mr2367828185a.7.1744707601963; 
 Tue, 15 Apr 2025 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESAyXoVLPjZgJIbP3L2JUlerT+JWqD6z0UX/136WNz5T6IEY76btFrfuYKR0NSWX/Mfql5Zg==
X-Received: by 2002:a05:620a:170b:b0:7c5:55f9:4bbf with SMTP id
 af79cd13be357-7c7af0c0e77mr2367822485a.7.1744707601439; 
 Tue, 15 Apr 2025 02:00:01 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd?
 (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi.
 [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d239708sm1356448e87.85.2025.04.15.01.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 02:00:00 -0700 (PDT)
Message-ID: <9f64ea5e-1b59-4522-b55a-d9b11e412ee5@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:59:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm: move wq handling to KMS code
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com>
 <20250413-msm-gpu-split-v1-1-1132f4b616c7@oss.qualcomm.com>
 <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtG2K79zAd9tyNAG7JSVhS2sPdC-VjqubpmhD9AvoVoAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe2013 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vNUryEpXin0155aUV7MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: DdRV3Oczh9cxtmP-YwXzY4TwwJ8iPsDi
X-Proofpoint-ORIG-GUID: DdRV3Oczh9cxtmP-YwXzY4TwwJ8iPsDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150061
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/04/2025 18:58, Rob Clark wrote:
> On Sun, Apr 13, 2025 at 9:33 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> The global workqueue is only used for vblanks inside KMS code. Move
>> allocation / flushing / deallcation of it to msm_kms.c
> 
> Maybe we should also just move the wq into struct msm_kms?

... together with several other KMS-only fields. I will take a look.

> 
> BR,
> -R
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_drv.c | 21 ++-------------------
>>   drivers/gpu/drm/msm/msm_kms.c | 16 +++++++++++++++-
>>   2 files changed, 17 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>> index c3588dc9e53764a27efda1901b094724cec8928a..02beb40eb9146941aa43862d07a6d82ae21c965e 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -82,13 +82,6 @@ static int msm_drm_uninit(struct device *dev)
>>                          drm_atomic_helper_shutdown(ddev);
>>          }
>>
>> -       /* We must cancel and cleanup any pending vblank enable/disable
>> -        * work before msm_irq_uninstall() to avoid work re-enabling an
>> -        * irq after uninstall has disabled it.
>> -        */
>> -
>> -       flush_workqueue(priv->wq);
>> -
>>          msm_gem_shrinker_cleanup(ddev);
>>
>>          msm_perf_debugfs_cleanup(priv);
>> @@ -104,8 +97,6 @@ static int msm_drm_uninit(struct device *dev)
>>          ddev->dev_private = NULL;
>>          drm_dev_put(ddev);
>>
>> -       destroy_workqueue(priv->wq);
>> -
>>          return 0;
>>   }
>>
>> @@ -227,12 +218,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>          ddev->dev_private = priv;
>>          priv->dev = ddev;
>>
>> -       priv->wq = alloc_ordered_workqueue("msm", 0);
>> -       if (!priv->wq) {
>> -               ret = -ENOMEM;
>> -               goto err_put_dev;
>> -       }
>> -
>>          INIT_LIST_HEAD(&priv->objects);
>>          mutex_init(&priv->obj_lock);
>>
>> @@ -253,12 +238,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>          if (priv->kms_init) {
>>                  ret = drmm_mode_config_init(ddev);
>>                  if (ret)
>> -                       goto err_destroy_wq;
>> +                       goto err_put_dev;
>>          }
>>
>>          ret = msm_init_vram(ddev);
>>          if (ret)
>> -               goto err_destroy_wq;
>> +               goto err_put_dev;
>>
>>          dma_set_max_seg_size(dev, UINT_MAX);
>>
>> @@ -304,8 +289,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>>
>>   err_deinit_vram:
>>          msm_deinit_vram(ddev);
>> -err_destroy_wq:
>> -       destroy_workqueue(priv->wq);
>>   err_put_dev:
>>          drm_dev_put(ddev);
>>
>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
>> index 35d5397e73b4c5cb90b1770e8570277e782be7ec..821f0b9f968fc3d448e612bfae04639ceb770353 100644
>> --- a/drivers/gpu/drm/msm/msm_kms.c
>> +++ b/drivers/gpu/drm/msm/msm_kms.c
>> @@ -227,6 +227,13 @@ void msm_drm_kms_uninit(struct device *dev)
>>
>>          BUG_ON(!kms);
>>
>> +       /* We must cancel and cleanup any pending vblank enable/disable
>> +        * work before msm_irq_uninstall() to avoid work re-enabling an
>> +        * irq after uninstall has disabled it.
>> +        */
>> +
>> +       flush_workqueue(priv->wq);
>> +
>>          /* clean up event worker threads */
>>          for (i = 0; i < priv->num_crtcs; i++) {
>>                  if (priv->event_thread[i].worker)
>> @@ -243,6 +250,8 @@ void msm_drm_kms_uninit(struct device *dev)
>>
>>          if (kms && kms->funcs)
>>                  kms->funcs->destroy(kms);
>> +
>> +       destroy_workqueue(priv->wq);
>>   }
>>
>>   int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>> @@ -258,10 +267,14 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>          if (ret)
>>                  return ret;
>>
>> +       priv->wq = alloc_ordered_workqueue("msm", 0);
>> +       if (!priv->wq)
>> +               return -ENOMEM;
>> +
>>          ret = priv->kms_init(ddev);
>>          if (ret) {
>>                  DRM_DEV_ERROR(dev, "failed to load kms\n");
>> -               return ret;
>> +               goto err_msm_uninit;
>>          }
>>
>>          /* Enable normalization of plane zpos */
>> @@ -319,6 +332,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>>          return 0;
>>
>>   err_msm_uninit:
>> +       destroy_workqueue(priv->wq);
>>          return ret;
>>   }
>>
>>
>> --
>> 2.39.5
>>


-- 
With best wishes
Dmitry
