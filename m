Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E718BCA3CFC
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE55310E964;
	Thu,  4 Dec 2025 13:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiQ/TYI6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTznLwM5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4171310E964
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:30:45 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AEvqt1087155
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 buqTDMgxwcJdU2rKqNQeB9xrQ21rgt9zzUq0zRH7NEw=; b=QiQ/TYI6APScS+NJ
 niD/QTuZM9Dopbgfnswavv00ciOyPZMwn1dj6Nl4L5whp4ls1c3Z+jVp7Lk/abd9
 89bn90gp3fulPEPZ6kZ9A/9UT81Lj7/8/m9sSc3WwONjqLTWM71UjC7kSI6cPxx1
 EIriU9m7leaaWO/CuMj2FP/gQ7zf94YBCfKKSaU9WE4knki37X5Rdki2fRz7AJxj
 PTY7R9A8T1Q27B5Vn55IzcepLKsYZEPhG5UpPCItC1rTu1Qe8AzcdGb72IofBaWt
 tFQ5uMNkYEnIgSfmQHc0f1/sg43/flis4NFCMJotPGALrPbHUcl9CbUXSL9jf6ZX
 qpSA6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdc69u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:30:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b2fdf3a190so6908585a.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764855043; x=1765459843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=buqTDMgxwcJdU2rKqNQeB9xrQ21rgt9zzUq0zRH7NEw=;
 b=CTznLwM5y+hryGnNsth1R0tMS7KeI79Zxrkq8jHj0jti5NVm0eS7+dX7UN1KSMbxe3
 tncGyzAkNMKsvIeTtXLkeMitfJyAuc5gB9DCF6nOLcj98WF1vLBZbbdIbiZ+ljQT7Int
 aQETsAtZooHROIWnr5vtKFyCOcd+oLkVqXZg7Tp9jEEOjrJkyhTtUYehw+FUiLkE9FJm
 QdZOxJkcd9QvCzCx9M4qXcrhta8diKmRMuHQN2MI/eKkojKYyGSfocsqxXIbiWjRnofN
 cLWr/rmLmrsapa9DVOGpJIU7bsLoCCLxFgcKrdUda7bTeq61m6b/fAaFHI5VZ6on0rJg
 QCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764855043; x=1765459843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=buqTDMgxwcJdU2rKqNQeB9xrQ21rgt9zzUq0zRH7NEw=;
 b=hxGnSRW0EbD/Ld7lT1kVdTK+gF3hSvMydc1yYcl7kkzR0dAu3Za3UskJxbJRbANo9f
 sUj3ogwBH7Y4LeZgEeBftWWB0j8t+T2xeUl02Jp8GMCqPIpa4K4iBNn30bGheLRdLOZu
 rulprP/RD4uBm/3CEZAGCdmarn+XvYOO4xlba1fFoobrsEqtFRPydHeGL53xiboUnLUM
 tHFN+UomVMYdXZ77X4XHDMYijry8mDF+TpGPi8LwdWRwQdWMygXcLdhsPsyAUh4cjtAh
 MYwJdRHzCPYwOOVTkkAOza1rf/g4YYu9zQpTt8YjaLw2xEkb0Rc2r33Ko9Cggf2l9eTJ
 SIJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoUuunCFzTFUEX3wT+z4PNg4O5I0JijKuN5Pk//cfRednrNrxpwPHpfGF/XIf3IT7iodBnSvcyssw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlzlB9vXIIQ4a88Bo1dF4pMLziDho8bi8U7LmGi1lk8S+Zh0XE
 Y5BNfBuYWkioKyo6gzCpaSIfy1OaI5AJX+cdc+DPT8aWtXvTnS1qlEQjrlcjwGtG8ar8CzeH/3J
 zCOR20kuxoM6lPa4grr6Zgw1HWbuvSAYNh4QkPqfnvUvKWrqAnzP7lS/FG2yhC2PxCS37MNo=
X-Gm-Gg: ASbGncvazX1C7PMz0Ilx5tta3nZvRwehB6qejqfS3O6pSG7qZ0redQkSJH1wc7vBvo9
 1BopKhEwowOyupHAURIz3Ok8LiWrYdNoOqoNYd+YHKetZrBR96YMHiik0pXgzkwi8G4yzmP5xkC
 40m+WHt0wvM7eb+/XnLDeqQajGpsZ5Z1uX3oImseXnTC82+E2+mZrzSmLHyKlg/tG9U3h/YFcMK
 j9tDLkOPwp9iEUhL8AHO26bj3Al1CESSBzFYJmwNFlxDAyk/pGi3EQLyXifq3OYpZFwD+Ifz0a2
 PmWFUkqOyPaN5PA00FnRpI1hb3nGDPoe27gbbAbI8+E12n4xX994ur3IyPcQjFZjmCOIyBNgaC5
 45ltARcoSOdLHx67wEda3A2dHg3I7LNXwXybnUYQZwvKt6B0VJim6T+kUnwzLNdwacA==
X-Received: by 2002:a05:620a:290a:b0:8b2:a3a9:f74b with SMTP id
 af79cd13be357-8b5f8c1fa04mr559434085a.5.1764855043062; 
 Thu, 04 Dec 2025 05:30:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQbVNCrVse/bjoDzfy1Fu+IxiNUu8UAB9MickHfd23NqRepjSCUo8+osnt4fnvQ4yhGxnlMA==
X-Received: by 2002:a05:620a:290a:b0:8b2:a3a9:f74b with SMTP id
 af79cd13be357-8b5f8c1fa04mr559426485a.5.1764855042388; 
 Thu, 04 Dec 2025 05:30:42 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f4975dcesm129404466b.34.2025.12.04.05.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 05:30:41 -0800 (PST)
Message-ID: <7b4bcb6e-fbb1-45f6-921e-dd1340a8cece@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:30:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
 <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _3Rspe8KFgwDlMkD7qKzFVCVtK42JSpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMCBTYWx0ZWRfX85dTteN+3Rb+
 jvPjJ1YZx0bLgsWqmK4crj7Rh8yTIO7Bv1gC7BJ7mrPZnzZW0OL3S5AeumRqKkwgSI8IQkOEt5w
 YnEDv8nizT6GFg28yBAfDpoQa6jdtozDaC4opepZOybZx/4m+Po51Dg+0+p0Mwz/evsQfZO+vBi
 4KVDAfY/IGySrRExUNVgjYVeqTL02vhWiuw2BKv6BBIWZHmrBm8aT36O6pWjn0/xVXs8vrIsw5V
 D/MNpc0ANSMCxPaxKXKuB914Royu4aXsYxjfIdpAb75i8HwbFCQwWwPYCeRChAvQkJNSyAxxl+1
 HJjQ06ztgLvHg9bOoZ1N7PgkEfB2wmcUvYYfQAnsJ1rETrMN0bRNlsyDcYK4yAe/qxkc1CMgtan
 0+y1mjYxcwc1jAWfQJu7oXJ1n6psDg==
X-Proofpoint-ORIG-GUID: _3Rspe8KFgwDlMkD7qKzFVCVtK42JSpe
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69318d04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OZq_gVfAIbbHJCx-Pr4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040110
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

On 12/4/25 2:10 PM, Akhil P Oommen wrote:
> On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
>> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>>> Some GPUs like A612 doesn't use a named register range resource. This
>>> is because the reg-name property is discouraged when there is just a
>>> single resource.
>>>
>>> To address this, retrieve the 'gmu' register range by its index. It is
>>> always guaranteed to be at index 0.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 5903cd891b49..9662201cd2e9 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>>  	return 0;
>>>  }
>>>  
>>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>>> -		const char *name, resource_size_t *start)
>>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
>>
>> Can we drop this and just use devm_platform_get_and_ioremap_resource()?
> 
> This API seems to lock the io region and fails with -EBUSY if the region
> is already in use. I am worried it may regress other chipsets. So, I
> dropped this idea at the last moment.

Is there any specific platform where this would be an issue?

Konrad
