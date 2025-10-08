Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871C3BC49EA
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 13:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAA910E30D;
	Wed,  8 Oct 2025 11:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LwqS+2Up";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CF010E30D
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 11:51:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OPc011740
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 11:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y0WlonZzhT+aPa6S+klAQl8ZLyn+O2jbA9B6NJTdYUU=; b=LwqS+2UpafhDGXMn
 Md4iM6GKpIekhqaCFz7wXsm620Hpq15SUXKTd5hrq6u4CMxSSbdB7NU/JgbYYor6
 eIl9p6Ie88g2nnDXQysZo3YslcjeJjAw4TY44eTsOyGaAKtyLrddepQrFtebSDTc
 JpOBlhFTNmSqWwnGt2mJj8u2H2p6MNyKJJrrStfnifBDGgnnGQOPs13qnRePKx8S
 fcKcgr8jWXjH/sWfDDIM+Zq96LbQZbEwxH4W6pxh9JMKq9VqI7JuuFNM/ShdG3C6
 IhH9Jl/28oWOmhozi0AC8Zf4fLErFyoPHdnkp3DeXLaqKD3jMP4SdeFa7Z0Hje9v
 rxAukg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpw4rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 11:51:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4dc37a99897so18902941cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 04:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759924282; x=1760529082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0WlonZzhT+aPa6S+klAQl8ZLyn+O2jbA9B6NJTdYUU=;
 b=EDW8CQOweZI3KKRz/3BfszlVo0Cn0GP0sewzNqZBrxUbSGa5icPaAg91snLqmuySNc
 Hc7RI3JtLbGFZeLrf0FdiBZx2ZfQAy+EpG9H5GcGWEYFiEmiKWdq5ArY2XXO0JPmKhk/
 ieM0cV4lMfL6JnW8X1fQzrmI142kOA+1E5F7irFmnGgOvIm6Mb0BYHP1OvpLXApxm/WJ
 991gl12IIG/H34ngvu29Rbj7bszGDUwL/VX5ZLLr94SUd10xmNm5kubUQxjCH4nN8Dt7
 sw2d/rcBm0FGo2BJkoWYCgSUT5BUR3KB91oNoNZcqDpjwi+fhrZwhwdEkXskLld7k0FZ
 +dew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT3UcLqOJnydWdGDRXmIoJ9P9Ycx713DJzeeNuTNV71+83ZpDl+XbdWN+GQGQl03n17Bb/oMR+uSQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZn05uSlgOpa65F53YdDtGcandU+vm/LaAWrMgYx6Ffym3YEwO
 FPFUOmRlvglnjkgH1y4TUue6JUXGBF8QUjYzxytSkTjzb1nWGxwitlQpgxGy6V5YjD05GWNF4Bo
 iCk2BfFdHqeoXSk+mY0kKhzk3oVZQv93ZQS/1B1Dl4v7kuvVf4CQavH1sTXRbyHM9YgrUVhU=
X-Gm-Gg: ASbGncv776b/CnKqtFS/irhNb7BfigErn8ANEMlC5LFJdEyiAEhDk1DqN+yH0FZ+85h
 olsoolyzOa+toPvh2hdx69JXF1VQcYGdEHNEAdqAdYjFOThV7mmxN1pjmN7UA6wE5tKAD3hySl2
 F1afMP7kwtt4ppqNMJf7fDSqXVb8mApvoJfip8vJ3viIsdhV+kYwuzpDhPJDYtHLP3/bzYW5xIE
 53pUSx1vIQBkBvOPdCQvoe2zWEteZLs2KXZ+VLccRTV0Fh9Byp+5TflbQOA9uV3VFG36F/ADiXP
 k7YSdGYQ41GMEDVSR/9h5Z7GDOUkOfWppGqg3mBl2jv1FtOrQTCrozur3pMzf/ppDigVk5Rswv6
 wD1jan1O3VBN2RRJDz0dS7Hr/Xkg=
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id
 d75a77b69052e-4e6ead5eeb7mr27149981cf.11.1759924281824; 
 Wed, 08 Oct 2025 04:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2gWRn31Utay2MX1qgHKnxPLPzAbFxKTM0QkU36eLSGUOX9zyx3iPasVrXq6nEJTPeMh4/9g==
X-Received: by 2002:a05:622a:3d3:b0:4d8:85db:314 with SMTP id
 d75a77b69052e-4e6ead5eeb7mr27149701cf.11.1759924281298; 
 Wed, 08 Oct 2025 04:51:21 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b37bsm1681982366b.53.2025.10.08.04.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 04:51:20 -0700 (PDT)
Message-ID: <5a027440-8720-4df9-a793-5ac3a624ef60@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mwXOkySOyQsfdYnft8SyV7F56FcbA-mN
X-Proofpoint-ORIG-GUID: mwXOkySOyQsfdYnft8SyV7F56FcbA-mN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXwUFe5+YxWDZJ
 pJb0iHbbu+NYU9DSqdCKpk1KzaqYw4uSTplCpFNmgcRaMB+eiuDkXGYQhrdUCr7U7jpq1wJYNKZ
 HO2Z9jS6oLUQLZapegA5z9m7t8aYJ+D3poLdfsKGdpQKQS+YtW9vjJ+lqn2N6UJcGJzqrLcBfl8
 T0UuJBeHycM4ti+fIkd3KH2PROUJzxuXtWz6Na7sG7HU7iU1ISE6c8CmpBVfkmWbWMOA4lJw479
 S07xOnd4Jq1rA0NJfG0A7XZE9JALwh2eLVXWPFJHbwflrUDGeoucXM2vHD57JMSwqRZOVPZbmFT
 TuozZqrW5aL4VA7t8XuIBFmnU4bC3vs2MTKzr0uMTP9Z/L77D9XswfDp01bkA+Fn5CHaR7tdfmS
 ydG2Mpp0Dvj5z5m3CfEM6DcjkH0qGw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e6503b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=abYYEtMJDLCSMuBgjaEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu
> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index fc717c9474ca5bdd386a8e4e19f43abce10ce591..72d64eb10ca931ee90c91f7e004771cf6d7997a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -585,14 +585,14 @@ static inline void pdc_write(void __iomem *ptr, u32 offset, u32 value)
>  }
>  
>  static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> -		const char *name);
> +		const char *name, resource_size_t *start);

Maybe you can keep this offset variant and switch to a simple

devm_platform_get_and_ioremap_resource()

for others (also letting us get rid of a number of iounmap() calls)

[...]

> +	/* The 'offset' is based on GPU's start address. Adjust it */

That's what an offset is, no? ;)

I think we can drop this comment or move it above the #define

Konrad
