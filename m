Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFCAD0FA6
	for <lists+freedreno@lfdr.de>; Sat,  7 Jun 2025 22:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DD910E40A;
	Sat,  7 Jun 2025 20:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiLmEOCm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C5710E42F
 for <freedreno@lists.freedesktop.org>; Sat,  7 Jun 2025 20:11:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557Ja2iq005224
 for <freedreno@lists.freedesktop.org>; Sat, 7 Jun 2025 20:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XYyaI0FB+UTRojumzU3j18br
 P22Fad9SfaLy766ifSo=; b=aiLmEOCmVGDPKjvXK+/1dU5cgp8O05uABTCqjmCr
 iN3xVVrMQXKDweoHyj+5MJWQZb0fXhfvHhQR1zUg+o5zBI8N2e7ux48AtKrsXMjx
 FVnPNjXMLdnfM2v3el/IjTA3i+kqMwZU6XqSX7dgfeYkl/psWg9lC+AI3IVrKTM6
 94U6E2K5dNjf5UaZ6OhyuzwFUZh39puxtImAFyEfrDtNF81kuACTe/s3wNtRG+ZK
 ru1VF6EvfEe+rNkEPueODeM5s/vOoH+NjlXT69DJF9rSpIG6RiF3XIG4uFM+SQZP
 0XlMO34Q1DYqpdg96aIx+pMDEOF38/a2BSw8Ddh46Ca1CQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9h331-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 20:11:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7caee990721so769801585a.1
 for <freedreno@lists.freedesktop.org>; Sat, 07 Jun 2025 13:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749327089; x=1749931889;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYyaI0FB+UTRojumzU3j18brP22Fad9SfaLy766ifSo=;
 b=IVGSeoyLB5cjoLkmsCflx0I903s0BKTgYZC6Aq+dI1abDbxzUvDEPEe3IQt0J/eHR9
 CPFGGlcziFfGhFIfJUxwzAu9m3atTNfmguvyV+T9ZDop0lf7gTCz3YndZdPGcXjVWCIY
 CgW67uHHQOwVeDCi0FDeQpIVgjt5aHjhoFm+w7I84skwcu80EN7xxd+SlqLwLHo5Ap/L
 dqJ5v/866kg49DXqbgbz+RwzLOGXlUVvxNwp04sInofwDp+djpuhsM52h6lyYKMY7dsA
 fYDX5qhLgLLQ42fQ0uk+u9R/aqLnenOuL30OqnbUWyjQ8Ld+PeojCYBPQCOrJ1Cdn4Bd
 TomA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdHhDYXqRVhOePO8uLcmbemGO3uiCib8hHAIJjI4PwUEWkzt9xXEvpqNvjcxwPsV5mvzvyHIqc0bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhJJvmReCsGrUbnuO/jN6SP/5cn5RQdTiclKX19gszwckHiRNV
 G1yLqQSVNIN7O3mVtnhqjVdOzyp4CkZ9jjdNdSGJsEYzYekf8tn82n3rC6f6LNe+gWzIcdOcj9R
 mq8ahWf7vGt+lV4prdu7Dv49Pr0zv05JyfHUaTZvVLshvaqC8cfzjhaE/dQO3jzHKmX0sugk=
X-Gm-Gg: ASbGnctIa7EvRtBHHZ7UqelkHwHBMrUK0zzfiqOsIzhebaPya0X0oam7Vi8dFbJgGgP
 FmYKZDp8c1ELnovIM0xlrTEmV//lT3wOQ0fxFMODJtbPf//2xh2vWxk6j5triHLXkulj4/y8x/f
 xh7BZDqgidHndNiLiRAB/mwTwBgcTyk9rk432eRw7FVB2T9R6eNP6zkvtMQD1Km85TM8V65Ylc/
 zNpLr9C+IwOW2vWQhd3dMmwCs55LXPMj4nA4l85Hr4bwxP6UurSp6QQ24HeDwtKqMggTnwXAve7
 xtXKE1o5Tg0qG1JjtUF/sYBCHbpJXsxuqaQHa5t0ioqhlMoJvR4B/34AdcRsKIgPZd0x5AcbHTI
 =
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id
 af79cd13be357-7d229896449mr1172215785a.31.1749327089216; 
 Sat, 07 Jun 2025 13:11:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa4olC6W9osviXHPQUeq/X1/7+Ru45fu+N79/NuD7ijwXEkSq5aoqXEsc9qfndAHioC3BiSg==
X-Received: by 2002:a05:620a:199d:b0:7d2:1684:2429 with SMTP id
 af79cd13be357-7d229896449mr1172211185a.31.1749327088811; 
 Sat, 07 Jun 2025 13:11:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1ccdd53sm5543701fa.88.2025.06.07.13.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 13:11:27 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
Message-ID: <hpnrky4frqjr2a4rdinbsizm3mwdognx2qmx76u7k6g5ocgeab@4vtgu5qqsquv>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
X-Proofpoint-GUID: Ge6rCRgcn4mjA4f2JqebP-llA2w0r46O
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68449cf2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ei04IxUCSHfnpyqhzYsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Ge6rCRgcn4mjA4f2JqebP-llA2w0r46O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NyBTYWx0ZWRfX5qg+doA3VxFg
 +pkRRQGoWcCMrT7RpTNac41YtgGVeaklPTVhqoOKkUBWAtxDLSsblACAzak7gchBJSaVgt5tNrn
 XMJlJ0UrK9aNnBBJUtqgUn548xqrtjq1xzRfRoQszPfS+1sOkcCPQ4H/eXGRYw8xTvuoENVOl+h
 miHNcyODwWZN3VEkOsjZjRfHfMRSRwz/T9Ln3cgrmHAWlBd8qPSAt2vPw6kvlaDIJ07DZcQZTk9
 2ckRj8E4uDelHaoJJTUWw7c0+ncWhtvlgAeIVYyy8kByFwKJJLCBei5TQDbh/owK1dHBcHsx2Gn
 qQ57znhdmh3bOg3fqhuc18xom1rSFgRTuBHEDEudBIoUWjKRXTqVDaHUoVGFrY27feKW0RY0gcz
 ocAGYElHHSr0semyHHw0tsCvStVKe1+6DPSUdsPs5OG8IigUlBxzTsmyTtNMGjvr57aJ/G6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=810 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070147
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

On Sat, Jun 07, 2025 at 07:44:59PM +0530, Akhil P Oommen wrote:
> In order to enable GPU support in Snapdragon X1P42100
> (8 CPU core version), enable X1P42100 GPUCC driver as a module.

... it is used on Asus Zenbook A14 and other similar laptops.

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
>  CONFIG_CLK_X1E80100_DISPCC=m
>  CONFIG_CLK_X1E80100_GCC=y
>  CONFIG_CLK_X1E80100_GPUCC=m
> +CONFIG_CLK_X1P42100_GPUCC=m
>  CONFIG_CLK_X1E80100_TCSRCC=y
>  CONFIG_CLK_QCM2290_GPUCC=m
>  CONFIG_QCOM_A53PLL=y
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
