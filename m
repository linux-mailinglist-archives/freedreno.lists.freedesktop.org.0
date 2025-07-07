Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27BAFB277
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 13:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F67210E19E;
	Mon,  7 Jul 2025 11:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCak27oe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72DC10E19E
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 11:42:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56791tYh003150
 for <freedreno@lists.freedesktop.org>; Mon, 7 Jul 2025 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=; b=kCak27oehArBQbs7
 HuVS7QtbLw98lQGjXAIM1ZQbi91QEOJl470Erw1CPSFwbmpWoZJI8AhTW1ARWoHH
 VuLIiIr7gorBBzRs0Kf782/QHJZlApOyMg3563oHtd44/n5kw9VLPcaoSIrF9E/1
 sanKnuyOHFwzwft4XmBKJvDvkPh26v8obbfB8PIPOIPEsMPPhsvgOAlT3RCKYX7s
 RRKK85e9Y+B24cFwrPOIg9QpqL5p8ggllBIiE5df4ZHVvt+tzYKmmbPmYz0lFhWN
 YKe60w5hw/GScJNjYP84trOui3F/UQA5Dnc1Ik9sIV+Kt/utpy8D2CM6erN0ITQ6
 W8KgiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkcdqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 11:42:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d094e04aa4so55736685a.1
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 04:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751888538; x=1752493338;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=;
 b=vH4Fgi5B9PRlOXkI2sMwdQlT/wSG48gBQoYTVMRw+uphNGZljiZhVFgm0RWpZ5jvvZ
 XRJ7UnksnnazXDdN85Ck2NejmwutMQdZEVnmTj1my9WZT7nmneRcs+VO7CHZjtuMiBnn
 h/PG+NoRQyAbfEdC2PmsUF8CmqVKVrnPDPAAOQTN8nr+4w+WghanLRcAhUIYNsCNjz2g
 KhYX+3E4Fmdx2Kb6liHo8BDRwnQczgAJqEJMTGvtPnXubffXaUVaYMROfSz/uuWy2BYw
 u3xDIAN3/L8MmdHUBDUe6rjmwINWVz8u22oQew8cwgdBNpAVKYIBWsKYJv7id860encj
 iGmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3ms7x7Kax8zWoixNyhuHCzQkgVocnJZ67N1zSolCCbBAU/jfonfROabpew9bEoanN1WICjdqAukM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnfXMRzrmFBAuC08wcE1UM+CMBP5rzLG+HfaHhvWaBuATu4+d+
 AZces3UQs6DfUlAZWTlxFvof+xK0Jg7oXS6W85ysyJAY0l4tDyc7E2oOS5cHAaXKiRaoJa4AqXU
 6E5LRIoxR1UvtxWLB2ZDx/MjA91VCJI4hD8MIyvGiUVjqm19RlwdAzUL9RfTFbECzDT7wPSuEa+
 hCPW4=
X-Gm-Gg: ASbGnctPLVDhzCIn8El3OeE7XU2RZTLcl2wHHLoiqSQwdzlZ7o9ZG1xTKOSDhK/xH7V
 H0fllRAZLS5L3SnN2uk93F61nG9r7Wo2FflhyTYBdA/puQCJCR2F4x+gh25e/8XXdEOLKxqx4Pj
 cfE7J/yhUM/zybvXpHTs0IkoA1nkcQgDGYokrZncIg+ZCslWAPvUXKsZ3jAT8qf/OSeMXPDMHvX
 p+5cL0ApkYb6OC1UXzqIN+shDslLg3JEiyUAeKR7CyE7TZGEeVXFcxt93P1/cyA179p3R8+gDyw
 O8PcEjqWsVkR38Jh6yun5byMJHF9TJgRsFFezLV+uxHBzRcO8LdTKGfNVojKaRhCMjziVTEwedh
 zYJc=
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id
 af79cd13be357-7d5ddc509abmr651648885a.10.1751888537760; 
 Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9KOzB4zGkVpZwJx25vMl/UErrpqlqNGh0xSPchsvbG7/JV9ArfFw0uRjlumUIiFyMTjX47A==
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id
 af79cd13be357-7d5ddc509abmr651646885a.10.1751888537272; 
 Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b5e6fcsm695212066b.146.2025.07.07.04.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 04:42:16 -0700 (PDT)
Message-ID: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OCBTYWx0ZWRfX5YXL+L9Kkhhz
 f9u2Fe+POgfzdOnHAhtItN3Kiz9GCUyELc47J5U1RuE5zgr05qIn+96Qvf7HWwAtOlgGK0CJiub
 6/BkIREY3XdmLuUOOnEzdzh4YH6VDFNzYT1MZudhdz9Ug2N9ZUHmpDvlalfkg0itUwBFmZny8Hs
 ZbSnyFtcWKIRGIxBHkXh0aSTtTRD0dUNQ9Vca6I1fpOZBxcjyz4vgto2eDVa5KU9ps2Dnz+NbbJ
 81gZtgz0BhUy0K3SftUTvkCIZjqruesiEPSqEK1X6Yv8UVfGAVq0hrkTH5eSDXDBh28P8wLvMJZ
 kHCwoGxlw2aEFk+tHDf6yb3cBL16SpnObDdWRKnworAvup3nN02HKW166Gnxt2XbgW1Z9gpFDS5
 JiHut51pOQfgHiC9mgelijjShrtl5ry1zx0u042todym0qLQaoVrM6BggYKsfO1j+xHJIfxj
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686bb29b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=By577mDeuySOoy4OwVYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _iN3kmTKzwC_JsZbLChkmuUTDk7STQ76
X-Proofpoint-GUID: _iN3kmTKzwC_JsZbLChkmuUTDk7STQ76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070068
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

On 7/5/25 4:52 PM, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b6efc5b9933b..5695de1bbae2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -816,14 +816,21 @@ static const struct file_operations fops = {
>  	.show_fdinfo = drm_show_fdinfo,
>  };
>  
> +#define DRIVER_FEATURES_GPU ( \
> +		DRIVER_GEM | \
> +		DRIVER_GEM_GPUVA | \
> +		DRIVER_RENDER | \
> +		DRIVER_SYNCOBJ_TIMELINE | \
> +		0 )
> +
> +#define DRIVER_FEATURES_KMS ( \
> +		DRIVER_GEM | \
> +		DRIVER_ATOMIC | \
> +		DRIVER_MODESET | \
> +		0 )

Perhaps I'm missing some C lore, but do we need the "| 0"?

Konrad
