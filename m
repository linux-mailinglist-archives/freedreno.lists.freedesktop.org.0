Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E21CDC3E1
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 13:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44BE10F0D3;
	Wed, 24 Dec 2025 12:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMGz0Cz6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IUh2UPa/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901B110F0D1
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 12:43:50 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BOAR4XB1597720
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 12:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wDwdQ7S4bZBvA651QN2phLv3
 tQqdzNozh71wvSt5LDw=; b=QMGz0Cz6JOm+nL+VTgNcxjNkr/tzDJocEGNwH8Lq
 ZL3j2mqe1CliYVMC73RNNsqe0jjJBhTNUs+aF3E5O8qzfj8dr33qA+8CbFDW9Wg4
 /9bvq3f5uIQ9Oq+3uURUDghRxWE6Uttk7ZMpQrNI+n5NXFJeQ4mzbI7MosBhYqi7
 Akmcx6hWbGfzi2wd9ncJljEL51CXpsVAEnH717UWzvqOD0KUwYS4L1SAxxshxsUL
 +gG2KOgTfJvRo5LUxIr7ikor4BO/cqCNVeKrA2Eg5qERwWH683OD7U/N19UutY6u
 FD+vYJMp3loZS2VVp/MKwhBavCaacymHgy4jZqPnobUJRQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683hkjy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 12:43:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a316ddbacso146114606d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766580229; x=1767185029;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wDwdQ7S4bZBvA651QN2phLv3tQqdzNozh71wvSt5LDw=;
 b=IUh2UPa/itez824JamXxM8A9keh9r3UVpYeQavyIlKqouxgrYMxDkeOW44EPLMwAqw
 HIq9k0UJBnFbcvoPlYnuxRNoQv++YpEx5SMgb3h1YCR6Jc71XqOzKDrbEWSAYvORj/Na
 gnbypSPnLd8w92EtBykuf737E1YWVZgB7w3OcAPRiCDFdNaNa8fTbBpgy32XAz5oW8Kc
 4sVCoVSE9Awstg7MSU4P/8qdd/8pYVnJlQ8TQKGRnu0ZB0gROa8136FBldL1QtcQ52kl
 /FsqEXs14qckTfe9wrRyf1/Hz3JCWJouDBmKxxG9iAEPucQmFK6L/OZsT9WqwFnDa3F7
 X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766580229; x=1767185029;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDwdQ7S4bZBvA651QN2phLv3tQqdzNozh71wvSt5LDw=;
 b=U/FxyxG0CVNKZk0r1MVhzNJFvuOOMvdocKHJz8h4YMnDQP5B/n31ptTBTjrIM+EeRc
 gtLJWJBUZzQzbalZF6TExpMgAyzQsCeRIlGCLtQ17Bvo2DYvZYXr2b4cdcv8vVv/vZtG
 Day/0lh6+KPyIxhQGQnwZkn6TDbEhWDA6I6qYoBoJUUyqjP0QHMXj5Zef8yn5YT9/sTw
 qy7+oDJtbxlFWkNdFfleWt/TVAM4LeP0PEvq1X9vh7iEo/lViTeHGJeUEoxfZzRCDfx8
 /63KwwHctbkScHnl+x+R5gZNGjrurAqvIfpBsVz6u9/igurA2lKXFFWsHZjL3Gn7HOs1
 wv2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVJfr4YzKoIpqbmcnokAwaps1FmIJcwWUBFWOg0IuhNnhO6NANf1QpTk+Yv7z/TNxOJAGa56aatwM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrDcyy6Mo0/4L3IhJ83iFntIWA9ouOJZCPx4LRkPiVp97Gdo0h
 7NA/l/82pSFnk+Va0bHl08pyP4Mm4NxQTg7wTfIz3zrZij9ttRzpHkjyYHzpBZMufWRI+AGUpfw
 DKAqO/azKuXrDGN5+zOtiWuF8yIPClXrEVuU+ojAvC+Lz0vVweAzENv4EtFVQagHyn4SM/Lo=
X-Gm-Gg: AY/fxX4StRzP5FsgfGzKdYbeNTMNOJ2QPHO9DoRVAAHTsNKxt2CZtJPivGiUczH43iD
 0mknD6je9EHB2Hk3BD5hpky+dos8FAwMagpS+n7Z/VUN0Y2XNsDEBqj0lb2x2iwLBNYqNaiEucB
 jVUwgnZWqVkXDEmy10N8tn77tC05SWwxsLPs+fe4Nq749uydLw6+jMBfd3jLFADbwTrvJRfdsIu
 w0JAuaUit9Hqlj5qX0GOXsoV22DsLB3Cy/uG1uvMVrxi//0YYu0BNfFUXQ6pUmGcIFEmBzrLWIC
 tUz4xSwUszYm7vQlifnJ3Zdwgbe+8LRv5Xzgh75R09YR79fyfbrsKUH98df7xd5+vHasKEQlMBG
 hNCfaBMaurLDNHJ37iFhnL1AqWqDohh2hq4+kaZTlk638RdkbU3x2DAVDe9JE8yHpBhkBnHZ4kf
 wkZy+1QRnIpUypeIs790PZ/II=
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id
 6a1803df08f44-88fcaa1aecbmr165164476d6.32.1766580229065; 
 Wed, 24 Dec 2025 04:43:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwaHpkqJ6p3wAcw8mqZa/VlOK2UE/SpJyrp+pSGs6Naw4FiZqH18vUS5KCoqIeO8ajlkopqQ==
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id
 6a1803df08f44-88fcaa1aecbmr165164136d6.32.1766580228633; 
 Wed, 24 Dec 2025 04:43:48 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4962182e87.93.2025.12.24.04.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 04:43:47 -0800 (PST)
Date: Wed, 24 Dec 2025 14:43:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Teguh Sobirin <teguh@sobir.in>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <oqiukznu3hkci3jslug4bwawkobqmcxl7v7dqrh5i6r3rirm7d@543kbgervkp6>
References: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <52avqc3n4fxuypv6fkejuxkmuounxa67e5lsnfeynek6yxq6tm@ink6yoklpxes>
 <aUu4RyJyZROn-FzQ@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUu4RyJyZROn-FzQ@SoMainline.org>
X-Proofpoint-GUID: nvTpupgbe_ODoeb169eVEgkCF7BmKr5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX2PZAp1GvVKmG
 RzjDKigCVa+/c0sYHnsBKFsuk5IInPd3s26oP1HHszh7KrmZ2cC0D/bO2K63nAwbtfahDCaB7MR
 W3NICFFnpUx9P4HUQeI24qMPOybSo38ZXjvm/eNSdzHZIf2UJ715LTC66LXeis1sQZhAEHQ3xzy
 YAKcWqy0PvFEBIxeJyeTUETbLQLzFYmOlPAB5+rivs5Gjwan5UnROfw205lnmBhf3RoCRfXiAng
 dlHRLnxSwgvD5Mjr5STDjLLYVAPCdvd6qWHRJMLz0d5SaNmRJ1w/7leJ8zabmYrRKtnC+ZtfNG3
 pyN5ZkXKcnHSmpHiLGJu/y0N7GpyYlwLu4Mm+EIK7pT32UoS+lgvbb9j2uycbkubRhqGWSFZxHJ
 2vhKJxecP0a1TnTWmv3UQSKHAanVTJiBDJRH0l2tpviViF00FSyknGzXcgHQpfQ5acR9Etwco8f
 xlgYM5YB0FqUlQ7/ChA==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694be006 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=9AdMxfjQAAAA:20 a=4g7Ab6pXP5EehEtGTCUA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: nvTpupgbe_ODoeb169eVEgkCF7BmKr5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
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

On Wed, Dec 24, 2025 at 11:00:23AM +0100, Marijn Suijten wrote:
> On 2025-11-21 14:16:55, Dmitry Baryshkov wrote:
> > On Fri, Nov 21, 2025 at 02:02:08PM +0800, Teguh Sobirin wrote:
> > > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > > INTF blocks.  Currently all code to setup vsync_source is only exectued
> > > if MDP TOP implements the setup_vsync_source() callback. However on
> > > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > > vsync setup. Move the INTF part out of this condition, letting DPU
> > > driver to setup TE vsync selection on all new DPU devices.
> > > 
> > > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > > ---
> > > Changes in v2:
> > > - Corrected commit message suggested by Dmitry Baryshkov.
> > > - Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
> > >  1 file changed, 9 insertions(+), 13 deletions(-)
> > 
> > Fixes: e955a3f0d86e ("drm/msm/dpu: Implement tearcheck support on INTF block")
> 
> Back at that commit, setup_vsync_source was still always assigned:
> 
> https://github.com/torvalds/linux/blob/e955a3f0d86e4a789364af62495ac37546eb71c8/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c#L260-L263
> 
> While that was technically a wrong assumption by me - I should've put this loop
> outside the hw_mdptop check in case that ever happened, it got unassigned in
> commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP
> on >= SM8450").

Fair enough,

Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")

> 
> Note that this patch is a severe regression on DPU <5 and doesn't set up the WD
> timer on DPU [5, 8), but I'll comment in-line on the diff.
> 
> - Marijn

-- 
With best wishes
Dmitry
