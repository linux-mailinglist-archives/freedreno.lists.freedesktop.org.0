Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32824A989BF
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 14:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD6D10E668;
	Wed, 23 Apr 2025 12:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9M+wcqI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A54C10E668
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 12:25:44 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAThrC022375
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 12:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 t2kUl9QgvO/uB6b51hcAn/oawqIiVbquzPdGvE1gnSU=; b=H9M+wcqITMErLoAk
 nCZGjwKmkqvEHEVExGXss+3rF0Imtxhh59d0youCTSamwjbJnF4KWRQ7zUSdrdE1
 7TFGsNEVGYrvgU7GPSAkBGDhcmdGmW2kf7RFQOwCNIVYuHFB/axONCL/Xpu3mDzY
 x5Sc7cM/yN+ay62Mt11+v8EWNlxGfYR7Iiyl7WR0pbqkoeRaFRop8CyqcQg0fBUO
 5rRqoS83uZvcyLewGFkwOjxhZCC5kowdwcsm+9Y2rdMRdGShrSTIn9AuW3YzTmUA
 SUA75r2+1394TjRCzieHwQ4D8c/GDx0lp7SRa45EexVwMcSepdKPN3d6A+Vaiv/i
 QCr4cg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh122rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 12:25:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8fb83e15fso15887456d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 05:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745411142; x=1746015942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t2kUl9QgvO/uB6b51hcAn/oawqIiVbquzPdGvE1gnSU=;
 b=BMzw8AUGpRVbezuD2+v7ixYfysn/A+3qP4GXXFWVuMcmLFxehOIlT3ikzn8cPGuIlX
 HVYY82CSANcaHHn4DqoUYzb4xXbN+kkjvXPaakfLGDNhv+0p1i9p522ILk5prXRfs+8j
 Camkvo5wVcwJMBeqVVoA40B2F0O2KpwGAL2jl7ytOtNF8IS4wLiH1l9hUREwfVhq0Rjl
 mHJUmRjM/0ylI3UZvVn4BiPuh0/HuElLJ55ZSLvCzKo4JPG3xqRRuG2tMTBLJCTl2f/o
 5h34lieK6ZtS5Hh76ePBMY3Q0/B4I8+g8+V48kY1HOlJzDGCVxCJPIPr8mHW71sbbtKv
 KWHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBmrsddiqqgNrUTHcXRehZcpE4OUMN2bP+kaBSWyt2SAGM1A2j9XK4f+NE11X408z25iSVOdMS6NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2U8pSPLV3P8XBXvHLvK8uhD0gbIJll9qGN/05ZoKATTKD4NO2
 H8lShPZOWqO0VRAFeElSDZDGBj+36anCOkF0k1dkYH3tep7W9TUM9YIZR4CdtTbEI0eazl0XEUa
 O8jGEXTUaWLjbXUNXVXdhgEj2pWEK6/em1u64IA7IAZ9QFoSlbMIvBEI+ZST8wjhsLxc=
X-Gm-Gg: ASbGncuiK9VjGCukwJ9omFPHfOMKZtx2/6x2HiiCyX99t2j8hOvcl/AMqFp3lR8YHD5
 ni6erWTuAcVtwS9nJEVUSr/UT7vYgJE72pFrjTj8yQek8V8Y21DmcRYT1NHFsQ+HViBQbWAkvxu
 un+th5vmkpQ1r2rCtgqQ13aFIKt2uULH62mzGd6iOFQOf3tZe+uLTqWKdZ0fXDaz6W3HdPIOsXx
 viIsrtXHtzdBXyTJajY+pKC9T5Jpj0/GiSRoVW1y/ubn1wjBJGc3gVOVnbS7u54cXer8wl3a6GJ
 jYkqIE+zgftx+xIKQZWwTVuiOIGj0KGQCzE+k+DSJeGpUbihN0mXXBN2FWTL39uP0Pg=
X-Received: by 2002:ad4:5d68:0:b0:6ed:122c:7daa with SMTP id
 6a1803df08f44-6f4b4715783mr16544146d6.4.1745411142452; 
 Wed, 23 Apr 2025 05:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8oXZ9JnKtVNQzSjdw+36R1Viqv7RB6F1PrfW3UoImxkzoWPf3HA1/z5215kcW7wchhdalKQ==
X-Received: by 2002:ad4:5d68:0:b0:6ed:122c:7daa with SMTP id
 6a1803df08f44-6f4b4715783mr16543846d6.4.1745411142040; 
 Wed, 23 Apr 2025 05:25:42 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f6255778b3sm7388108a12.19.2025.04.23.05.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:25:41 -0700 (PDT)
Message-ID: <8671d7f8-0d41-4574-a0de-aa40c1ed3c0b@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 14:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm/adreno: Add module param to disable ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-4-8dbab23569e0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-gpu-acd-v5-4-8dbab23569e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jebMlz4UL2x7ZXMc_ct4u7wuzrNyHQxR
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808dc47 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=T2YAUAM4dRpUgQIxx5oA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: jebMlz4UL2x7ZXMc_ct4u7wuzrNyHQxR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NiBTYWx0ZWRfXzOJpPYvhyMgs
 JSqeARy2OinXozu7F6X63s+mL353XXYoUxYZs5jRkz+Z5liLJnD2aghHr9VmFRS57VNEW0Q7s4n
 CdHJbLzIL8ksk5WyL0tNmVu6060Lr5dKsLOWFa72Wy+RD99BG2d0ft66QKAPOT/oUhsOHtqm3TL
 /2YJzl0zgteBVzUQyw/OaybhxM6383jhNQchIxmFYtqfQsnZGx6fV9EVDH4QrsGWBUggVyKLzhc
 y+TfCk4ccS//j55eW38zrOjn57diE9wnliQoHTXVqzoav3+2R/lzWDUyuddZiCh6iRUMHL9RLCx
 AXPfU5/l/3UDvy06/ZWvGPRtkCO758wxcFUwUyoaVfl77podaxrh3RaeE14ONdproVLtGNZmn8R
 QQcu4zQ719+FUrr/0QiGwKnOtOVvZP2kDLZ38zK16xCBnZlX/0Dz8pKVUompof8HlJEdcpp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230086
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

On 4/19/25 4:51 PM, Akhil P Oommen wrote:
> Add a module param to disable ACD which will help to quickly rule it
> out for any GPU issues.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 7 +++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 48b4ca8894ba38176481b62b7fd1406472369df1..38c0f8ef85c3d260864541d83abe43e49c772c52 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1670,6 +1670,13 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret, i, cmd_idx = 0;
> +	extern bool disable_acd;

'extern' in local scope is.. rare but sure, why not

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
