Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21511B1BE42
	for <lists+freedreno@lfdr.de>; Wed,  6 Aug 2025 03:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E974410E2C7;
	Wed,  6 Aug 2025 01:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZnCqWYl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EC410E2C7
 for <freedreno@lists.freedesktop.org>; Wed,  6 Aug 2025 01:24:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IJ3tv028034
 for <freedreno@lists.freedesktop.org>; Wed, 6 Aug 2025 01:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cECZSFy3qa0bHjy4EhDWe8hr
 H3jcwRS+Y/cAXNikEvM=; b=WZnCqWYliZrXAa9l0D6gS08pZD5aOk4pHsA8w3uo
 3uTmfTchrXSBEkKnkjwWSMeKduOuZkvtqsz+1bARX/fIgrA8CWE68l8vp7eaLMIB
 27oIU6mFPGP4icayA/sIi02FU5i0aun/Bl2YU1miEv1Px4UYEfUfNhdKOSwpilNe
 wJMUDlWXY7xvzbtFKLcRyp8ZAGG4Q2FBTE9gmKxCdMebYO24kgh1L2vC5BS6V/nM
 Fr8FRFnGPk1O83SoAlmGdIDlNMSgB6UQ22G9gbniVfqhjTl9+LqohAy4JRgYu7VK
 YOIPrrKwF9uc/KAoiqECqUceMmNI7drFKQLrgu2mp7Uyuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb8xrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 06 Aug 2025 01:24:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c790dc38b4so120749685a.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 18:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754443496; x=1755048296;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cECZSFy3qa0bHjy4EhDWe8hrH3jcwRS+Y/cAXNikEvM=;
 b=cmgEglxl7l8jikRvgYTGanDedTayCIRFjcP6tHuIRDI4Dy56oh7DjH6+8V2jX3a410
 R/R/KUVodI6rDgJQgJnfq0tIcBYIhIEMg01pZwB4kGPQZBmLVrcaaSts9ummc9pFt3g/
 xOUyBWgwpX5VLkF0tfNj9UrZZCkhfvzp5IOUNisD9Q0gDb2OqmIsiuVDRqnrq1vb1l/r
 L6J4jZygaOlcQTM4oFZnE1kf97knZ65Ili6k3/pcGLkDieGy2OQuWEzM+FvizdnvNQrD
 keWtY2TME5dUGtexigdzVouV6f2m22uxpjqsGE8syP527cyiY/R9PPJENXJ4za0nsOmF
 d06w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZUeMcOY3wEjSxiwqN7MZpnebNUDs4aLvFonBEU///d83WBD/R3mWGCTKbKa6raQ+kw5Kg8Tv6Koc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDqgE0TIi6FdaCkRJy66s04kgtC5KRj04jJlq0fqogX8lDdrjZ
 04H4rltKmW+Q6sVmUtG77inTlCSRRKTiLuiiIYcvUU9l52GbOf2vvKtIx5Nh/mg1jAy/sD9uvNy
 yZCiVeonUM/D9tdL/wSkjea6l3dENZEHE4vC0dCsW6zAffDjGrmyZSFJAw3Um5lFb8v8IVLo=
X-Gm-Gg: ASbGnctY8JkreiuvxBm/9LpoF4krt2Lpgo7s2e9DooXmPbFAsQHDNDuImxmxngKcX2+
 CovuFJ8+nF+73We/m/yVmwRJtx99XjWo2XOY98IQWahkjwmH9U02VtzljrD+OWth9wfxOR7Vuv4
 9Z1ADdHbYNCQi4hcebExzDSkFJYpGoE9QoyhxAmER/p5gFuEExkO+qgxFyvc074w7Xj2BPmT9r7
 2g8yeYivpzJ/OQpXoOR+Nl/OtSA2njbnkTS+Db8FhGuim4P+j3qRlKk25rB7UeKJdVFXBfPZwqG
 bsgEBYLbIQtpFQcq/iuX5u+Hbzswk89TM7XtMhhkZnFFHQ6EH5Ns3IncoP7Il/1R9seJh44OUHY
 V9DZ4BS5xv3prlDsyQfoIzkZS4acjXm34mUGljZZh6xOCuVTU0Ifv
X-Received: by 2002:a05:620a:1a95:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7e8156eaa4amr154492185a.15.1754443496022; 
 Tue, 05 Aug 2025 18:24:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE3iln/vIeJH6XAQFmoLvafmfwZ8ex6TVrHNRQ6JVSz4HJUlvRexPyLHQYfDNi/TLCH3K+5w==
X-Received: by 2002:a05:620a:1a95:b0:7ce:ea9d:5967 with SMTP id
 af79cd13be357-7e8156eaa4amr154489885a.15.1754443495580; 
 Tue, 05 Aug 2025 18:24:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382b55d2sm21196351fa.31.2025.08.05.18.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 18:24:54 -0700 (PDT)
Date: Wed, 6 Aug 2025 04:24:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix a few comments
Message-ID: <mwfrgvslnbfxegxqhfx4ldshqqxyfgm6cwbopm5hk4srgeza4s@vohmu53ettad>
References: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwNiBTYWx0ZWRfX2xEB/+Lf4p2S
 aCx7iaJVhPhNm7snfggMmz10PL+cIPPax9g8psa7UNhNhxTKgt7loU7hSXG1+mJrlucpemk1BIJ
 S0wSbLHXOebZKzC/tjjfyy0njhE0TiCnzdg388LtMr1C0B/5w0NBDc/6qt1antXYCxctHDmvAZF
 ytrGrkccTKK1g3nnG7D8cTelsz6bTr9WiLRhzVk8KMYS1Vz9VQqlD323KH5iBe2tm+uuTDUIA5w
 1yOAt6SDtEBCKtcUhO8T4/UojGLYyMpeirazNX8J5S7Zs5gMa83WDcWuapfN1a8lpisFTxDYfdC
 FJ/ryO/UOvmdlhyvOcVLJw+soAwjzVoZ8r1/t+pRyXbsW+IMd+uge86QBEzhau9W+kGGURvJs86
 EQl/H6stnqNVcmn2RpDBj5yzPuBzNUTSvUGmPZOK7jAxRe8SZn1NpWJ7iE3+CaNOw7hpAPGE
X-Proofpoint-GUID: vfuWEpzOEQuh6jmfA7biQpSHGa2uaPft
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6892aee8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=GOsSNTHw1BKba07vPD4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vfuWEpzOEQuh6jmfA7biQpSHGa2uaPft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 mlxlogscore=874
 priorityscore=1501 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060006
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

On Tue, Aug 05, 2025 at 09:43:08AM -0700, Rob Clark wrote:
> Fix a couple comments which had become (partially) obsolete or incorrect
> with the gpuvm conversion.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.h     | 2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c | 5 +----
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
