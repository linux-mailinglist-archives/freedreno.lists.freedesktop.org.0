Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60548B0B7C6
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 20:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16AF10E0B5;
	Sun, 20 Jul 2025 18:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDJ2UluZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969A010E11D
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 18:46:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KINehD002977
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 18:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqD9lpozTVEoNik4tz86rDe0
 5zofNC5gW8zKCBwUz6I=; b=eDJ2UluZYmn48okM5vCKIkoHwvuc49tTs43Pfp1w
 hUul0WGhBHMWlK+XbjBiLBiN2SMUMZMocmM6AiRYLK6MUNUlA0dTgbozL2mJs7Vi
 EoIoi1qDTBrv7Cq1xMXMk5e0IDWFtAdsOcfMzKeaHYSGsaD8tep7XnBcrnq+rI1v
 RTYgl2fcbuxzT6DCW31A9KHSqEheETzjbUqBEfTXbnu3XLGMu0c3+XtA1SDWK7Za
 dH6ktLvfQZFXYvCQHhLFFKZMHOsaycEDqA4wwg9n4aSKzuZESuZ1ORpVtscHfRPi
 cI5LYryNh4xfmINPfTdQAqt8UZmjTZE+QFXKRkCxn/CJmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tajw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 18:46:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e269587d8eso662477785a.3
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753037201; x=1753642001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqD9lpozTVEoNik4tz86rDe05zofNC5gW8zKCBwUz6I=;
 b=cJOujk2vLPCULWklv6VjvLy99yaZboPDx+zAC2Wax9i0WiJX0o8BhMtdTh2U0DAjyD
 UA51yAZEsR4tpTMoJg7meDS1IGin+bFq/cgi9yLTh3pbCcZuBjb81rS3OZaSiNBBgd4a
 Z/yLTTvgeD+I/XVxaF825k967JCDXSDdnkTo8qkWWFjOrAS5qYm8rpDak+uVXB6rLolo
 eR99ha4tgbCkDX40hN+6NIeUg25ykEku3HIow5i8oyYmhpIPZNOQXbEVtliCQIquNkLP
 /+guEQlnlpsKrm1g9K6x8oloqTNJ3Cfu5cfhJPFgvEXxar1lGdHMDeu9fDo5FiSzE/mC
 iXZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWoTs9eX87EsQ0JAhC33NFXQpvaZfuEqtYY1w6c56/nt1GDc6nYngPlRcmQGsc+NPK0Emu5jfAKek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrzsjNHKUAjyARs1vtNbZlesrNHOWxAoHRmR3q4Ts2eREaqvAZ
 +VGepMFqxoZPP+RXhErmrksb6BW+6Pw4+SJgmDcEqWl54Jz9DfeEkL0xcRqNjdM8B/vHiavH3Nf
 YctrKGjE+hrqRT0RVa4ZU8AbGEF0XsYRaLwd9aTPfxetwLJMSy4lZUaQ5b7wQQmvSS5QYBqs=
X-Gm-Gg: ASbGnct5rMs6YaHKoCDT88vBvK3BrSgDxY6RPg/DRg9Oy4BgX8923+vBkwM54j4piKU
 T75QNXvas6sxyJGYhR04mUufLfQGF8G2DKsdOXWMc6skmofYzLBhloqGnwYqn3ndpgirlDBNklB
 Q79ixBBwwLqHWsCzyAIU21CuTvaD+GVRpN9s29z875sa0N9MT6OuUOhLZp59Oj5Z7JtEJWpWldP
 tv0CJgJ23Iaqv1ed7pJaxv8cZbJIeDuhuSLjv2FiWoxLVYQrxO85g6k7KgTdLmtYrHnioX5eAvT
 LsDb8iWCca0MHVcznbbrnwdBg4fXI8ZxmLGMGRvIiVxA3FIEyjAO/f8+O4gCdppJgx8L86kAAon
 jIu+uNC/734dKBrpZbLLMUILE1Be+Lz6PA8l5YtQ6HzYNFhuZULEy
X-Received: by 2002:a05:620a:55ba:b0:7d5:f350:e533 with SMTP id
 af79cd13be357-7e34d9ac1a4mr1437152585a.29.1753037200591; 
 Sun, 20 Jul 2025 11:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7R3w+LrCtL6Ou3WXRvuqFrSDZrluf4DC7QzbddwvwqrYR7HJsloDPSpllSxyamfEHt540MA==
X-Received: by 2002:a05:620a:55ba:b0:7d5:f350:e533 with SMTP id
 af79cd13be357-7e34d9ac1a4mr1437150185a.29.1753037200070; 
 Sun, 20 Jul 2025 11:46:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b87asm1229044e87.11.2025.07.20.11.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 11:46:39 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:46:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Message-ID: <z3ob2cbxuerf2djwm7xzmujr2xwmwq3agpxrhnyds2ciztl52h@nqqljjocqmis>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE4MCBTYWx0ZWRfX0sqX37zJ0Fo8
 qaPcTusMcrOolL0WKfkcrhdxxWrIgsOHTGEvQqZM0f5d2d/9I7uHJVuHe3A6IANts+hxyuKp59G
 EFwEs0DTH8l0KcLQpvrDVay6VgnxppAphcLv6OuORohWuRsPwNUGMHy2spVtvb+WdYG0cMjZdgS
 0dI2fbi4mpZS8o03OgyH7rWaCWclQbxC7TleStpaXTh6NPlirGqFPmKDFmXQaJjLezPRA4UmY3I
 FsSa7JlviqB/59wfF1ICmvWtavwgZKESXKNEil/9SvDb3sGzIpJrqyWYOVKVi5uSF4WVV27Io9Z
 CoPPxDaFzVzL0gUgaHfHKYZfSSi1f6I/u9LT8tPpP+9RCxO+a0SufDhA+twKCYYML8QdLlRd7MT
 Jyxi6P0ofIj7h9bPmE29Df9EhEpebIR9WYUHXDMjAqYio2j3QOzLjbBP0tVL5/pCsVrsKadN
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687d3991 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OsTS_Kn-1Yu-Ke3AYpAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Ptq9pnNdsgusGRTyRV7qQo5zATOVeZQK
X-Proofpoint-ORIG-GUID: Ptq9pnNdsgusGRTyRV7qQo5zATOVeZQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=710 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200180
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

On Sun, Jul 20, 2025 at 05:46:04PM +0530, Akhil P Oommen wrote:
> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> different in A7XX family. Check the correct bits to see if GX is
> collapsed on A7XX series.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Missing Fixes tag

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

-- 
With best wishes
Dmitry
