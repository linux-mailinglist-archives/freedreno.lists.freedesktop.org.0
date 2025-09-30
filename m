Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097A4BABE49
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8E510E514;
	Tue, 30 Sep 2025 07:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbPXCIfs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B45310E514
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:49:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HhJx027554
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=tcDYvvx/kWESRIwdIUfePzUj
 wXfd5DkiWsQQ0UqQcPs=; b=mbPXCIfsnKiNtisq0erGetEyK+l37muV+7YinheB
 bYj644FZBNuf1NgkhSgSbqRlm+TYG5UJuTdvExajM+vrUhtwvopVf/wSpTJ/WkqC
 hu2tYYX0OahWkjx/XHHgJ165uF0Hdl0hZ0NmfphU42nznbmNIJHNgJcE+NtGueab
 od5nvAuCN+cVzlntj3IJiIy7FHLagNgVuDVgefB2uDbvVHjVWmKsT3TunRetSyK/
 SXZxXbuQKgsXBy8egQfp4FHYNPv0FfnA5OKfkxqjjmN2DiFC/r0Lp+ZgdSNra7UX
 qUjV2tDvYdey7K8eKSeHm1dSYSwas7M8x+dBmnqjSl5Xfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851g1gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:49:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4d905ce4749so110871501cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759218589; x=1759823389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcDYvvx/kWESRIwdIUfePzUjwXfd5DkiWsQQ0UqQcPs=;
 b=v8uzMupWUmsyjApLGcwv9w0Z8vadschKSFYhZoTXODWIXELJp4Hku6eZBmtO1rylE8
 iqVlnScYxcWt3YgvTTkmXQCZjnw0r3Dsmp1dRZ1ltA0gmvh+2J1XulFXq3i3c/hfxMRV
 OqUZFVeqYNMiVoWwYlqwtAiDBN+BvxHYo3daEMNIxkMi12mYu2rU1Wy5NxX6O0L9IX4s
 O/SEylAC5araSTvxgJxZpUMv5aWpmEMuRv703cp8AT5qt6DKfXazVj8nyxAajrFAr8Hv
 DHDXJoVCuFlPEXoJWPIX5q5Z1XmkLcUeMjxYTE0bkULey7CbepDpXlyClWsQqdfTOD8C
 pHUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+96o9bGSxh0aEXj6xMegBVkIRDqG2aNcXpR35LMm9UxPiBeIyctklUxj2fo1NBhIH/iNMw4JQfDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnnVGAyRIdyDkTP9BebOFA7yEa5FQwk5wteeUk6aJq0AuO6Ubf
 GezrsxZBuUBQS7lzPlP+LIGlxFmP62Kpk1W2xMIO9hg+CKcIlHR6OuRGs7BlZJqN/oH051LhxrC
 KYRUDN5bhHDPI43mqpf4L7KEgrcYAGJcmOiKGWHR6+UvuCF8gxq/WK86OnBMsgApxGXd2d5U=
X-Gm-Gg: ASbGnctmUY4gD1sjAMRmXxkaWPj6eX8SsNRdCgnJN+vGFxLfpx+/V9Ka8opa9XRL7Of
 3HGVkiEEcaoGOkDo2sYVsVof1/n6dPlTX1l/YnIYd9b60Y4OyMjXzrJvJ9cSn7uf8WssUzYEQvD
 LM1IcFofjy+hqHCHlHzNWWxLW8x4K6W20q82zdrx6ihKoplHshDxFhszco4P665ASZcnFzNPSHm
 cWJ7kkwV6zYdGemvCko4tiK6jLGdApCu9gkutWRi6+dTo/4d/9xyQM7z3L3yMSF4cKsesG1jsCm
 TzAuKV8KqxEmw2L0MLAKpFJglh7XoIKA4aKkE2P9zxspiwmcgOsepAIXdMG6nDNB101wB7GZvHo
 jtQDuIjE/5EIS4HjdiScuaG61vZEdCPqMIMt9c8sBYeTKEgWcd3CFX8MwvQ==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id
 d75a77b69052e-4e325d772ffmr15078581cf.80.1759218589252; 
 Tue, 30 Sep 2025 00:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1NOqQxAPdQp+Dh3rh+AoIDtXwXlBUdceAQk5B9YJWaQLrY/hOzC1FHHQS6Zz8p9Hkpk4YgQ==
X-Received: by 2002:a05:622a:17c3:b0:4e3:25d7:57d4 with SMTP id
 d75a77b69052e-4e325d772ffmr15078221cf.80.1759218588705; 
 Tue, 30 Sep 2025 00:49:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58567242ef3sm2908507e87.19.2025.09.30.00.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:49:47 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:49:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 15/17] drm/msm/adreno: Do CX GBIF config before GMU start
Message-ID: <ae2ooybajk6mcjggeztumubht6auw5qlhmsdrblikc5ruoxtmm@oj5kvpxithva>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-15-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db8b9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=219S4Ll1wpRkBpzXM0IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX1KNM0AsCD6ZW
 phaGZS72LsoYIRTnEtPuGeHrV4ZspJsh/CYJlFWMi3IPHbXeXDNgL0ZmPEIdXFX8TWYj/hgIsY1
 HLxWooQ+04uUMK7sNYqZ1EpjO99R41TSvj2VrMfOig3iCOW9ZN1EilaV8jaDHqCk2aUwQ47zQMN
 0Qpzjbh5fIgTPJ1FiogrXnSGgR/Y1LbwKaeBlQySL6K7n+u39JCnQ9sxE/UYA0AHZdNhsS4I5Hz
 uCbM0Uj5D4yYnq8V68irjAYDQ3XEkmshTYdhx4D27fesYy/uG2abuU8QX+JdRrGQp47giEnZrPi
 O/yddBMdYWzvQ//DYXE2h9CzCEw9kNoJNfCpWIMa4S5a9zMsG88tEBlbamUZ2ks0SrzpI2rYu4o
 JKMHFb7TI+X9dKXAsu5PRVuN3cFQFg==
X-Proofpoint-ORIG-GUID: 4RDs9dUuWyvl-8seddDOb1fe246Xnhk6
X-Proofpoint-GUID: 4RDs9dUuWyvl-8seddDOb1fe246Xnhk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Tue, Sep 30, 2025 at 11:18:20AM +0530, Akhil P Oommen wrote:
> GMU lies on the CX domain and accesses CX GBIF. So do CX GBIF
> configurations before GMU wakes up. Also, move these registers to
> the catalog.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Fixes tag?

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 12 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 17 ++++++++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 10 +++-------
>  5 files changed, 49 insertions(+), 14 deletions(-)
> 

-- 
With best wishes
Dmitry
