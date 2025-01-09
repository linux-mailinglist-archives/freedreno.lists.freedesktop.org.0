Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1087A07569
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 13:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF67C10ED81;
	Thu,  9 Jan 2025 12:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kXzE5ygT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CA410ED81
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 12:13:51 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so915187e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 04:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424770; x=1737029570; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KdeRkbfFs33TxRcMnl/YLeLF47rmay+guENZ9SOKZfo=;
 b=kXzE5ygTktZ/qcx4+J5UeN9H9gMd3kXHQjVpDUeAxEUYsc960HzEBohaKj614lc+xd
 X3NaafL/T8kYUI3s4KImvqzxptDEBxy+yeMqYDT/SrSAqWUeCEf7IbcHB+UntmNNlxsX
 Hga7vdGDkxDomtDG34hRJwNeVupUya0gvyfkaOemCB7ayhvwlUTPUHkTheBcX8wUcDA1
 gVyCQLcPttNFKgtdsRJPzOPiBBf3DDTlwxAOAChYG8qmPlBNY6UGyogYijjcloToEmUl
 iqNwtr6scIG32AlLczidcXdfYB0eC5ld0m91dSB/635HUYvaTo26O7J17C8o1jmwU/jE
 l2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424770; x=1737029570;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KdeRkbfFs33TxRcMnl/YLeLF47rmay+guENZ9SOKZfo=;
 b=MeE9Wk95AET/ldY6Bg3DYCAq8yjjtm9ItNVsycBW7P/nIq9m4Lz2Gc1FrJq8VTq2Jb
 EHL22l7XxnXnmDqlNFmpKl//fsvdRVix8+KLHQJQAhbcu174r8evyiuO1dR7FtV7jIyj
 i2xJc2KamD5wsxyMuNVdLGSERbG3pOSKZkC/SB2DO8qacTbj0mycPjVPRGn6rumpVL3V
 JX5+3ZqN2ZtUxQSnbMpoykpHeN7ZAM8AwGCIk+Ck6qBE6ewGlR1EbfkH9TmoysXhfVG4
 QfWKwE42vsY5friaCgnhKUlKjiZpvc0zcPL44K5WXUDtbZ4MobNcjY5/YYq3jOJALzf+
 qYxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxPgRnVirBJ4k8duDaLlnMA0kcLRAlQptSyXSA3ksaMnQeOEdOZqJxvyM5xcme3UbSd6pGmslklr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/BiAaACaNr6vpWJRx6WzXG1ji8jJKGkSYLQlNxZYwH1JZ/FxZ
 A46LDssYWuPhR7WZTz5ID5CA2w06Q/JVOq9rwRS+1H3+IpTuxfiPfTYFrKXlEyk=
X-Gm-Gg: ASbGncsPz6eHHvSwraY7hsoilP1Qb46wondifD0razbTfGm8dugCG7nz7pyi60aC22m
 KJnpn5ERoPcSLshNfGBpitW18tHNT6yPOHipphfm5iUImj/l0grdyk2SC4sd85FoYbcVCQSrwVK
 jq38azzy4ittaK7Gvv44DFj3L/Bx/OXZIjUiXFCXoeoCEowSLfpFwVMYjvsZ7S+J80vC1bvOWAK
 Hsqh73O4v4uIG9auRRKMfQjevoHcbizGduX+qX4kHQzyXq1gSAoTcpof5a1aRA+BAKXrJRo4CHN
 5QbACIjcfV4HUYFoOqaI+aam1lF8yPCgFARB
X-Google-Smtp-Source: AGHT+IGcLOACthHe0DypjNG0/hG6RbfroIonsbZtEI6aQmGGUITF0LHYrpPPJqro3Chg+GyOAZCpfQ==
X-Received: by 2002:a05:6512:15a3:b0:542:2f5a:5f52 with SMTP id
 2adb3069b0e04-542845b9037mr1567997e87.13.1736424770156; 
 Thu, 09 Jan 2025 04:12:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49dfesm176082e87.39.2025.01.09.04.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:12:48 -0800 (PST)
Date: Thu, 9 Jan 2025 14:12:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Message-ID: <ncbiyesfrhm5723ydrdkdkwbji2yq7dgtzqx5y74c6iqfvws5s@elaxa5ysjmbo>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
 <91dff265-5e13-45db-b46d-0eef4a95f5f6@quicinc.com>
 <a6fa4aa2-d90b-4b5e-92fd-db3912ed248a@quicinc.com>
 <2i5vun3pabozzqxjnciylahfx7jljtdmowjo625ida44e37djm@2axmuodlaqtk>
 <a0c48f70-2a0f-45b0-b179-91dd544b5b59@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0c48f70-2a0f-45b0-b179-91dd544b5b59@quicinc.com>
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

On Wed, Jan 08, 2025 at 09:22:56PM -0800, Abhinav Kumar wrote:
> 
> 
> On 1/8/2025 8:26 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 08, 2025 at 08:11:27PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 1/8/2025 6:27 PM, Abhinav Kumar wrote:
> > > > 
> > > > 
> > > > On 12/21/2024 9:00 PM, Dmitry Baryshkov wrote:
> > > > > The MSM driver uses drm_atomic_helper_check() which mandates that none
> > > > > of the atomic_check() callbacks toggles crtc_state->mode_changed.
> > > > > Perform corresponding check before calling the drm_atomic_helper_check()
> > > > > function.
> > > > > 
> > > > > Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback
> > > > > in case of YUV output")
> > > > > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > Closes:
> > > > > https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32
> > > > > +++++++++++++++++++++++++----
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26
> > > > > +++++++++++++++++++++++
> > > > >    drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
> > > > >    drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
> > > > >    5 files changed, 77 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > > > @@ -753,6 +753,34 @@ static void
> > > > > dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
> > > > >        cstate->num_mixers = num_lm;
> > > > >    }
> > > > > +/**
> > > > > + * dpu_encoder_virt_check_mode_changed: check if full modeset is
> > > > > required
> > > > > + * @drm_enc:    Pointer to drm encoder structure
> > > > > + * @crtc_state:    Corresponding CRTC state to be checked
> > > > > + * @conn_state: Corresponding Connector's state to be checked
> > > > > + *
> > > > > + * Check if the changes in the object properties demand full mode set.
> > > > > + */
> > > > > +int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
> > > > > +                    struct drm_crtc_state *crtc_state,
> > > > > +                    struct drm_connector_state *conn_state)
> > > > > +{
> > > > > +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> > > > > +    struct msm_display_topology topology;
> > > > > +
> > > > > +    DPU_DEBUG_ENC(dpu_enc, "\n");
> > > > > +
> > > > > +    /* Using mode instead of adjusted_mode as it wasn't computed yet */
> > > > > +    topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode,
> > > > > crtc_state, conn_state);
> > > > > +
> > > > > +    if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
> > > > > +        crtc_state->mode_changed = true;
> > > > > +    else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
> > > > > +        crtc_state->mode_changed = true;
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > 
> > > > How will this work exactly?
> > > > 
> > > > needs_cdm is set in the encoder's atomic_check which is called inside
> > > > drm_atomic_helper_check(). But this function is called before that.
> > > > 
> > > > So needs_cdm will never hit.
> > > > 
> > > 
> > > Sorry, my bad. after change (4) of this series needs_cdm is also populated
> > > within  dpu_encoder_get_topology().
> > > 
> > > To follow up on https://patchwork.freedesktop.org/patch/629231/?series=137975&rev=4#comment_1148651
> > > 
> > > So is the plan for CWB to add a dpu_crtc_check_mode_changed() like
> > > dpu_encoder's and call it?
> > 
> > I think dpu_encoder_virt_check_mode_changed() would transform into the
> > dpu_crtc_check_mode_changed() together with one of the patches that
> > moves resource allocation and refactors topology handling.
> > 
> 
> hmm we need the cur_master for cdm. That will not be accessible in
> dpu_crtc.c so we will end up with a separate dpu_crtc_check_mode_changed()
> for CWB from what I see. We will discuss it further when we re-post CWB.
> 
> But overall, I think we can make CWB work on top of this.
> 
> Hence,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> I do not know how important patch 2 is for this series and I would prefer
> not delaying CWB even more than what it already has been.
> 
> If we cannot reach a conclusion on patch 2, can you break that one out of
> this series so that the rest of it is ready to land?

Yes, there is no dependency between patches 1-2 and 3-6.

> 
> > > 
> > > 
> > > > 
> > > > > +
> > > > >    static int dpu_encoder_virt_atomic_check(
> > > > >            struct drm_encoder *drm_enc,
> > > > >            struct drm_crtc_state *crtc_state,
> > 

-- 
With best wishes
Dmitry
