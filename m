Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51380934493
	for <lists+freedreno@lfdr.de>; Thu, 18 Jul 2024 00:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8AC10E46A;
	Wed, 17 Jul 2024 22:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EaicEHiS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9B610E46C
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jul 2024 22:09:17 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-651da7c1531so1214037b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jul 2024 15:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721254156; x=1721858956; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bsVDKWypgLDT5YDLNjnV8mTYT3kKNXub5wdl2QEBMpM=;
 b=EaicEHiSZcutKSMLBc+/rTd/dBOrMCIFBUYlmpo1WbuF840lfA+mIxUWNg5l+lvk7C
 xgO3Oo+SQyEJ/YokcUGaRiVY9RWpSueMq+o95rtQIcH1jKAuQXTw2qUxty03B2kTdwSX
 B94p9WDXTEMqagvYRksmdkX167MzCbxdsmt+8VfNS79NWPyIZlPwj/N4C3Dkt27oyzbe
 /815qBfTqPBsX84NJloXm23aMe9fcL2HwUVMMdSfNcuI0YpejTvaA051OfpCSmA+MpcP
 r4TvChps3ml2tl2k6gOHqAlJ0FNFlP6Y9iqWXcXmJuvpve8KmoY4l6S7oT/maREdjiA+
 sEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721254156; x=1721858956;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bsVDKWypgLDT5YDLNjnV8mTYT3kKNXub5wdl2QEBMpM=;
 b=hlkmzmk8lXRQkSFjDGQoMkxB2WrLAO3fEJRI+n9LMtSR9etwG6a4s/wvPsxAGu5RQu
 39Fg6gm8MiuJy0E8Z43vE/C9+dgMoDrJ7grbWDgrghCtx7qS5gp3kZQXRrarnR7oA/kZ
 n6a9K2LQDtGrEAQX57dvha4D5qpszJH9A3kZ9Bq6LkS+pL4+cfeYA9gTpFqH0pN5pp76
 gK1sCVHYqfWOpR5eQE9hW+USYJwUbA8e6Y4Zg4F4we/BASLCf5It+3BhyjLn7DEKIt3N
 VrLblDTfSi8B9b7y4ErqKcmm+VHD0j2noTxJkOHdPBhlUwXjXxH7pdb5tcfhuUnwfQa4
 5lTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYePyb8CV246oRw+UOL17azmapfwY3A1zOqB1wmfDoBxZflefJwXWlfHfsDMC/mxCPDR1lr5Qc4EBpUXy80GTgeXMr3JFDwhPJmSWEq9yq
X-Gm-Message-State: AOJu0Yx/bKnOh55Qx9Zz9um3xFdshwaLjWW/R5kYdt3xuEiXX0RUorwr
 mjcaj4ziqjSK7SxT45hJi+Fml+9fHL7g/SKQ39xj39uWitMzPYqpFpq/LuQaTAEXWDWeZri4/Ns
 Dw33MUZvLpS/vsatE6RjxX3nvQ1149kAEJKhTOA==
X-Google-Smtp-Source: AGHT+IGp53w5JFJXinLfxngAAOC4Se8zd8clOSSE5HSo6ISXAyhqoYmBo0Hc7/CZzmDiE/S24AngXbmiTkF8yavGN3A=
X-Received: by 2002:a05:690c:4d48:b0:65f:7cee:43b with SMTP id
 00721157ae682-664fe071e10mr34429437b3.19.1721254155923; Wed, 17 Jul 2024
 15:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-8-501d984d634f@linaro.org>
 <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
In-Reply-To: <4e19faf3-0fc6-4ef2-abf5-4f9a0579982b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 18 Jul 2024 01:09:04 +0300
Message-ID: <CAA8EJppGC_u-79YyXqXEeQAc9oBUOm-+ZuUDu_3b8MWnVVAOxg@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] drm/msm/dpu: drop msm_format from struct
 dpu_hw_fmt_layout
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 17 Jul 2024 at 23:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> > The struct dpu_hw_fmt_layout defines hardware data layout (addresses,
> > sizes and pitches. Drop format field from this structure as it's not a
> Missing closing brace ")" here?
>
> > part of the data layout.
> >
>
> Its a bit subjective IMO whether you consider format as part of hardware
> data layout or not. Registers do have format bitfields too so I am
> somewhat unsure if this change is really needed.

It's not a part of the data buffer layout (num_planes, sizes, pitches
and offsets) - the items that are defined by struct dpu_hw_fmt_layout.
As such there is no need to store it in the structure. When necessary
we can always get it from the framebuffer itself.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 31 +++++++---------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 23 ++++++++--------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  2 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  4 +--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  3 ++-
> >   5 files changed, 25 insertions(+), 38 deletions(-)
> >
>
> <Snip>
>
> > @@ -318,15 +318,10 @@ static void dpu_encoder_phys_wb_setup(
> >   {
> >       struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
> >       struct drm_display_mode mode = phys_enc->cached_mode;
> > -     struct drm_framebuffer *fb = NULL;
> >       struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> > -     struct drm_writeback_job *wb_job;
> >       const struct msm_format *format;
> > -     const struct msm_format *dpu_fmt;
> >
> > -     wb_job = wb_enc->wb_job;
> >       format = msm_framebuffer_format(wb_enc->wb_job->fb);
> > -     dpu_fmt = mdp_get_format(&phys_enc->dpu_kms->base, format->pixel_format, wb_job->fb->modifier);
> >
>
> This is interesting. I wonder why I just didnt use format directly that
> time itself :)
>
> Maybe I was thinking that mdp_get_format() will also match the modifiers
> and return the corresponding msm_format.
>
> >       DPU_DEBUG("[mode_set:%d, \"%s\",%d,%d]\n",
> >                       hw_wb->idx - WB_0, mode.name,
> > @@ -338,9 +333,9 @@ static void dpu_encoder_phys_wb_setup(
> >
> >       dpu_encoder_phys_wb_set_qos(phys_enc);
> >
> > -     dpu_encoder_phys_wb_setup_fb(phys_enc, fb);
> > +     dpu_encoder_phys_wb_setup_fb(phys_enc, format);
> >
> > -     dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
> > +     dpu_encoder_helper_phys_setup_cdm(phys_enc, format, CDM_CDWN_OUTPUT_WB);
> >
> >       dpu_encoder_phys_wb_setup_ctl(phys_enc);
> >   }
> > @@ -584,14 +579,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
> >
> >       format = msm_framebuffer_format(job->fb);
> >
> > -     wb_cfg->dest.format = mdp_get_format(&phys_enc->dpu_kms->base,
> > -                                          format->pixel_format, job->fb->modifier);
> > -     if (!wb_cfg->dest.format) {
> > -             /* this error should be detected during atomic_check */
> > -             DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
> > -             return;
> > -     }
> > -
> >       ret = dpu_format_populate_layout(aspace, job->fb, &wb_cfg->dest);
> >       if (ret) {
> >               DPU_DEBUG("failed to populate layout %d\n", ret);



-- 
With best wishes
Dmitry
