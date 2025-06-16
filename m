Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BF7ADB272
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 15:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9680710E3AE;
	Mon, 16 Jun 2025 13:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKxODzvU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7F510E3AE
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 13:48:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8PQEW020020
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 13:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BIIY/fRKWsQgNmG2HbZPcw1m
 +aSAr4IzJ2LTNf0iuZ4=; b=fKxODzvUyXzYkNWXxcEuVXnKnKWE8tgplu93rLqn
 /jt8j6bVg/62lB45+YRYEslrCh0UJFCfNy/0iPTqqYVpTZt8RkbqF5hbR3hwWV4c
 15r7sqSM6oPhcJgHnFdJCP9W1B0KtISa+9xjsSEudS/7DlI9pReP/8mvyKs5D+Qd
 cd0WJ82x27xZ7v2OizMGkXUyf6zPuzksfCw5qDcJMLPTQwilKyYGK04rxswHGu+c
 Ki8UNWfgVjWinIWkO93K+hf5UDFDATIFUriAqAKfoFqs3youqo6wo8CbZXk4Kxpr
 sgxjo31Ow/tBqp3j0/hM/vMKUSX3APZRu4FZOeGN0M3wWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791encpph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 13:48:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fb3bb94b5cso57813846d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 06:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750081691; x=1750686491;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BIIY/fRKWsQgNmG2HbZPcw1m+aSAr4IzJ2LTNf0iuZ4=;
 b=fcM5rdNbe3Vio+GOnIHEYNEHqyqAUOhJKq+vrhYRffJv9Y4DWPLF6nQND25G+VFx+3
 hSiQORoLbJPepnmQZxNMXm8r8vqtj4YVM4Kf6EWrRms+upDPTuPzNkYAcIDrhW9v+fsW
 KZyVjlhrVXKT3U/NxHZvI/k47PQBQN2IwNete6W174D2kcBW9gXMFVMt8pDCPtOKeVdA
 gWZ0tZ12KA5ThZ9kol3BqX0eVgwxjhxOjeM/4H3Sj05mtuogI5c6i9DZh+O12WEwodMN
 m+2xPrGLrP74mL+/rZzpZGk7P2MvD/xOdAsUEI5wQMjzwmIOsUeq0tWvCrO169IU0aE/
 AGTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjbC1s4zmIVXTvoymqWzFWt9+iMYyG1MeeIXB/c5xqpLgoyyQVHbJJ6dLKNFM2qNO4u69oUzq9S4o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOPG5/zABTMXBGZX6XzL13rU54jQPdiUAWcPre30i9jKxJ8ROR
 zI8wRR0RM5ec+/rGX2hUwo9whuXKjXXSIa4p8X+bWgECK/ix+Tlgmm1HtcnS/ns100yPICpY4Ca
 ZoRvAN3FRVIZBIWt3dv4JSxYB7ZAcoMKEGqZEIlvk+DDTgcts8ouoaBs8uKoQ0pWGMJfB5Pc=
X-Gm-Gg: ASbGncsjxxgmBmLEu1VL/aIlhuoZ0hli0K0fOR67vnyY/ApHXQ99XkUbrb+PnSE6SUe
 8hs/CEziXnd80FyNhGkxspOtIr2hcAK0RVfEYry8dtfO63KWsE8xlexMzrCHxR83ZOMA4JWrY16
 W9nqtijxcthGKBWKKLVLo1wyCmYDvTljfwub2a6b7F+kEBuRNfmZDPC4nw9AXghlfxI32yx5hop
 Ps2awQQjEUX6u6Hbcd1GxooiLxO5yLDu7MMcdLRa24fs9/udDvacNAR7ho2+hn6gk3OBRoR2a4+
 t1enqkZH5PttF3Er6uUM3S87Z31c/kTHUSN+omOqbUNibh0/wKN0VQAlAXqlFXECihNJT2Scwdq
 AKBSkI1pLAKL6/jrOUbz6mvAWkP04eA5kODo=
X-Received: by 2002:a05:6214:252d:b0:6fa:ff79:2cfe with SMTP id
 6a1803df08f44-6fb47729df2mr137837776d6.12.1750081691119; 
 Mon, 16 Jun 2025 06:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4hLKRzzWBZMauvEObY3mOqYUuEjkBCcDNkBKkaRNoOK6orlQCG9s5Zi1kcaeGYrzQFeU1Ug==
X-Received: by 2002:a05:6214:252d:b0:6fa:ff79:2cfe with SMTP id
 6a1803df08f44-6fb47729df2mr137837276d6.12.1750081690559; 
 Mon, 16 Jun 2025 06:48:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac1c25d5sm1537270e87.166.2025.06.16.06.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 06:48:09 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:48:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <7r7vdbeols4suew7rlvogft4b5lmg22osipydxzkubxsychewi@lpyj6vmoapzb>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
 <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
X-Proofpoint-ORIG-GUID: -TD_6VNBr2tIcFQS2aiJ_rW5hLSMfKbq
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6850209c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=xh06mepXuQVyf8XfyCsA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -TD_6VNBr2tIcFQS2aiJ_rW5hLSMfKbq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4NyBTYWx0ZWRfX48/8f0CRL8GN
 y6ucGZX2jNJ3O52GPCBqxMf3n8ctaHYvX24+DaJDBgiCKkcSNq3VY+wTnHy3VIAWR0rggTuJSDi
 EALjJYjAMjzPMkxgDZvXZul4yLWtQUCL8mucl8OrWXrhnuWQ3DACaL/pDqLGZyAFjm4vAVBEsR3
 LjKY8Wvn6OWd9rAV2EXZVhLzr1C+SnJRzUIpcLUSXNk1jV6IYLk5r1ci65AAqoeBIsKdeTfPvU3
 nD663MMk8HNjrQLL8KMda4ur7OidrEFonAZQMIoo1Nriw9m+4Nsp8G/Xg6e+NoGbPtsIYIkR6WY
 tHcmny9Xhf9JiCaUSphAj3POkc7TTO74Wv3T2j5KDcAcG/N7L2hwhB3FHnu5K0SIotLysPZVRSU
 HaGIw9njLAUYzOMJz0XMG/0jF/mn9rBOY3+/TfkHdr64k3Mh/WMpO+7VtSE00ifklQedoiuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160087
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

On Mon, Jun 16, 2025 at 08:43:40PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 23:51, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add connector abstraction for the DP MST. Each MST encoder
> > > is connected through a DRM bridge to a MST connector and each
> > > MST connector has a DP panel abstraction attached to it.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
> > >   2 files changed, 518 insertions(+)
> > 
> > > +
> > > +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> > > +							    const struct drm_display_mode *mode)
> > > +{
> > > +	struct msm_dp_mst_connector *mst_conn;
> > > +	struct msm_dp *dp_display;
> > > +	struct drm_dp_mst_port *mst_port;
> > > +	struct msm_dp_panel *dp_panel;
> > > +	struct msm_dp_mst *mst;
> > > +	u16 full_pbn, required_pbn;
> > > +	int available_slots, required_slots;
> > > +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> > > +	int i, slots_in_use = 0, active_enc_cnt = 0;
> > > +	const u32 tot_slots = 63;
> > > +
> > > +	if (drm_connector_is_unregistered(connector))
> > > +		return 0;
> > > +
> > > +	mst_conn = to_msm_dp_mst_connector(connector);
> > > +	dp_display = mst_conn->msm_dp;
> > > +	mst = dp_display->msm_dp_mst;
> > > +	mst_port = mst_conn->mst_port;
> > > +	dp_panel = mst_conn->dp_panel;
> > > +
> > > +	if (!dp_panel || !mst_port)
> > > +		return MODE_ERROR;
> > > +
> > > +	for (i = 0; i < mst->max_streams; i++) {
> > > +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
> > > +		if (dp_bridge_state->connector &&
> > > +		    dp_bridge_state->connector != connector) {
> > > +			active_enc_cnt++;
> > > +			slots_in_use += dp_bridge_state->num_slots;
> > > +		}
> > > +	}
> > > +
> > > +	if (active_enc_cnt < DP_STREAM_MAX) {
> > > +		full_pbn = mst_port->full_pbn;
> > > +		available_slots = tot_slots - slots_in_use;
> > > +	} else {
> > > +		DRM_ERROR("all mst streams are active\n");
> > > +		return MODE_BAD;
> > > +	}
> > > +
> > > +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> > > +
> > > +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> > > +
> > > +	if (required_pbn > full_pbn || required_slots > available_slots) {
> > > +		drm_dbg_dp(dp_display->drm_dev,
> > > +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> > > +			   mode->name, required_pbn, full_pbn,
> > > +			   required_slots, available_slots);
> > > +		return MODE_BAD;
> > > +	}
> > 
> > I almost missed this. Could you please point me, do other drivers
> > perform mode_valid() check based on the current slots available or not?
> > Could you please point me to the relevant code in other drivers? Because
> > it doesn't look correct to me. The mode on the screen remains valid no
> > matter if I plug or unplug other devices. The atomic_check() should fail
> > if we don't have enough resources (which includes slots).
> > 
> Currently, I haven't found other drivers checking available slots during
> mode_valid(). Intel will check the PBN in here.

pointer? Also, what do AMD and nouveau do?

> This condition can help us
> in the following case:
> 
> Assume two downstream devices both support 4K 60Hz 10-bit. In MST mode, when
> the first device occupies the 4Kx60Hzx10bit mode, the remaining bandwidth is
> insufficient to support the same mode for the second device.
> 
> If we check the slots in mode_valid(), the second device will reject the
> 4Kx60Hzx10bit mode but accept 4Kx30Hzx10bit. However, if the check is done
> in atomic_check(), the second device will display a black screen (because
> 4Kx60Hzx10bit is considered valid in mode_valid() but failed in
> atomic_check()).

If we filter modes in mode_valid(), then consider the following
scenario: we plug monitor A, plug monitor B, then unplug monitor A. At
this point we only have monitor B, but it has all modes filtered when A
has been plugged. So, it is impossible to select 4k@60x10, even though
it is a perfectly valid mode now.

Also, with the check happening in the atomic_check() the user will not
get the black screen: the commit will get rejected, letting userspace to
lower the mode for the second monitor.

> > > +
> > > +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> > > +}
> > > +
> > 
> 

-- 
With best wishes
Dmitry
