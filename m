Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E72B0DE9A
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 16:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0ECD10E699;
	Tue, 22 Jul 2025 14:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RxG/FZr4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C6B10E699
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:30:23 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MAHmxF005664
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x/SZ0lHFoJHSAX7MLV7k/Qc97OKQJ9c7d2vsYjpczs4=; b=RxG/FZr4xEQeY5vn
 qX0sSrMzgTq88IcR0hMrfzu1DG7zz++O/Lr4qUiZ4BpYMf1H1giGoptn5fgASdYu
 1ObLnGbCwr1ZmFHNUcOOmgpWZl25DwCALBpE2u5ybbdzbmO1VPC05IU2x5xntwY2
 9LvZmsMFtEBiobzrI4UnwVd5wAWazVZpkFS0un7Gj8j2sF23onazRJsScif5oee+
 DdN63Eqg1ZaLwfSLz8/hoH5rdt49Rib7jtZxL+HW5gCDDYuHT42RWz2axWsv5Sru
 YnJ56uXovMXv+pKNUgcbcA0r8R+R+h2H+krvNdnxXN4vapRvF8XVPE9IGygnMAZy
 +oeBJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q9sms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:30:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6fac0b29789so20617946d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753194622; x=1753799422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x/SZ0lHFoJHSAX7MLV7k/Qc97OKQJ9c7d2vsYjpczs4=;
 b=unuGW23X6/fsovbVTQ2iF9huKXiREk1WGa+Xvm24CkK8l/QQYpD7DoIRlzn1FHeR3f
 uL5Rw6OU2zSFcbDfUCKyg6+zGaIvjrYxxS5+3Fz60osCBKdeI+WL6vY+khG36mxPuBvn
 jzFVNCL/ly8hsHvoKYCdNV6pi6EW8ZCzSfFxiYZZT4Pq8HWpP680NdP4bvlnq+56Qc/Z
 lpR0fKwbCjO49ufPgmiM8YsceaEZF1nf0YjFMq4NKAlHj8pnPjqyJNUYUaF5RC/q2xPb
 oyprq1RSZi0773sjuUi3gi7k3xXp6bvYod9bYtgjET7IqlgW0JeIOGsNY5fj47KNv45W
 1//Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUs9wM2mJJSKsGVkDt2xndi+mnBdFNWbdyI7ysGl3uKPdte3gvvTlBIG2pcYTtHoeHmMq5063MKHgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym5ysKxJDPxnbmAESU/MRSCBchMKrxii4XmxbGxERk6Qy69mYy
 AMklzcuc0tdxrQhRYzmq8vIE14D+9YlzkK+qIFV/WtWCI32OE/2MYFCXCStoFgVs3RBBB9fcO7p
 CtGjqLQJfnCSo7CCtyJKuTb6jKX3HYbDG9AksHdhq56S8Thc25b28eleKYIrB06cuzeEoGLA=
X-Gm-Gg: ASbGncumB8KBFQl9TgCH5pmbSb9gw26BIb1kv77yDYCP/dO1tlRsTMMg6pZ7Fnt13bm
 0bpgeeVuROM0zp7EcMwz1YhWlRI700RE9FdgwtZ4k1IA1toyAku4Ug7SXYyPh2X85VV1xZw3aFO
 //56QKnZknkKAc6btFc+sM9ZWK/YShogYekRqiPz6LTh8AKXWIQzH3Dv7GvxBo+l0d49Ul90xDT
 z1ToBWpCSShniDR/GZh2odJpK+05ZZUEvn1aQ15EBSIL6FHmzpFm3r/IPQUxR3CqTociMnEVLyy
 faUjfq+Qkfs73GFclZcKrfcrVb1IuSRX62MOhv+hzIhPNWpPLxmmxdWtJFZX9IbmYKkxWOgg4Db
 04dNMSDHBDfxPj9G7FQCg
X-Received: by 2002:a05:620a:a48b:b0:7e6:2435:b6a4 with SMTP id
 af79cd13be357-7e62435bac5mr97899085a.12.1753194621229; 
 Tue, 22 Jul 2025 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELIFe7dttYXlWKLb8+yk+ojhPQpxXLFbOGTgUNnufmtAMzR7XiOb6CgD79dyMxVD6171XqNg==
X-Received: by 2002:a05:620a:a48b:b0:7e6:2435:b6a4 with SMTP id
 af79cd13be357-7e62435bac5mr97890885a.12.1753194619840; 
 Tue, 22 Jul 2025 07:30:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aeefb091e4dsm486326866b.12.2025.07.22.07.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:30:19 -0700 (PDT)
Message-ID: <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMCBTYWx0ZWRfX7En5odFWz3n3
 nfQN0Shne04TXGmuvd8Lgu9LXQoxR7BbAvHkV5dfxGNsVi49SrHP6t2Fx9KNhn/p8Zne1GPIisq
 HcwvYrpBe9htUE2p6z7eGSJR91sVdgASp17osjjjKP8GbGcD4C0sYuvcCwZ4dgZUtoAf7XVk7hV
 kPgqEXFerjEJlMrNrrXjLTuNVWErxZz/x8wgCTyQBmN0WpkV6/Qf7R0Pj6e3MGWFeEg3663TiXV
 VcZ2ehfCLsUtSbXtvA1K+9QhkKC7mYL7mW5Zo7PBcgVxPZ/aGHa9ttcx5s6wClfteXn6Qc86KGy
 hN3CB8X5qjNGK6I9eQ9MMBclSLOU+KvBTtO97UbWXGKbBaLZYIBpdVL51mIGKf7N82kv+4HDGnp
 hTKglweQ7Tcqa7oklw3EZHApiLvCbx65pHceiRxR3VKZSmx6dCxeUjeWvB4F0uON0dUU9veZ
X-Proofpoint-ORIG-GUID: PEw65dGAWwgzYpN9D6aN-wuOpUse8S77
X-Proofpoint-GUID: PEw65dGAWwgzYpN9D6aN-wuOpUse8S77
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687fa07e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=68B5CXoyvkL1tjfyVhIA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=843 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220120
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> A minor refactor to combine the subroutines for legacy a6xx GMUs under
> a single check. This helps to avoid an unnecessary check and return
> early from the subroutine for majority of a6xx gpus.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>  	int ret;
>  	u32 val;
>  
> -	if (!gmu->legacy)
> +	WARN_ON(!gmu->legacy);
> +
> +	/* Nothing to do if GMU does the power management */
> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)

This isn't quite a no-op, but I can't seem to find what the '1' value
would map to, even in 845 kernel sources. Do we have to worry about it?

Konrad
