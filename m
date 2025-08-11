Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1012B20595
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB17010E436;
	Mon, 11 Aug 2025 10:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iabp8jC3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D1110E41A
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:35 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dE6P013175
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=3nfN60jdUBtaQs39UNaxVpig
 z5/FB/TFepwaJ8bZmqU=; b=Iabp8jC37l+5c1heoHBD+T5SrH7/okVsULQROKRB
 4CBkj/JSZHMqZ54QQXeKxOrXHgbXoGBTBdDjtNoQM1iopYSgO5Kg3/rUdb+GyHoJ
 Zy/PeLma5V2wHjNIQwvYYaeu8RQnFBuFf9xDlPa55UVmVazVug9oUJpEx+QIGIcp
 FFI6oYnM0VaYO4I/vbi7rCii9D7n041roc5P361r663yV1C3YHwoC199KRuO1KIu
 VK5l9p3LnDvx+xpZlohvUh7wp/b516RQBrqA/poieFDWyyf3mqE/RLRLR8yOeion
 gnrszwMY/4JnQCl6Ni4juj+H7xV8NGGqda2WU1e260uNOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm5pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:35:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4af199d0facso134449161cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754908533; x=1755513333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3nfN60jdUBtaQs39UNaxVpigz5/FB/TFepwaJ8bZmqU=;
 b=K1vL+Ce1PtFLF27rz2MDe0VMXaQt7N1EPBg1ccGZJzpQNdiHLDVj6iIPNR3//Pda/V
 MY9Uql2CHXo/h1I6rVyABudZbdPL3WvRyV86HM3YTdCgzuPrG2BkfwOoGL14np/Nwq9h
 dE3NWmns8IFydA90huGInCcTCgnwWoB5H7aT1QI6XMpwjdtLVqQwKd0wRpWgEOih0egM
 f7A8H+Ljc70Obr1sXxBvPepvOHDr72bTBRfMEDNjczh4RBdO56TKkgRnJ7IgOseQSHpt
 3rIRaJqoYJYyLmO6DB2Ro/ynBGPUHYyndT8LQCZHZcviSmqJgOelhI3/eMhSYI8hBFAd
 mU/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYvzISEKye5a2hlzwt2Ep65z7KJUAqGAh312md2K5SWR1rdmnx+Hs2pZEaJTWycIMults9Cyq1HN8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9z3NXD+gp7bUpaxLfc395DX3MHpMzdUpUYoRUp2pIf2zas56P
 jPgixWQqTTJycUX1yvy1Qi4s2OY7ZGnZ/y+mWZ5z6815KO8rJcsPYnVytS4pZQ2zymXZcrIkEgm
 57oWzQa51RvAlYvEg7Q3jU5TsC6pEjjGrpE1PCLtQdqIfl2OGeSmhoDF74vM/qbt/L+dwrTE=
X-Gm-Gg: ASbGncto1mFoUDwhw+KzZ1ZX/pyy94h4wAISrqQdZS8a8JhBazPY4CnBhqnotqX8WG3
 w24YnSodAh8W0lQgM/iF/LNudsMaU7/YEF/UiUSW4u2S/ZNC34KH1o2ILvA7cFpVJ6tSe2DjhwE
 hrMp/Kr/7WXgiC28uB/f52yMZ9VAG9yPw8cpgrOs4uumgWcIgHU6Upn1ck95flik0fP9u9rRmgg
 kTDn82GxBP4eJoPaC8oNlrQ7hoOeWOZqHj5RX7jVxivyeKRjTZ2J3vywokOFNc/9zbNwgfWcmSG
 yZ6dcsZTsxpigDfjg38y8oIIgXIpiXGjsbK67tpt0py8/9TRZ9Dx5cKTHWhEX1DJSAeGsu8EmRh
 70MJjh9BJ4pDgLqDh38InQp2afxaUuuvCipx9gEv0MiukBdP4vh0f
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id
 d75a77b69052e-4b0a0718816mr236623651cf.10.1754908533241; 
 Mon, 11 Aug 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEyahsxVGaRdWMce+qoZBor8nKFhSp+X072mklH4pqlqFsX+5NaNxsNkaIEI2fGWy6wHtVUA==
X-Received: by 2002:a05:622a:13c7:b0:4ab:3963:c650 with SMTP id
 d75a77b69052e-4b0a0718816mr236623311cf.10.1754908532801; 
 Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55c9c847db8sm2272681e87.84.2025.08.11.03.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:35:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Message-ID: <pem6b4hf5gzo7jbo46asminbqqrnkhcx3nwsvstv76ntmeasfr@sgckrdc5s6og>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c776 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: lgxCGu4rQiUF-Z8KjJ83foVRaFfgg99K
X-Proofpoint-ORIG-GUID: lgxCGu4rQiUF-Z8KjJ83foVRaFfgg99K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX+qfCzCgHRrgw
 KNpNc2wFX82EfDTc6dd3LU9spZz4c8SgbzLmDKmjL35PjyTxZlA2X9tbVS7N4rNPxedeaEb9uIk
 VrqF9f0kGY225+n0xTs2xdpiIBLyMPDqw4b9237GK2SIBWRY65aOP/iI6IN22UpZIvk8YAjXVZS
 fh1OZDDcsXjFaDlDmZxalu61BSYFTf/evNgJ9W++DsL6Rlogd4qryAym2NBWJnISUK5PeBs8ZHe
 +OkYSa+M2X//gCVe4TvLDoVyPANoin7hKf+qAbDXcSSVSh8ZadWWzucnsEfkh692wFrEZxgOV/w
 KOOE0jzrAC//SkJgDyYCAk75tGI88yvnNrQgGxcXh4ccZWi/QokeukPmd7cZ2fOILPLiUR4KeYX
 vT9wk7A4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

On Sun, Aug 10, 2025 at 06:57:29PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
