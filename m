Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB896BA87BB
	for <lists+freedreno@lfdr.de>; Mon, 29 Sep 2025 10:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433C10E3D0;
	Mon, 29 Sep 2025 08:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgQghBqq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B7210E3D0
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 08:58:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SM38xM016192
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 08:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=wSequNqFSYA0hQaFMGDh8sH2
 KqbBMi/C9WAGDMfQdVw=; b=CgQghBqqAX6HNwF8cUOrkL+/imUDeljUBwxSMLqU
 EABUCjKImHemM61jfkSa5ngSAaIIN9qk6jx0xNtyw/ve46+UV8CrZ855qA5wkC0j
 FSgIqWNYpuQxbvCgAz83PFQjPOdJBELHYSvfXbYkYH/oDfo4bcf37VgPicVaACDa
 AII0m6+fC6Qsd6ILfrex1yeoqb6DclNrOokHpZOgLmXoY+CV2NQHiV4XpasOiexT
 GvMBOrNzWP8MbsKx+20UPxjPyi71gb4UoYmKNhadnp/a3/onTUYD1TZcHHZKoqBL
 zVv/0A4znKvD6uCf1A4OqshGicsKhhpGhIwxE8Tp7fwnuw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977maby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 08:58:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4deb67c61caso58602651cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 01:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759136311; x=1759741111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSequNqFSYA0hQaFMGDh8sH2KqbBMi/C9WAGDMfQdVw=;
 b=rQn1Q+Ch+BRAtrFOfIIww166fXo8Mfp8ECCXv2Cq3XHTgjb/PkzEVsseIy/ev26/qC
 +jRG3Gd6n/rXMGnSIoTerU+ZNJ6D8IaYLLexzlXQpb06sHq/cfmXV5/9c+wj8AqmoSdQ
 FA/50n6KQsAkzVovDyhLynb3zx7doDpRNYW6PjAkbM0+0IZO9BfacybK9KTbopWmu5KE
 K9YZgHLHw2+8fapUHOKvfSiEOI8LVA9xgyyFZMy4Hmw3bsOJvXjhCJii8CWZaqDIA7E/
 UR+E2JlvRUqEP6v/VBQgOUcRmyFp1SpicTcOdM6av/a+hpMhUZgEixThiO027PuxMYio
 kUmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe5rDnbX2VoHamG5mLdYlfxC+5HA8Wka6W3FwRSU5S2HjYCl3DgGEJaHsk8jytU8qpG4t7gwwuHGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzILdIoUQG6v9bTmML9NQkMJPUq8J2cI4OLv1vczDl3T3lLr5WL
 CKduUEKzruw0DLmBnaJWi6BXMUN6eMGz91KrNL+3IOgbOjOEbNAU/8YOsXOOTUMCUPTMm2liwsG
 H24F1rC6zYBaHk4owSb29WK2mf/EoQ6M6GjvHNBmVLcSvEZ/09c3J6kyf0ojNtHr57/3cTl4=
X-Gm-Gg: ASbGncsGmcuaijDWuleThi0YsrQRp/MeUdmogYHpt8lJekfLNTzg7Yoka2HX+Hhldup
 nDPTo9jbeWYY+qtyi6g6+a7duItxZrTuVNslhYMcJzeNPYLCV2GdpB9tal+Bu2IH/noqpvWOk5Q
 1RSdb1uTeO15iu+HpFnxEluraquFG+g4Tf2ucH4sdnSGJgcA81VGXdZ3Kk37goEw1Etn9eOpwJn
 efG73tT88KyzoOYoNGiuaKpnPU5Wan+yWcd+c1mlsxEDu+9HW4AduXIFhyp0pgUmSBr55a41Uor
 hiZ1bvzuRBmSOVhwsdOwR3vIB+FuK9I75L3o0m7uYMALEAMPLkJSUbS48A0xh6p0i2QKfOdNdSO
 pT5kcl2X8DYtvCtDV3FwXYprhHYGHVR1dmJxsweqcV05+pmhz1JKt
X-Received: by 2002:a05:622a:5c17:b0:4df:45b1:1547 with SMTP id
 d75a77b69052e-4df45b11effmr106393231cf.69.1759136310522; 
 Mon, 29 Sep 2025 01:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRXtkJG4+SzyzmUaBbzgU9Nn5Sl1tWg+sCFw1xHVc4pJ5o/wczABJ+K+k97kihrHCINuJSYw==
X-Received: by 2002:a05:622a:5c17:b0:4df:45b1:1547 with SMTP id
 d75a77b69052e-4df45b11effmr106392941cf.69.1759136310059; 
 Mon, 29 Sep 2025 01:58:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831343130asm3993046e87.1.2025.09.29.01.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 01:58:29 -0700 (PDT)
Date: Mon, 29 Sep 2025 11:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
Message-ID: <y3sndmfnwtljkbrssyycg6scjujt4kkjfo3gjclo3suzvqdahl@bdrdzmiolcb4>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
 <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
X-Proofpoint-GUID: nsNY4vWvtAJma8eiL2j_LwBqw4aPZYhv
X-Proofpoint-ORIG-GUID: nsNY4vWvtAJma8eiL2j_LwBqw4aPZYhv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfXzpitcCcMcQbi
 IAJ8ftimPYlrASW2XeH/7zIp3YJZ2kxffW7JLcJmv+49Fk5dcA+etZ5i5i+Nz7bphEkvfT4sksX
 Fek41rrBNI1c/qcANcKL+AAki0huMb63+RQM733A8mDcZwuy/eKiPS4i93Sh05GUpDdcJhBHsJM
 +SbakGqDR4CDf7sQqzUqVRajkpPa2DItqnFlP9g2cZf/6Dyz6cUdvz950XXAv5xWw8u6nyOe2+e
 vbmfhWdC/Nn1lWah+/E99vUNijb88UpbD34iaWK6lLYwsxlv7Yfy4/bT+0aicm01jNkIt76acXP
 tHkwTFHf9u7vnATFxoD3vvsfKdEevF9Ik85wwKzvNJvX5rGJsFVXHISMjN/C3xVl6kRHDvzElo0
 oJuAToP8nhxhfq+zjRBB2Q+ZgkixQQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68da4a38 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Wi-JpQQdkJIPRSjGzdwA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

On Mon, Sep 29, 2025 at 03:56:31PM +0800, Liu Ying wrote:
> On 09/28/2025, Dmitry Baryshkov wrote:
> > Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
> > return -EOPNOTSUPP for unsupported InfoFrames and make sure that
> > atomic_check() callback doesn't allow unsupported InfoFrames to be
> > enabled.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
> >  1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> > index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> >  
> >  /* -----------------------------------------------------------------------------
> > @@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
> >  		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
> >  		break;
> >  	default:
> > -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> > @@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
> >  			     ENABLE_PKT | REPEAT_PKT);
> >  		break;
> >  	default:
> > -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> > +		return -EOPNOTSUPP;
> >  	}
> >  
> >  	return 0;
> >  }
> >  
> > +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> > +				      struct drm_bridge_state *bridge_state,
> > +				      struct drm_crtc_state *crtc_state,
> > +				      struct drm_connector_state *conn_state)
> > +{
> > +	/* not supported by the driver */
> > +	conn_state->hdmi.infoframes.spd.set = false;
> > +
> > +	/* should not happen, audio support not enabled */
> > +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> > +			     conn_state->connector->hdmi.infoframes.audio.set))
> 
> Maybe use drm_err_once() instead to provide the reason for the warning in
> a string?

I can change all of them to drm_err_once(), sure.

> 
> > +		return -EOPNOTSUPP;
> 
> As this check could return error, it should be moved before
> 'conn_state->hdmi.infoframes.spd.set = false;' to gain a little performance.

I'd say, it would be negligible.

> 
> > +
> > +	/* should not happen, HDR support not enabled */
> > +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> > +			     conn_state->hdmi.infoframes.hdr_drm.set))
> > +		return -EOPNOTSUPP;
> 
> I don't think IT6263 chip supports DRM infoframe.  The drm_WARN_ON_ONCE()
> call could make driver readers think that DRM infoframe could be enabled
> in the future as audio infoframe has the same warning and IT6263 chip does
> support audio infoframe.  So, maybe:
> 
> /* IT6263 chip doesn't support DRM infoframe. */
> conn_state->hdmi.infoframes.hdr_drm.set = false;

I'd rather not do that. My point here was that the driver can not end up
in the state where this frame is enabled, because it can only happen if
the driver sets max_bpc (which it doesn't). Likewise Audio InfoFrame can
not get enabled because the driver doesn't call into audio functions. On
the contrary, SPD frame (or HDMI in several other drivers) can be
enabled by the framework, so we silently turn then off here.

> 
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_bridge_funcs it6263_bridge_funcs = {
> > +	.atomic_check = it6263_bridge_atomic_check,
> >  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> >  	.atomic_reset = drm_atomic_helper_bridge_reset,
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
With best wishes
Dmitry
