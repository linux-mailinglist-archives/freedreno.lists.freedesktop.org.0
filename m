Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE9BAC1EAA
	for <lists+freedreno@lfdr.de>; Fri, 23 May 2025 10:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F2310E7A9;
	Fri, 23 May 2025 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpHJpQN0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC13A10E7CB
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 08:30:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N65nbE012749
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 08:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VfiheIwlbsPSX3tKRqcUN7oc
 TCW0r9qBhyKUU/kzcNM=; b=KpHJpQN0dwtJLO+HTWzFKrFnk7bx+iSwn8bK+dSQ
 OcDSzPCmLUMrm/kv9g/5xyF0sMhlh7fYHwVBpNLpRtNlXPqjfnzO2V7n7/shn76n
 H+1+qDbvv7oTE12vRufyynS784yTKkqgKG3HYryJHeGvRlw6VpH29+fp5d6v2mh+
 O0EljvCWr36c4t6relmE6w4GeExam1CEKbOEzDi2Vv2gXldPFq+aLeAFJRke+mBQ
 wi4GT93K8pVkXpt80tvRVnaalOgvdiYPtKD4WUzq3WLp8LDuhgYoZIqJPy7cXJB0
 SOeAYJIab+0mlin0k1dpH1a8nO9fBiWQkDml+gGCajTHSw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9h6j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 08:30:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f50edda19eso129555686d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 01:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747989002; x=1748593802;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfiheIwlbsPSX3tKRqcUN7ocTCW0r9qBhyKUU/kzcNM=;
 b=ZXrR+WDf6cXgx4TQ2EnoQj5/KnCeDbRWqa18i1oII9WAHfH3gFOnCpAQFMUHy9Ea+T
 shgfPVKmjqD5UVtatgxzeas1v9KOUfBFk4PpgdXXRD6eleqNY6JcAvKSRmuun/sDpxox
 SOMXfNnx6ob2zVwipXR/+ywkSTYiwVSkaKwHuniINV89pj8JMFeu3N3iO+jpBE5y9rJ/
 RY5MpimCHhACeKfLZH7m/4E0HaOPfPww/m5ElA0av18Ftp6VFPozNklU3qqxpCtjhu3i
 NBw5mgvjnoHW7Dns/S6PyMZiDr6jR84y3+SZqurQyvZCcdSCID63X31hwhpXvI/XJE34
 KmvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpl8EZpNmMGBRPChtohb17R9w+9/wfl1dP93oEnIKxUtsR4o/898qbcFBX2b8KwVtrUTr68aNA95A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS2E3p6YGRDr5ZSZDj5PPr54GdqRRgehMBh18722ncUitwa4gt
 BMa1OPRxbnTkTFwxm1RROjts+yBLyJDVybpOpn/S2Rillv740IyScGgIzC8O5vf23ToIiKB1+9/
 BYKNrLxUTxm5aCa6mRVlGUa4a5vdo7GLg2e+pZrGzGnxz1x1NyzpWmFrn7Zy0VYOHUTZJpvk=
X-Gm-Gg: ASbGnct0qfAsGwTDtqMdB36UghN/qT2AFYHsRlN2jnC0o8WQr6OFK52xnWDfKsGR0aL
 MF0xEbMj4l4LJKYQOD9+r+wOS5cAgj7odzWh5UNXVhB8Eg7qSMqAxmSMo2AABttx/w8i8JRssYI
 2103ALo38ffDnNj8Gp63ZtGbjO6ydg5NXYxsSSx0vifFK/JezlXzE0iz8m/Arsc2q8zyn3HcyOs
 tUKrxtPZDUwrONmth0yU8NsVNpadeDG03i0JtPD6wtGUh/TvNAEu/e1DsiE/8+pkJhLUpypyLSj
 FgNTTPNSCdlk10mQXB6yllv1DhbjTyOpnK1jpdQUC/O80FnfrlklImFtl3NE9c7+oYCJ1UsCmwY
 =
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id
 6a1803df08f44-6fa93aa463fmr35204496d6.32.1747989002044; 
 Fri, 23 May 2025 01:30:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQTPt4MTIbkICZvOrh1skICymAaWmqgOHvMqVvofwa6vGpCOsSPPMr6URNTP7Fxd27LeFefg==
X-Received: by 2002:a05:6214:2aa1:b0:6e8:fbb7:675b with SMTP id
 6a1803df08f44-6fa93aa463fmr35204156d6.32.1747989001635; 
 Fri, 23 May 2025 01:30:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-551faf6be77sm1933997e87.84.2025.05.23.01.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 01:30:00 -0700 (PDT)
Date: Fri, 23 May 2025 11:29:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <dlkrweid62i6jz3iexahbludm32hppzen2odjx27sxfe6opt5c@zqnryzjpzqoe>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org> <aDAdax7xdeDsvQHB@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAdax7xdeDsvQHB@linaro.org>
X-Proofpoint-ORIG-GUID: 61TR8JJ3haxkgrfZWTODWX3WdcQufqrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfXw1qqKhJQZfCm
 Jm1nVabnvJma5YyMcx1B83CfgHXhoqcMW8j3CUjzKDLX7uNZTMC2LFOl+Tu3+PaJ367M5NJ85Hq
 df+XX99J7Iw63nyh1XiXIoxF0u8lcGin07aIna9Bke0kcrUEgHHzJUpED/EbukILJl5ur4qwIBv
 UZzKjykjnRbts5wU8gl1d+aIwIZfC85FELQfuiBmcnDtFwlFAPJjH7lNrRcNxJX1uuYTCNmSbfW
 XNUaFNO04CrcHktZtL23n72ahKMRNWaQya3mCWOiqyoy3DccgAmwuGP7ijc6UeM3RkyEJmgCzvZ
 Goj5U4IT1tnOHR+zJ3NX1RIR6ipLKRu0DPrLEGSV7fCYTt3UHj3IcCmXBfbpUksZqnC7G7PMQmx
 myhJyRCkFLFx9Ia1AFWlpDxG+y6k2jhZZI4xiXuSDvr6hhMj6NOjiV7Jta7O6cg3eK/PciLL
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830320e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pcGS-iR_AO2RkNitFtoA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 61TR8JJ3haxkgrfZWTODWX3WdcQufqrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230077
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

On Fri, May 23, 2025 at 10:02:03AM +0300, Abel Vesa wrote:
> On 25-05-23 09:55:00, Abel Vesa wrote:
> > On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > > differences and new implementations of setup_alpha_out(),
> > > setup_border_color() and setup_blend_config().
> > > 
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > 
> > > ---
> > > 
> > > Changes in v4:
> > > 1. Lowercase hex, use spaces for define indentation
> > > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > > 
> > > Changes in v3:
> > > 1. New patch, split from previous big DPU v12.0.
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> > >  2 files changed, 94 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> > >  }
> > >  
> > >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > > +				      struct dpu_plane_state *pstate,
> > > +				      const struct msm_format *format,
> > > +				      const struct dpu_mdss_version *mdss_ver)
> > >  {
> > >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> > >  	uint32_t blend_op;
> > > -	uint32_t fg_alpha, bg_alpha;
> > > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> > >  
> > >  	fg_alpha = pstate->base.alpha >> 8;
> > 
> > For the 10-bit alpha, you need to shift here by 5 instead of 8.
> 
> Typo. "6 instead of 8".

Granted there would be a next iteration of this patch, I'd suggest to
modify _dpu_crtc_setup_blend_cfg() to always use 16-bit values and pass
them down to LM's setup_blend_config() callback. Then LM can perform
version-specific shifts, utilizing either 8 bits or 10 bits of alpha
channel values.

-- 
With best wishes
Dmitry
