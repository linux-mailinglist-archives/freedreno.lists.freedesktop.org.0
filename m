Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2EC9F8A40
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 03:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BE410EE41;
	Fri, 20 Dec 2024 02:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KDTyvWI9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041E310EE44
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 02:52:50 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso13119401fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 18:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734663168; x=1735267968; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ebM7tOJNXrOcKqbKfZBRf27LYz9fqH9eU/pGhDf6OYI=;
 b=KDTyvWI9Vdr6JrcUCL4CiFioYQ4rEBuH8uAK4h8+Y7kDxAr75qTZzE8ERUjR9Dpm8r
 XEw70n8m6KvOGr6SRu4tNw9hIjv+3cNGP0xnGSo1iF1e0FXbkR8yCohjqSAEX2I6D32f
 GFPa2UcEv5REQkhniZ8lCGRV/KKY8IAn1CBStKc5SyYjDxcifssXHVXFD4ni74+MJEOQ
 50Iv/vEi//D5USzQk/UFx4UnyCgnuWyglUC8Fu8Zau50YrJm7a6IR9qXqn1BNx6BrjN6
 figgDrgyW6IQf47FW5CGxEykx9KjLNGFXl4WEJcNymWwnkqbmc77T7Xg2qqVUA4Y7Jdf
 YDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734663168; x=1735267968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebM7tOJNXrOcKqbKfZBRf27LYz9fqH9eU/pGhDf6OYI=;
 b=Wq/rSr6n2zsWABUh5/50jVb6pEYbpTGoPZA764qzktydxJ1eJlQ1ycb2MsHXGdGeri
 PdHliuJpKgCYsqiXMgCqxZAO9PC+wKAu9lsr9V8d+lW/rWnzJx2MhZpDJFC1inu8/bTO
 hW9ZFsdLHDHX5LUYn7kt68uNo67LUK/mbjamqLJ2ca6JS6cYhHHHvLDemnnYhZ+9U05M
 scYgGGBlgdZ6YzHUV1CxdhI87giewtNC37MqIfYjSqDkkbPRrWtIVr9rfoZvFB3offwC
 msweHTv5JduY4L6l1rPvb27wIczDEIV3A8bi9k42aGW77qlBBjDOZnRxE9ds/B5LrfWW
 nDGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnwkgZCSt1Yi/fxnD835rAiEJ85a4tG8Go9Bj8/dLlVPwXTn/PTnbgvJAkvmYHgZVTzAlSUSp0KZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEHth5pE09WsixcgUHQrvhIwi5eDJJWx4oDQO6woD0970N1X7M
 4S23KaPAntocVxCgHnqL/l8acuekHqO7IO0pIARW6Y+XeKWntwBy8VKFABVUllw=
X-Gm-Gg: ASbGncuJS43WPnwqV3birfUTg8uHiZrnZ+ADCPEsNPbVgsoUEp5r/XpOTnJtaliYSlm
 YNwFmq5vIZLy7z8OaoKSQiVZt7mmKM/jSycCV2T/4tCmphxP/eKU2QNH1jKUNKTzVFjBa3dnXB0
 VACpZrYLsKAoauDG3zRws8+AJE6mzWn05L00Rct1aMQF6XpWP1ia2LMz7gXSEBI5ubAWS5mnAy0
 jkevDkyosO2VPxGn1+B/lwqSPdj2TBYz2ZrsllJTwnatKIQCrtrX+1V0XK+5SI6pFpfX+AlDkJB
 cH0B3PdW5Cb3ol6UI7EBShNkuE4tl2HROBSt
X-Google-Smtp-Source: AGHT+IFzV02MmKGDXd0vt9D85TphrHv4eqZedjbESCKzHnuM85tjxczSguvaGOLKOyaBAMIioabuNQ==
X-Received: by 2002:a2e:b887:0:b0:300:324e:3506 with SMTP id
 38308e7fff4ca-304685462d0mr3804721fa.13.1734663168283; 
 Thu, 19 Dec 2024 18:52:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adad6dcsm3964691fa.60.2024.12.19.18.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 18:52:47 -0800 (PST)
Date: Fri, 20 Dec 2024 04:52:45 +0200
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
Message-ID: <otki3hdn7fo6rico32cxi2jkqollzl2ncl5yhukmrwgthupg5i@z66y3ykeuy3r>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-8-fe220297a7f0@quicinc.com>
 <097a3d10-0992-46a4-8f89-aa54538c9776@quicinc.com>
 <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pqy2qa2ikvadchox3jtrfuimmzeauuxkuyalpelzzfjzsddk3i@htband4aqjxr>
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

On Fri, Dec 20, 2024 at 04:40:52AM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 05:39:15PM -0800, Abhinav Kumar wrote:
> > 
> > 
> > On 12/16/2024 4:43 PM, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
> > > from dpu_crtc_assign_resources().
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > [quic_abhinavk@quicinc.com: cleaned up formatting]
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 29 +++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
> > >   2 files changed, 31 insertions(+), 2 deletions(-)
> > > 
> > 
> > <snip>
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 2b999a0558b2a016644ed5d25bf54ab45c38d1d9..a895d48fe81ccc71d265e089992786e8b6268b1b 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1138,7 +1138,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
> > >   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> > > -	int num_ctl, num_pp, num_dsc;
> > > +	int num_pp, num_dsc, num_ctl;
> > >   	unsigned int dsc_mask = 0;
> > >   	int i;
> > > @@ -1166,7 +1166,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
> > >   		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
> > >   		ARRAY_SIZE(hw_pp));
> > >   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> > > -		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > > +			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
> > >   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> > >   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
> > > 
> > 
> > This chunk of diff is unnecessary. You are just changing the order of
> > defines and fixing alignment. Does not have to be in this change.
> 
> I can drop it while applying.

And with that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
