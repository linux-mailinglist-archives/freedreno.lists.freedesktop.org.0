Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 474389F8A27
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 03:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447510EE3B;
	Fri, 20 Dec 2024 02:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P/vOlVGz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4A10EE3E
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 02:40:57 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30227ccf803so17554311fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 18:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734662455; x=1735267255; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jj0/+JoMZ17NUsO/ZKTRoawucSi6dpMQmNWszONhX+A=;
 b=P/vOlVGzV63+n7vcUfWe/dr0K4JRUL7+BDq46kkVDnBaVbNkxWZbH9mySSIm6w8Juc
 ahqn21sT/MUGRynqQBBQOB34jcXoq/P0GttGPPL2QLfW9QvC5LCwOle+DoL9Gn7uRWrP
 U3Pa/V82HdK8IaXvTb9prWkdN33vFrGN3s+5wrhpuPXjZMDkUZ7WD3Q52lugIKWoNCCQ
 vODUAbAntjby4no0lIA5IgZlhnnRqw7uu7U5ioglFGbISKefkDEB8B30z2vtrtWhE5+T
 MXSzTcZ9fmsENr1MIl9zGL4vkXqxtlTJr0hZ+go8oNdQ9W/hyxQirVGEd41MZw3/QP36
 7Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734662455; x=1735267255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jj0/+JoMZ17NUsO/ZKTRoawucSi6dpMQmNWszONhX+A=;
 b=WBNfHLKbMhegwuXfmBIrQqT2Hr4WdH5lA8MBIPpmY5LWQZCCqsimfSVoLTGrgwmcRV
 Js82xUlLJ6Fm10l2Iqvz3EgbdLgnTTm0kh/wcIUtUqBB/F90nY1jncvpMDt4tQHWqa6R
 D4ExPNqzQvcT4xGut03OuzLpnUd2gWoZhmKf2Fiy1T81iSn9epUcw5JEsbsAzOehPtHB
 JDxddK9VAqgi30eT4IZBOETDqg8jbRgIhkfOg39BmDOnrKKY7ABHkM5e+nkbSzzuzEw4
 YQc4WR5AzZ7IK5c489VuxPFP1qRZbOdKmRXCAm+bWCf12zTriOMAkHsOpvU9T/JVac/5
 4c4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsayJhs2RoHjWLLN4obeaXqFqyHyy6tsc/ivSQexeF0cY0vzlTbBR+xX1DWIBYnJlyRLRBOwqYDOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrOgeSfypgXkQjHCov0GgaeS77oR41ehAX34PbW6+HZ7vqgWwA
 8QBmOi4dd1a9O5T2ZbBfSvjH0kBOSx19/0KqxD+bncdaCuzAjBWjKU+L34oAaZ0=
X-Gm-Gg: ASbGncvwFs9tAFQL0f7dQP9QI7ex1qIeg4nBZdFNTt8tdIQoRxvjPOjVyyMeqrev82u
 Q2+x4j+GvnHMsSANAlGpSy8MEYU/UxPXJGr/e3hyxFn4qbFmyGo7MkAUp9JtPW5M6aZweNHcZs2
 oUxylFW69QlCJsmX+uaxg9AaACf+9DxMle2EOxU4qqYK9j2mhUdAsXpVSe+AjMyOf9GOYoAOBNb
 ZffEX/YIqY61IJgyMMz8ROWwrBfgihQarS/DtkaiwmM3Gf5pzCk4tnAubj2vHRcRbm9aSG1emjq
 ZyVWi5B0Q3OKUBNnrYUkbZYnphle41Nqx8sp
X-Google-Smtp-Source: AGHT+IEUtxddJ0Qtp8K+sqBvLg335FfoFSz3yowbgMd4Sr4LEg51Aq8dj7zo+GJF7reCRmcWomU+lg==
X-Received: by 2002:a2e:b8c5:0:b0:300:31db:a782 with SMTP id
 38308e7fff4ca-30468517676mr3478791fa.6.1734662455551; 
 Thu, 19 Dec 2024 18:40:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adac5bbsm4064911fa.53.2024.12.19.18.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:40:54 -0800 (PST)
Date: Fri, 20 Dec 2024 04:40:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 08/25] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Message-ID: <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
 <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
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

On Mon, Dec 16, 2024 at 05:39:15PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> > from dpu_crtc_assign_resources().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [quic_abhinavk@quicinc.com: cleaned up formatting]
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 29 +++++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
> >   2 files changed, 31 insertions(+), 2 deletions(-)
> > 
> 
> <snip>
> 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 2b999a0558b2a016644ed5d25bf54ab45c38d1d9..a895d48fe81ccc71d265e089992786e8b6268b1b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1138,7 +1138,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > -	int num_ctl, num_pp, num_dsc;
> > +	int num_pp, num_dsc, num_ctl;
> >   	unsigned int dsc_mask = 0;
> >   	int i;
> > @@ -1166,7 +1166,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> >   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> >   		ARRAY_SIZE(hw_pp));
> >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > 
> 
> This chunk of diff is unnecessary. You are just changing the order of
> defines and fixing alignment. Does not have to be in this change.

I can drop it while applying.

-- 
With best wishes
Dmitry
