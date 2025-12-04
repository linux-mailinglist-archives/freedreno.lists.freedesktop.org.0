Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE0CA3BA7
	for <lists+freedreno@lfdr.de>; Thu, 04 Dec 2025 14:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0C810E963;
	Thu,  4 Dec 2025 13:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqFv3iHA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2yBfjOc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7780C10E956
 for <freedreno@lists.freedesktop.org>; Thu,  4 Dec 2025 13:10:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B4AF9ap1087561
 for <freedreno@lists.freedesktop.org>; Thu, 4 Dec 2025 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=; b=dqFv3iHA/AWscMfT
 XmV19C7dBQ51O2gGGN34PlVrHuNtuzY8+B2hwucwHavQrm5v16imz0tw6bpj57Vt
 uWSS0rOW+k6gcl9g2uYjYGm2O5ViPSo6laRXs9OJXLG1a6R9RRP7TzhbjR+IeZqk
 TWV5OO67yFhGmmLLVpJGpA7NmUSpjRdwTGX1X/McdTEJ6s7oCdY5D7Fumy0Q3zvJ
 Tpm6CpzdoX4nIQBLBPWrkD+H8eO294HbdJTm6FsdUaPgYJkqIF2w6sG0GnG7Eh1N
 4aKbNx3rTrn0toEA564IFjRufwuzzlhO8gkbgaKJ9dAh956qPO6j7dzC1qpCm2hy
 siq0Mw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmdc4va-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 13:10:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7d5564057d0so2606698b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Dec 2025 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764853839; x=1765458639;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=;
 b=T2yBfjOc/VkPlipsqpF+VhTZDr8DgknSh4/QhwCpyXoGjT16r4Fs7S9LSEwF4L81zW
 p4XHjfSa3aRpbkYrUyMS73jXNhTc/VxRH8DhCyU6ThKK6DA4W42do/OeXDsSv6iE66rA
 wAEbMMQtMdH/l2/e2NcXddnDWc3R8pp0Sx5gTVBTR3K3jkYBWSMXx7pWbAyKiiw6Jc2Y
 GsoUexiCE5jUCzrUx9jxs1ldZbGjd9emeViQKrUHZzbDNYm6z/kENtEKn34yg359PONe
 t5fMiqwA3fSyZlcrHidLruHwS1e9kMTXM/gJvl0TTdw2mzSOSmVrsQvLlggXb/U/E8k1
 NTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764853839; x=1765458639;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=;
 b=NUT6tPLK7pDVVh1Ieh5bWFvwhQPEZTie28YuwvmszeznSBzQxjqjbKbDIhNIk3B/M3
 MmqSsU1//eBRQ6IoMsClJ0OoRSWorMDmqCdWKDJeFhJfod5XABYMD+VrE4atRfBpxjPc
 2JVHXAJMeC8fpAo/FMFavh/LNYaJGvCrrUb3lGYeJNqJOLGbrvYCKdGxr4s/5rBNdFZO
 6e6Vu6vKuL4u/3A9pE2lNDG/kG8l7oseDf+7tJIAjxIX+SoorCRkuvaKHxLUcJH4kcXp
 Ytg/7i3movuMgLBtyMkiBguakjhaTkclJ5SlEQno6cR5zWq5arrLOqHikR3bQg1gVSjS
 b7GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBf2d7FKKBN1EDqb9qe8E/0uzTFEo0hsfDtSzTBe+Uxz5TPdTfpVwkjCBsG3gx4YiEzk9lQyZjY+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxGl3t5fgAAL7CSWhfHA+vvrnvCrmJBqUqixIdRRGgGJ6cnKz5
 Xb6DFbkqrzIM9M80EhPw/qovHH+qZxxKmBYotAPRMymykC1yjKu7vPNecSMusToIDbYnuey8dTl
 xk+y2ueiGbjXoEf1fq+sMQEXZZoAxy5Picvk9lu6HBQOFLx7whM903VWbQpJA07DiAcfCGPs=
X-Gm-Gg: ASbGnctCGNGgyg0WXtmt8UTpzlRI+I/wQ34QFGItZQo3zwEdB8NdSibnER10E5Fzazu
 26TDYAoJZWT7uCW2uo3EkLQD47INcWko1Jd2pEf/bX9v+HDVf+iOygBxbHjHotWkNdWAlHsWH6e
 Ev/al6EkcYDFNbHftQymGTbHr2o06naNA5ZaKuYfqrP6mvnVRoJIY9qYsTmRKFXxGd1QSgVOFW4
 S3t+bAH3Or2O0j51ML2citRcKf7giHiItl1sbIbWiLlryap4Fk8TmEbYJPWJ/KtUPAg8UbK8TW+
 szAS1I0u6p6pRCtx5YTTf0gzbfyY7+YvlaGSFm2NXCWchnoZKRu2QVbG68g8hlLB7baaxwlfzCe
 iDBtvTCnYOsEHY5JwW3sLJODQSL5q0/tOrw==
X-Received: by 2002:a05:6a00:3a1c:b0:7a9:c21a:559a with SMTP id
 d2e1a72fcca58-7e226e2de0bmr3219793b3a.8.1764853839423; 
 Thu, 04 Dec 2025 05:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzWjvtqQGT91E8vkBQvMcAoAvWRgDe3oW5gq4ULEbuYC5TSGRTZv0nuedZ7pKUKHPPmAwtCw==
X-Received: by 2002:a05:6a00:3a1c:b0:7a9:c21a:559a with SMTP id
 d2e1a72fcca58-7e226e2de0bmr3219746b3a.8.1764853838937; 
 Thu, 04 Dec 2025 05:10:38 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7e2ade44a4asm2174039b3a.36.2025.12.04.05.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Dec 2025 05:10:38 -0800 (PST)
Message-ID: <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 18:40:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MQYIjqoXvS6CmHTSHieM-mimehvQ6-JX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwNyBTYWx0ZWRfX5n8esew67brK
 AoPqdXtfXQIIsqRzj5+7KyQYd6nXR8+hQ1mxIvsfABF+F6JGbNbskHgSa+rSFawIK5wMax+wlZk
 uENjR2VXLMhPOnlpjpZgfMIQCzz9VUcF5g63JTva73bc9xiFaN3/tPvFoGmBldBLR7cv+t2pYFV
 7yPE0YwUVGHKxottBnpTzjn4Ty1XuWxs58BYUui5Qg/g/GdDehH7sa9lTeYV5Jyz/wfHZ78lQXa
 G3G3rXrz3BkU2DFXRK9ihn3EDzvSl5hydjUA9xaMRWXLZw0JBA+Tuxsipi/iV94nJqUig9lIxUs
 z/yJ3TjnMnnlmIPNTHB1EipO6jYJXcCGqfSoAauIx/Nk6nxzpTNHjKYSfVikg+5Dw93mLSPu91C
 s4wdcTr5uwlTcSiE2nbgqdNts7Ws2w==
X-Proofpoint-ORIG-GUID: MQYIjqoXvS6CmHTSHieM-mimehvQ6-JX
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69318850 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8zqzhdr9uPwxYiBKMiUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040107
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

On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>> Some GPUs like A612 doesn't use a named register range resource. This
>> is because the reg-name property is discouraged when there is just a
>> single resource.
>>
>> To address this, retrieve the 'gmu' register range by its index. It is
>> always guaranteed to be at index 0.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 5903cd891b49..9662201cd2e9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>  	return 0;
>>  }
>>  
>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>> -		const char *name, resource_size_t *start)
>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
> 
> Can we drop this and just use devm_platform_get_and_ioremap_resource()?

This API seems to lock the io region and fails with -EBUSY if the region
is already in use. I am worried it may regress other chipsets. So, I
dropped this idea at the last moment.

-Akhil

> 
> Konrad

