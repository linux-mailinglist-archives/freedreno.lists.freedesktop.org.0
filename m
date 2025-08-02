Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B05B18DED
	for <lists+freedreno@lfdr.de>; Sat,  2 Aug 2025 12:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC2910E004;
	Sat,  2 Aug 2025 10:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8IKCKUD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B253110E004
 for <freedreno@lists.freedesktop.org>; Sat,  2 Aug 2025 10:18:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725g4Xr009900
 for <freedreno@lists.freedesktop.org>; Sat, 2 Aug 2025 10:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Jx+kGc1/RtPDFH2kU0Zb9HbE
 qcdsxBgONzyUhmEa04Q=; b=M8IKCKUDEC+Bd7QZtmEsqmYVwRAdDw/7z3Lfae+m
 uSnhCG4cChirryJxvVQGcObJPaHmBNSxKmt5xFy95jUK8OH1c3hkCCETqnEDaVUb
 gNzM7e+qacgNXr4mIyeu1ttimWpDBxqOeVRVXewtT7w8jmX+9ThOzUerngFF8frX
 kwenYUebvafcly5XthVInTotUAO8FRpCnrE/J6CGRUyRk17WbCcd6KytPLrfHMXT
 Fxbye/W9+xQVto+0xrQ+DVdTxCEnyogYo777Xxvu0KObV+2aH9z+ugb6fR3zHm+a
 xHZIP3IX0WFPDvkx3XvNh0YigwyME2cTsU7hcoJ2AmF+Sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a0kg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 02 Aug 2025 10:18:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e68bc0408bso225283185a.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Aug 2025 03:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754129937; x=1754734737;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jx+kGc1/RtPDFH2kU0Zb9HbEqcdsxBgONzyUhmEa04Q=;
 b=a1crfFmyMfw6Q1T4xhGWBMnFmqWdBh3SVtYUmGYAUHGC3hPWHQ9kKM4LdKZD2VWVYS
 BeDdqj1BEvqocTkSpqzHfrxya2ZXCFLQNBb7MPWrqfy4miKPxdjw4/j8PEDjejR0+pLj
 QTaexXamMSRLzSp4DVeCHiwt0QhjnzGeOyJDF2iBdT4iVOa9FFd+dByr41BrTcGBGGsJ
 5W4olYfXepiHSV+tpoePlWPqjXAR1xdfSv7boXDvrvykSUnveMy2tKt6YtFbFV2pw4OK
 BMnJMGY2YMlyUsiJsa4bi48edFOw1GPEjUilWMJqtOBkRV4hCYe0petH25qPw6BXxRQv
 essQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmvBIWogyOcjej5U49A9dWHZgUAz3PiTQs3DNmYHSsitfJzMbffvBbv8GFuIikQX27tGUJ1YkGbyY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJJkT5x+rrRpOz4NVIS7frQyS7xOSFNHRhwKZX+4PIdvRWCTm7
 43ayV8BGhrOscIXiPo4pqXQN4Q0kKAzgbBvyFU0b+YnPWUrIW7DLAft8rd67oV3VKDuOykn8O5y
 RMU/UMP9VtbwrNndDtbdwy1JnDXB+eYEYqLMbbejwMPeRPDE2ggxb5u0RBOdvWIbiGbAxmJw=
X-Gm-Gg: ASbGncugWyfi24lsaRQUwI+exKNf/x76N1bo20dEZVhY1PhLY3KAK4Z65WmpUiHkIfW
 nnWU8nKl4W/V0q5Q2EKiaqTzIgCy1DBhtNefyBf5+XiOAF4w/KM6Fp5yJVGkqjYh79dTGd2kxp4
 /i8X2EWaJdVWf3PH9MRj/xUHJJ+XTP/QY4LCvTA+HVxAkgwlQs/Y+nv889TDgfqB8LD6tlBJHlm
 YQiD+NHilDGHdcqYGzDOZ2J1p3J2Ge45k3bM3STAexexgTWMyobjp2SCH9F1iahJeLwv2gsyHBY
 tlL9KVy7ZkryaON59Eg2SghzDq41oIxDNwgw05g7vbPbo+vbM6eqOn7RFccYmW41IKO8LzfKOQL
 dw6osAySdZZ4OReKo5zpSD9w5SXqVMHq8XN6Cx3Lb/5BNsvsGnbUf
X-Received: by 2002:ae9:f716:0:b0:7e3:48a2:b978 with SMTP id
 af79cd13be357-7e696371059mr347570385a.49.1754129936731; 
 Sat, 02 Aug 2025 03:18:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkTnIMpLeKTQssFIE7XgfKnhYV45kHZ+Dp3zZITljw76FcrvhI8dE+FJ/ar1u/0l7+mkctwQ==
X-Received: by 2002:ae9:f716:0:b0:7e3:48a2:b978 with SMTP id
 af79cd13be357-7e696371059mr347568285a.49.1754129936298; 
 Sat, 02 Aug 2025 03:18:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898c2e9sm918063e87.4.2025.08.02.03.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 03:18:55 -0700 (PDT)
Date: Sat, 2 Aug 2025 13:18:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <qz725rrbpae5iw6tmx2s2pbaxl7pliyxf7dd3gyev64zqrbq5t@aeacyijbswl3>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
 <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
 <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a085fb45-91e2-4827-b8e9-8af90796cc49@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=688de611 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=alj5FwM-wW7eLBos5QIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _ukeCpQty_CdQFM52LQ8WeTQjD2oPHJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4NiBTYWx0ZWRfXy9/ZvmCFQmRI
 XZ1Mfl6KEuqjCgbUXLyBvFz9j2xncjeSb1HU9Mn7/apDGAST6LIOe2IDvgbZrKidZhPLiLVjC2Q
 tXgYGKXRTUBH+zHjPqI5TCm06QNMGhB9WTipuHcycA5SSwg2MV5sLJKzX5O7yQ+bmxH7g1B8mp9
 B9JV2P5Gm6sxWR4VSSmg18tXFrq6G+tco6VRUhmvhLoXHOPUDqqDSyuwJDIb3cG+lXKHsWO3klY
 3Q60qagENwxNwLcu6akJduaqaK5bnpul1iy1+QVqAcrQVHQL6WDf9xeNJFCtSaSP4TdnYR33Xvc
 EGfMuD6yeiuwi5rCKC0VCRNaN5h6tfAb6ExChVyVb1WZz8snU85rxg/3eYAYZlN7nmh/CUnl/yS
 wmzh58R7ernuKy/6BQ3jkHHlU2EvYs3keDSXuO/YxsL0PmpQScGf8kzLips80Wi6W7RE8cAj
X-Proofpoint-GUID: _ukeCpQty_CdQFM52LQ8WeTQjD2oPHJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020086
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

On Fri, Aug 01, 2025 at 04:58:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/14/2025 4:54 AM, Dmitry Baryshkov wrote:
> > On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
> > > Currently, the DP link training is being done during HPD. Move
> > > link training to atomic_enable() in accordance with the atomic_enable()
> > > documentation.
> > > 
> > > In addition, don't disable the link until atomic_post_disable() (as part
> > > of the dp_ctrl_off[_link_stream]() helpers).
> > > 
> > > Since the link training is moved to a later part of the enable sequence,
> > > change the bridge detect() to return true when the display is physically
> > > connected instead of when the link is ready.
> > 
> > These two parts should be patch #2 in the series.
> > 
> > > 
> > > Finally, call the plug/unplug handlers directly in hpd_notify() instead
> > > of queueing them in the event thread so that they aren't preempted by
> > > other events.
> > > 
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
> > >   2 files changed, 11 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 87f2750a99ca..32e1ee40c2c3 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> > >   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> > > -	if (rc) {
> > > -		DRM_ERROR("failed to complete DP link training\n");
> > > -		goto end;
> > > -	}
> > >   	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
> > > @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > >   		force_link_train = true;
> > >   	}
> > > +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> > > +	if (rc) {
> > > +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> > > +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> > > +	}
> > > +
> > >   	msm_dp_display_enable(msm_dp_display, force_link_train);
> > >   	rc = msm_dp_display_post_enable(dp);
> > > @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   		return;
> > >   	if (!msm_dp_display->link_ready && status == connector_status_connected)
> > > -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> > > +		msm_dp_hpd_plug_handle(dp, 0);
> > >   	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> > > -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> > > +		msm_dp_hpd_unplug_handle(dp, 0);
> > 
> > This chunk should be separated from this patch. I'd ask to drop
> > EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
> > all over the place instead. You can do it in a single patch, which comes
> > after this one.
> 
> Hi Dmitry,
> 
> Sure I can split this into a separate patch.
> 
> Is the goal here to remove the event queue entirely?

I think so.

> 
> I can drop EV_USER_NOTIFICATION,

With the link training being moved to atomic_enable, there should be no
need for an extra event here, I agree.

> but I'm not sure if I can completely drop
> EV_HPD_[UN]PLUG_INT entirely without major refactor of the plug/unplug
> handlers since they are used for the HPD IRQ handling.

And one of the pieces of the problem is that it's not doing its job
correctly.

The code flow should be:
- Inside the IRQ handler notify DRM core about HPD events from the
  bridge, don't do anything else.
- Inside detect() callback read DPCD bits and identify if there is a
  valid branch device.
- Inside hpd_notify() check if DPRX has sent IRQ_HPD pulse, handle the
  rest of the tasks: link events, etc.

Note: we might want to duplicate DPCD reading between detect() and
hpd_notify() in order to relieve detect from updating the DP structures.

-- 
With best wishes
Dmitry
