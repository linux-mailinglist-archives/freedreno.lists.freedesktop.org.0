Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E0D27C24
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 19:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AEE10E05B;
	Thu, 15 Jan 2026 18:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dm3pWua8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ghX/M6SS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577F610E221
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 18:48:29 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYJ2r2174643
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 18:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=M+kGULx0ZlJNIEVEzx9Xsp+W
 0l+4aWGW2n5tMCnSgWU=; b=dm3pWua8XpugZzSe1qTqjLw+5mct/HlK65nv92jl
 YwVrKJOAmQxvI0qkWoSoC0BbHBVfweHmRDZ1JgRAzB6iaCiBLhT6iwHHX6n+c7Ny
 c/RBJuPpGks9BvP2SKDwQPDLfIR2DOOfAaYXZwNxP2TkQiYSsrDib6S83roLYE79
 FNzwYGdDUW+c69AkU1lxKvFC0EKtNkyFCJF1gywp69x0EpJPBcabDI1VBlcDoCvg
 WdmPeQGz6LAwHY/sW3UdT1W7agdo/hsOKEUb1Hwv8lrrtRjW9A+dIa3cEipbUdwb
 EE2zFjc8dBA3/btrxzYS32elokI7MFIvhdCxoLqRIAM+VQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq1xh8ux0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 18:48:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so473053685a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 10:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768502907; x=1769107707;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M+kGULx0ZlJNIEVEzx9Xsp+W0l+4aWGW2n5tMCnSgWU=;
 b=ghX/M6SSskhksU8kecZMRwRQcNOggfTsSt4e2+npi9+bjriihU4rPPlnnCnMi422Ea
 FZDgqoaUawUgxLI2NyepYsEWSgD8dhsSOU4nrHRfoeOryJxkKp/vpMG81ZPYTjXtnlmC
 PZ97tuyWjKrBgCvppq8LE14E7V+xoUpptXienonVNKhdRPZJkp9wdhQTFkOGt+49NHsv
 3yfUBJIfWX/UcZKUd2BJOdvzw+OESe7mlKDT63e69KPj8AUo41Oozp9PM+5eC28ENUUq
 Et6NPZyPQM5szTYiV5Af13O3GjCF73BhfvNs3YgFcRUJyoZKyJbLn5fYDEnwtlBXeJVJ
 SxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768502907; x=1769107707;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+kGULx0ZlJNIEVEzx9Xsp+W0l+4aWGW2n5tMCnSgWU=;
 b=tGCuxk1Chlga6kcN2woEf0/S36RRz5jB/QxxlJeR8v4JFHZbH8JXm7n5nO5AM/PA3l
 YKpq5bIsqxQY1KvjJqnNjTaKyXPQbOZT5UopSHeZg5KiC9m0CjnA1s7gXeF6/5AvM9Nf
 U5vwqDlvbDayhi248dPStiT3AjCSMPlH1zgGCeFwMZm44COivqsBoAxIAYeByIfZFW5N
 zZ6iSNzm/x9v6f7eqB9/2vznP29LA1C18Vu99xl2X1+eBOi0q9ZigZwNhKJko2j+ySO4
 ShUTA5E68xNo85HNYMekPkOuapiv1HEWp831Xsue6x47WAm0LBJKTYzY21HMjCxurluA
 f3SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkKJyu1JDK2avRCia0dJLz3jnJPGwicF/8e4Mq2GQBL43pGhRqjvmNT0C4yBXWOjeMdAP2Ax0XEgI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNsaMRYwiFO7DMDFadtWpbkM13DliyXwfCYaQscXYCo0gRZy9u
 A6WkTednJhTzJgmYmho5hCh5e0quZt5yhnWInfU7QXWqeJXE97Zld8CmVulgXllLAC+yIAH3V27
 jBdRokzPW4qC7rSUkBqkGn+7qGk9T9vtqDVWVHkYWodrehHrv7xkY4BjfbXaqFysNiv7Dw8U=
X-Gm-Gg: AY/fxX5S03UeUCk0uMr4XpDPDcFuAYFMVrxi6OgonpfVpGmULlX0rlW9is1xHST+lUg
 VCW3rJzmG/FeDZQ+XHAmT5+Hf4bTqSgbnGJnTbUtx0btcxuJKUirWtG5Ihvv3E5zkYMlUxk4s/r
 5f/PSCnFaossb1qTSSkorcfJWRp54tO68GCDBcD0PITP/ok6RxSwpMwuYAsw8TE+U+HEaKb1WB8
 1FC4ClOA/9WKJdbHTS8+6RraF8R8fKjUMJlzX6zgS6nwqY/34uAmvAkRIUK3/pLX5qZeJ3VK7P6
 jx/P93Ej1oMla+a1jFYqUeAzy59w6uybV0ZlHfQee4UIuRRL8O47JHnShDPwmv507EyHg558SzD
 uVtauVj2HfiLHaMWntynvw38bOqxztnKfF4jEEYbW1zX3Z6s34/58ZXntPQsImAO66+CaLB41Hr
 0oy6y0CT6JyG1xz7FdR8aos4A=
X-Received: by 2002:a05:620a:1789:b0:8c6:a3b4:cece with SMTP id
 af79cd13be357-8c6a690638cmr54970985a.38.1768502907353; 
 Thu, 15 Jan 2026 10:48:27 -0800 (PST)
X-Received: by 2002:a05:620a:1789:b0:8c6:a3b4:cece with SMTP id
 af79cd13be357-8c6a690638cmr54966485a.38.1768502906838; 
 Thu, 15 Jan 2026 10:48:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384fb8b25sm876551fa.47.2026.01.15.10.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 10:48:26 -0800 (PST)
Date: Thu, 15 Jan 2026 20:48:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <35swyvpxv6xf64lgl2o6hy363ahjyv6gcrfnv76vcgec5qxmb2@etujn65vcwho>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
 <ti4tccx5dnupiv5ppglvcg7xmn2twvdjv5fktupgnqp56we4u5@jsd7mdrbhbwj>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ti4tccx5dnupiv5ppglvcg7xmn2twvdjv5fktupgnqp56we4u5@jsd7mdrbhbwj>
X-Proofpoint-ORIG-GUID: wZjcLvLo1vdep0ehHDO-cQLxy_UDhwSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX0lLZUro7/aeV
 gFmvGX/UCOrGP7NlH/dzWiy6VlhKt9eJeKB1aa28lyuXEPK+SiQzgPZ2DzMW9toonZZ8WWddXn+
 cMpe7WH9AefQCbrHokucqow6vNcX4wKFsw0ENy7Ptx9pvBLFRGtPM+ca4etPSVxQn4cdpceXwW4
 ov1+6n9qNgdvhkRFpK7bceUCr8IFu+eAnWfpGg/sguRQqATD5QcGCPKhHhfNi9tsNzedSesqhYL
 SKBZOTy3rjIw/3XjVP2Tc06tIZiL8V+eVdrh1dsKglWE4/njG0iSQ2yKBkE47AJVjB9fFsSx7SD
 2LaMpIjBzhNiT8lpH2ovNAYfvm+lzeRw6+Ka5eaKicO69Ep5D6ZQeE89+8nLW/31sDAMWcPaM2h
 2ZUKPTS5Wr6fLNpyrsa5dHHiLj07wY2pFm6uMt1mftFZCdmiFNjDgsiQASWZu6Z5nPwxG9yNELT
 9FgdtsVMQ9ber1R+6Tw==
X-Authority-Analysis: v=2.4 cv=TdWbdBQh c=1 sm=1 tr=0 ts=6969367c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ttbCVT-mbSeCTn1l7fcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wZjcLvLo1vdep0ehHDO-cQLxy_UDhwSi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144
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

On Thu, Jan 15, 2026 at 08:57:24AM -0600, Bjorn Andersson wrote:
> On Thu, Jan 15, 2026 at 09:29:08AM +0200, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Instead of relying on the link_ready flag to specify if DP is connected,
> > read the DPCD bits and get the sink count to accurately detect if DP is
> > connected.
> 
> This makes it sounds like the two options are equal, but they most
> definitely aren't.
> 
> I think this commit message should capture the fact that "link_ready"
> not only says that the cable is connected, but that we've managed to
> bring up the main link - which is a source of race conditions in the hot
> plug detection logic, as well as making it impossible to move link
> management to the enable/disable calls.
> 
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
> >  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
> >  3 files changed, 62 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 5997cd28ba11..a05144de3b93 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
> >  	return 0;
> >  }
> >  
> > +/**
> > + * msm_dp_bridge_detect - callback to determine if connector is connected
> > + * @bridge: Pointer to drm bridge structure
> > + * @connector: Pointer to drm connector structure
> > + * Returns: Bridge's 'is connected' status
> 
> Could you please rewrite the return definition, to capture what the
> value really refers to.
> 
> > + */
> > +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> > +					       struct drm_connector *connector)
> > +{
> > +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> > +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> > +	struct msm_dp_display_private *priv;
> > +	int ret = 0;
> 
> First usage is an assignment, so no need for the zero-initialization.
> 
> > +	int status = connector_status_disconnected;
> > +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> > +	struct drm_dp_desc desc;
> > +
> > +	dp = to_dp_bridge(bridge)->msm_dp_display;
> > +
> > +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> > +
> > +	if (!dp->link_ready)
> > +		return status;
> 
> So despite the commit message, we're still relying on the link_ready
> flag? (With the improvement that even if the code thinks we've trained
> the link, we can still determine that we should report it as
> disconnected)
> 
> Perhaps I'm missing something here? Did we change the meaning of
> "link_ready"?

Not yet. It changes in the next commit (and I should probably add a
commit renaming it). Note, before the next commit (moving link training)
we can't completely change detect() definition, but we also can't move
link training if we don'g have a proper detect() at that time. I agree
with Jessica's decision here to have two separate commits: this one adds
(imperfect) detect(), the next one moves link training.

> Other than this part, this looks quite familiar to my experiments. Very
> happy to see you continue this work!!!

It has been on my plate for quite a while. Let's finally get it done.

-- 
With best wishes
Dmitry
