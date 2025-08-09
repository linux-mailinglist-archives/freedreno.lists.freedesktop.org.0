Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F5B1F2D6
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 09:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B7A10E214;
	Sat,  9 Aug 2025 07:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZkUez9eV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE8410E214
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 07:26:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UQFg009318
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 07:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Fn5zSngvFk1cTroUj6eTtc01
 4LhJeakMsMKQPeY16BU=; b=ZkUez9eVPvdmJ8FupuRJ+mGBOBtBUGEamj8LZJIi
 /IoKhbx1M5RyWZbUYDUP6th5sHtllSZun5kSDEzXZkXuT/vqzcLh1HaJ4GAvhaNM
 NQV8PqwxyupYFLoqhQUJXc1xCWBQV6dSqWR8rygQm5Wkk6Mi1JMRW3T0NfnShVwn
 ufLwptxyAj+7pLKtahzzcRL3ql181u3XUV1I3y4sx3Jwb4fGWjrrXcEO4MnaZ7LB
 z4WzKhy18qdEQ6MUhzPyLXM6QNMdOi4DAdW4K7RjgY7Zp4NNNRb2MUfKRcYvadL3
 eAcT0FefR5Xu2W0jsCEkaJDrfAxcQ4Rod9Xmkctm4Kd9AA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmgfdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 07:26:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70732006280so55506096d6.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754724370; x=1755329170;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fn5zSngvFk1cTroUj6eTtc014LhJeakMsMKQPeY16BU=;
 b=TCi4K5AbKWoCgQMD6sIlOUPoOfA2nYV6PXyZYILCNG33wtGFtGlGHfwQjZIb6S8+4/
 ag1TLsEas2gCjHW4coUBPM+ImZ8AUrqFfEqfcCg+Co/jIOJWTtAN2wjDBSUutKI1G/Y1
 xo2Tk1nEDVUr72sOrXIm+pM2b+zeOfwbBzTDx/+6QtOS3oCGOIKmyr/6AJ1fHzqppHed
 iNnZMooCaJjyYrrGWVRPg5QoQlj10gQSOvbZuZFHowmuLurqU1sBQ68KTDhY5nLp7mmC
 91W0duoH4LViJKUWdngXBfA4VVs7e0+DoH92cs+V0fW2xresgtCiUrMtYZBsEB4Vpyq5
 7uFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnGmwFyBKcuhx15CPeotvzSgo9+817eklSm01Wxw3MQbv16BTLJHyFLB2n4qVPo6Kvd9YMrMb3ja4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzulDstSpwKucE/uj7e8tXkfld9sML1sIXu4TIlDQqUFxJ03hFK
 f0eZKEddutLSo0wcZoWbKCjK7t4G3xZMv3RPQ3YOwpngWw4dzR47z1TizihbpvB0B0n/QI9yXiy
 DPnJ9PX8BR1Z7PHa5t3iy1zAJheBjqedkPIJ5uscVYA8ORdYRNhYCFJjk1GwoHANcgLE2Hy4=
X-Gm-Gg: ASbGncurSTehKySZKOOOMJ5K9aR8pT7Kkys+fiHlLl3af3oh277yuhngGB2vyDW9hV/
 EJ1QA6eBuB3uedgZjf7GU4o/99K36RAfNLpaD/utFbjgJS+huob+2PJ67Ay0HAqDPWKQwvOSGOa
 XVavk4RW3qaCUTFvG+GuL9RxvJ1mBB27E3xxYrF4F8kOPdhY5MYem7DhfnwLRK/2IBeniSzDAW/
 wPlS+qEVUs5SFOxWpp0g+Mcce+bjWn0bzRTXWxrnQS3KG18V7FX+35Qewb1BP5pAlMooHTzCRfB
 G5jfaSP65ba9aHAddkg00uEHNkl+DyX5yB6YbqyjTwG9jmZPE55h0KJKjADk9NUdXuptcGa5Ozh
 vu1FJ7c4olSAO1uDghCxd5QFeADYd0EQhqr4IPy9gqhpBaxTcN+Yy
X-Received: by 2002:a05:6214:3307:b0:709:b6d0:946e with SMTP id
 6a1803df08f44-709b6d09645mr1636146d6.27.1754724369520; 
 Sat, 09 Aug 2025 00:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm3MfVvK4EIf4H1uoz2bYlt0vMPAaOJ10CZbYEnFJEmJp/EYCEmQWeipcOqLyUae5jc+e59A==
X-Received: by 2002:a05:6214:3307:b0:709:b6d0:946e with SMTP id
 6a1803df08f44-709b6d09645mr1636046d6.27.1754724369092; 
 Sat, 09 Aug 2025 00:26:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a9273sm32441521fa.24.2025.08.09.00.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 00:26:08 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:26:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 11/12] drm/msm/dp: drop the entire HPD state machine
Message-ID: <7vgdlv3kqttwav3ckqlb6xul6o3dpob5iokyqtdvnk3vvfbx4x@kg2gajwovdzi>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-11-7f4e1e741aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6896f812 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=K4FjR5uwuDtgQbbanG4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: UA-LtNHGnHsQnI7w8Nye6vB5s_mhwiRT
X-Proofpoint-ORIG-GUID: UA-LtNHGnHsQnI7w8Nye6vB5s_mhwiRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX4zYOq9A66H+l
 5fK7D+37HIUO+Ur+Pq3zIH17azniPZISSFOfSLMrzwh1K1b5C9T8UbW2EkynW3ddpnLig+Wiw5p
 rHP+dxFc3M9pEUIjSQl2abZgn1wW8iLa+fuWUUVBdMR1eKcSxqGXTz35bSNnHkVXZzuqBIkbAx8
 zbB6bnCyuH/6pPzTudstEm2g6xBGNMFAdBwFfLDQv1OkoJ+QaX9G6Zza4eC8Ey24O3MoSC1dqpo
 G/qjhG3gpySesdB2Do04OLKxBmCdA1ImGz5DIGzYxzqNDtknJ8R81T6MpSUqM7GNdklSZLjnFnb
 n0PZU9B2KdaoHzUfDtnGBaJ/1tb8vqVHz98B4tRsPvB0VEFKMV6n/EZQOcpDrMwJoJxaiwkTlx+
 yFf55Emn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
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

On Fri, Aug 08, 2025 at 05:35:23PM -0700, Jessica Zhang wrote:
> Since internal HPD IRQ event handling has been moved to being handled by
> the DRM framework detect() and hpd_notify() callbacks, there is no need
> for the MSM driver to track the HPD state separately.
> 
> Drop all references to the HPD state machine and replace existing checks
> with checks for link_ready or sink_count.

After this patch there should no more difference between 'internal_hpd'
and 'external_hpd' cases. However, the code still tries to make the
difference for some reason. There are several places where the driver
calls msm_dp_display_send_hpd_notification(), e.g.
msm_dp_hpd_unplug_handle(), msm_dp_display_process_hpd_high(), etc.
These functions are called from msm_dp_bridge_hpd_notify(), which means
that we can end up with the lock ups because of the event loops.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 ------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
>  drivers/gpu/drm/msm/dp/dp_display.c | 148 +++++++++---------------------------
>  3 files changed, 34 insertions(+), 137 deletions(-)
> 

-- 
With best wishes
Dmitry
