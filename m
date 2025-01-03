Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A9A00BC3
	for <lists+freedreno@lfdr.de>; Fri,  3 Jan 2025 16:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DFD10E0CB;
	Fri,  3 Jan 2025 15:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NpneZCBI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCD610E0CB
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jan 2025 15:58:19 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-71e1d7130a5so6230630a34.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735919838; x=1736524638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liHK2+uQ/jW5u+iONCOSxqMJFLkEJGJyuYbPMxYCGfM=;
 b=NpneZCBIIbVtDGCGTBQP+hoD94Tp7LpOJd7MccVA0NmMni5LSQX7IazqluFV4HjCa1
 TaQ1BjoPp+NH2wO1DgeocFmFTprb6nHS3hdzqhM6DVIfuZTxzWxBxeDDcfz2LBytC2HP
 qKFhHiVh0kIPo6Ck8jlqhI2OLpd03o47S2WEzHhckp3aw9d+0/PBrCZIFqH7Uy+NrHaJ
 0TxZS30kg23+QHVkCCO2PhxfpDb/kTsCVKTaLgfTWaLWwxS92EDE1O+iE5NKOKyz7QWk
 Ca/VHN1VzKrB4V0VjHmZ2Uf7pPLeMbTV50jsPY12eA8hDOVYIYq1xwj443sKRM6CvqWW
 6grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735919838; x=1736524638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liHK2+uQ/jW5u+iONCOSxqMJFLkEJGJyuYbPMxYCGfM=;
 b=AoXCDL7QjSHXmwzHyIWHitNFEZP5jkSi6OMG0z879t7ciPLeKPVS21lSTUr+pO8oL7
 ScyuQ8ynYLVulN6VPxsgCsLfS8QRwyAnnf8Feal18lM+U+RN2zrwYs7TGIKZ0BnppGWQ
 G9ATCZ5HctATDyQqyMhP20Gp2GIyd0YgBsB+2JnMtgjgjTLnpQVeQ3Hj1HVOo3i/T0Cr
 uUZ+quFBQmBXjf/1POK9feyLgM6wSXHcU149hQSyRxXAAe/L96xtoMf7WMVtpyI4089N
 rjp7SMKpJxvxNeujzDraoZuMJq515uKuy3ml0wvTVgm3q/Qc/+UxbhuNavM4K1O8OaIe
 G+rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXowx2nD3UsS8nS0mUZoDhAlFL3f5E+wXXC1XjPKObeptaULUMsf35km4NWNOzlbv6yoMJdBvBiwLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4dGkdwcRzhvj0YWrRZmfrCqt9ir8zXVvcIhVGPkrNlmHLx7+k
 JKP+VWeJRtyr/ZiN1mhcyuuS4LJ/1g0LNoy8+cYv+9HBJioLia4hz4SZZt1DdHCA+pTjNX1sOdu
 hKHtyH+BHYtWNWWzUNIgEJ81nLgkYdLGlSp5ZNTyD1PnQb0jgo2gvipxk
X-Gm-Gg: ASbGncvydt54bBFCksGQSfOib1xJun9g85TEcQDLIPE9KZS3BCIPPfLveMhbb2eZRKZ
 N9ib0GhSGqysVNtZWMP6OeruF3706y4CbVpol6Cc=
X-Google-Smtp-Source: AGHT+IHP341a3Glhoebec/iBg+1TPClIJwYbMaeZSLdG2H0oSM4QkjKRRdcfeCchDng3ZFDT0KD37a5a4f3XQ+95vR0=
X-Received: by 2002:a05:690c:25c9:b0:6b0:70fc:f6e4 with SMTP id
 00721157ae682-6f3f81253fcmr386260287b3.15.1735919358957; Fri, 03 Jan 2025
 07:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-15-92c7c0a228e3@linaro.org>
 <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
In-Reply-To: <etci547cjykqlqfswhkzdbdfx7cuyrszzswxv2qaghzu2fnu3y@fgitftlhe3oh>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 3 Jan 2025 23:49:07 +0800
Message-ID: <CABymUCNxSKAzNq34evjOdWQy5EmRLg96_S=2O1EUguNFztFgVw@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=BA=94 07:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Dec 19, 2024 at 03:49:33PM +0800, Jun Nie wrote:
> > Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
> > enabled. We prefer to use 4 pipes for dual DSI case for it is power opt=
imal
> > for DSC.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++=
++------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        |  2 +-
> >  7 files changed, 30 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index bad75af4e50ab..3c51c199f3e05 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crt=
c,
> >               struct dpu_crtc_state *crtc_state)
> >  {
> >       struct dpu_crtc_mixer *m;
> > -     u32 crcs[CRTC_DUAL_MIXERS];
> > +     u32 crcs[CRTC_QUAD_MIXERS];
> >
> >       int rc =3D 0;
> >       int i;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index d1bb3f84fe440..ce41fb364f3db 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -210,7 +210,7 @@ struct dpu_crtc_state {
> >
> >       bool bw_control;
> >       bool bw_split_vote;
> > -     struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
> > +     struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
> >
> >       uint64_t input_fence_timeout_ns;
> >
> > @@ -218,10 +218,10 @@ struct dpu_crtc_state {
> >
> >       /* HW Resources reserved for the crtc */
> >       u32 num_mixers;
> > -     struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
> > +     struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
> >
> >       u32 num_ctls;
> > -     struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
> > +     struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
> >
> >       enum dpu_crtc_crc_source crc_source;
> >       int crc_frame_skip_count;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 96d06db3e4be5..6e54ddeaffacd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -54,7 +54,7 @@
> >  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
> >       (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
> >
> > -#define MAX_CHANNELS_PER_ENC 2
> > +#define MAX_CHANNELS_PER_ENC 4
> >
> >  #define IDLE_SHORT_TIMEOUT   1
> >
> > @@ -664,15 +664,19 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >
> >       /* Datapath topology selection
> >        *
> > -      * Dual display
> > +      * Dual display without DSC
> >        * 2 LM, 2 INTF ( Split display using 2 interfaces)
> >        *
> > +      * Dual display with DSC
> > +      * 4 LM, 2 INTF ( Split display using 2 interfaces)
> > +      *
> >        * Single display
> >        * 1 LM, 1 INTF
> >        * 2 LM, 1 INTF (stream merge to support high resolution interfac=
es)
> >        *
> >        * Add dspps to the reservation requirements if ctm is requested
> >        */
> > +
> >       if (intf_count =3D=3D 2)
> >               topology.num_lm =3D 2;
> >       else if (!dpu_kms->catalog->caps->has_3d_merge)
> > @@ -691,10 +695,20 @@ static struct msm_display_topology dpu_encoder_ge=
t_topology(
> >                * 2 DSC encoders, 2 layer mixers and 1 interface
> >                * this is power optimal and can drive up to (including) =
4k
> >                * screens
> > +              * But for dual display case, we prefer 4 layer mixers. B=
ecause
> > +              * the resolution is always high in the case and 4 DSCs a=
re more
> > +              * power optimal.
> >                */
> > -             topology.num_dsc =3D 2;
> > -             topology.num_lm =3D 2;
> > -             topology.num_intf =3D 1;
> > +
> > +             if (intf_count =3D=3D 2) {
> > +                     topology.num_dsc =3D 4;
> > +                     topology.num_lm =3D 4;
> > +                     topology.num_intf =3D 2;
> > +             } else {
> > +                     topology.num_dsc =3D 2;
> > +                     topology.num_lm =3D 2;
> > +                     topology.num_intf =3D 1;
>
> Why is it only enabled for the DSC case? Also I'd like to point out
> platforms like sm7150 or msm8998 which have only 2 DSC blocks. The
> condition here needs more work to work with those platforms too.

Because the DSC + quad-pipe is assumed with wide LCD case that dual
pipe can not handle due to width limitation. If DSC is not involved, the
resolution is not too big to involve DSC together with 2 interfaces. Do you
think there is need to support quad-pipe without DSC?

Of course, it is a valid case to use 2 DSC with 2 interfaces. Below logic s=
hall
be better.

   if (intf_count =3D=3D 2) {
           topology.num_dsc =3D dpu_kms->catalog->dsc_count >=3D 4 ? 4 : 2;
           topology.num_lm =3D topology.num_dsc;
           topology.num_intf =3D 2;
   } else {
           topology.num_dsc =3D 2;
           topology.num_lm =3D 2;
           topology.num_intf =3D 1;
   }

>
> > +             }
> >       }
> >
> >       return topology;
> > @@ -2195,8 +2209,8 @@ static void dpu_encoder_helper_reset_mixers(struc=
t dpu_encoder_phys *phys_enc)
> >       struct dpu_hw_mixer_cfg mixer;
> >       int i, num_lm;
> >       struct dpu_global_state *global_state;
> > -     struct dpu_hw_blk *hw_lm[2];
> > -     struct dpu_hw_mixer *hw_mixer[2];
> > +     struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> > +     struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
> >       struct dpu_hw_ctl *ctl =3D phys_enc->hw_ctl;
> >
> >       memset(&mixer, 0, sizeof(mixer));
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > index 63f09857025c2..d378a990cc0fb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> > @@ -302,7 +302,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_he=
lper_get_3d_blend_mode(
> >
> >       /* Use merge_3d unless DSC MERGE topology is used */
> >       if (phys_enc->split_role =3D=3D ENC_ROLE_SOLO &&
> > -         dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS &&
> > +         (dpu_cstate->num_mixers =3D=3D CRTC_DUAL_MIXERS ||
> > +             dpu_cstate->num_mixers =3D=3D CRTC_QUAD_MIXERS) &&
>
> Misaligned. Also isn't it enough to check that num_mixers !=3D 1?

Yeah, num_mixers !=3D 1 should work.
>
> >           !dpu_encoder_use_dsc_merge(phys_enc->parent))
> >               return BLEND_3D_H_ROW_INT;
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 3ab79092a7f25..d9cc84b081b1f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -25,6 +25,7 @@
> >  #define DPU_MAX_IMG_HEIGHT 0x3fff
> >
> >  #define CRTC_DUAL_MIXERS     2
>
> Do we still need this define?
>
> > +#define CRTC_QUAD_MIXERS     4
> >
> >  #define MAX_XIN_COUNT 16
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 27ef0771da5d2..1fe21087a141a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -33,8 +33,8 @@
> >  #endif
> >
> >  #define STAGES_PER_PLANE             2
> > -#define PIPES_PER_PLANE                      2
> >  #define PIPES_PER_STAGE                      2
> > +#define PIPES_PER_PLANE                      (STAGES_PER_PLANE * STAGE=
S_PER_PLANE)
>
> This is incorrect.
>
> >  #ifndef DPU_MAX_DE_CURVES
> >  #define DPU_MAX_DE_CURVES            3
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 57ccb73c45683..b5c1ad2a75594 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1474,7 +1474,7 @@ static void _dpu_plane_atomic_disable(struct drm_=
plane *plane)
> >               trace_dpu_plane_disable(DRMID(plane), false,
> >                                       pstate->pipe[i].multirect_mode);
> >
> > -             if (pipe->sspp && i =3D=3D 1) {
> > +             if (pipe->sspp && pipe->multirect_index =3D=3D DPU_SSPP_R=
ECT_1) {
>
> Separate change, please. Also I'm not sure how does that work with the
> shared SSPP case that I pointed to in one of the previous replies.

Maybe we can add a peer member in the pipe to reference each other, then we=
 have
chance to use multirect across all pipes in all planes.


>
> >                       pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >                       pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
