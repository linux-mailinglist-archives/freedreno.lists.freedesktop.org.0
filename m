Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2207183FCAC
	for <lists+freedreno@lfdr.de>; Mon, 29 Jan 2024 04:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F499112186;
	Mon, 29 Jan 2024 03:24:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DE0112199
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 03:24:55 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-db3a09e96daso1780669276.3
 for <freedreno@lists.freedesktop.org>; Sun, 28 Jan 2024 19:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706498634; x=1707103434; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tRDEhCQbLKSx1e9jKW9m9uVml+QfUWWHZsQITGtv9yw=;
 b=kQfFPZj1nEfMsHwKHllrSs4Q6cSnR6+KLYhCaHkQG+U+SdmBUVNYS+ywHlFmeZbvgn
 BB9yEbKtD8Ox6T4OkahlXHqiOFFweU0ESO43uSp0TKDgBhvfdQY3HuWCognz0cMoAQNj
 2Ep8WHHQunCBiwv7lXboYjG9BgSyzDYg2m8idnwt+CVGo5lwIlN++TsscDTjbPUxsUzO
 vVpHozWUnBFOGTGzS63rqr4U2FErqZWcZe61AKMdSieQBPbEm+l6PJBi5+TUsxHEsoZB
 kIjlgKXm6eQuGJzZrglFQSYpWmWbnMVgRWUhvhN8TWC89cQUW+xrHq4oHvPgQoUzGWwK
 pCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706498634; x=1707103434;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tRDEhCQbLKSx1e9jKW9m9uVml+QfUWWHZsQITGtv9yw=;
 b=bXkoeMUZJjnMPv3BXpG/9zLBf2DFJ0ro/6aUejogi5Xn3SrGB6wJD1xACCfRpizVjn
 gJWRpak796Y5+HKJzlUojAdkiLc72prjohGcG+lm9W/y26n3tn8Oi2FVa539L5xg2O3+
 fT1UxtHjusVa3QKz17zDttZJy+dOpWA0Os898zu+qNY8wLMURSMgQSxJbr4cxbRBPct6
 HYGyHC0MDt3dxQjfvAayDy1vL7IVzZPOzKidLH+druBOUV7XzY4fu1iB9oP0B6IfKtrn
 5HR+KPwPkVHUnr5At3rF/ZCCVxaM2jMMbDlOzpxkSwTG4MzcfY6Q7j18/5G0qP6GVgMu
 74+Q==
X-Gm-Message-State: AOJu0YwGoXBZrucuWG138tzqzCoE9u6deUm0vnuyrmzq/ZjmYLzATZxV
 XXK6e1ui+nweNDrdqFUuAFJmuye+vGEa7SUkSvRgnhRY1H6CdOPm8rrAV7Aop5cI3zW9IzpFhgc
 oTIrDnrD6VAQe9nEsFFlcsKjhYjYGewr9W3j6mQ==
X-Google-Smtp-Source: AGHT+IF6zf1MsRwbD0c4lc43Au1jqd7ti2kqyqPXjj17xYWf7PNvSF4YZlRUSOnnYCBBGASumEomlSX+ZGxbweNusGY=
X-Received: by 2002:a25:7489:0:b0:dc2:218b:7d71 with SMTP id
 p131-20020a257489000000b00dc2218b7d71mr1883839ybc.103.1706498634327; Sun, 28
 Jan 2024 19:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-2-quic_parellan@quicinc.com>
 <31e4a033-1779-450c-980e-63c8567837ed@linaro.org>
 <fa5ce695-8c00-1ae4-04cd-d1b49b42c5d6@quicinc.com>
 <5d0b2da2-7683-f801-0acf-255a8c2bd618@quicinc.com>
In-Reply-To: <5d0b2da2-7683-f801-0acf-255a8c2bd618@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 05:23:43 +0200
Message-ID: <CAA8EJpoTtzupauFah=65Yn_cRQzDbgpLw-6GuXWCUwPcNJvKOA@mail.gmail.com>
Subject: Re: [PATCH 01/17] drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm
 to work for DP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, robdclark@gmail.com, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, Paloma Arellano <quic_parellan@quicinc.com>,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 05:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/26/2024 4:39 PM, Paloma Arellano wrote:
> >
> > On 1/25/2024 1:14 PM, Dmitry Baryshkov wrote:
> >> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>> Generalize dpu_encoder_helper_phys_setup_cdm to be compatible with DP.
> >>>
> >>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>> ---
> >>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
> >>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 31 ++++++++++---------
> >>>   2 files changed, 18 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>> index 993f263433314..37ac385727c3b 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> >>> @@ -153,6 +153,7 @@ enum dpu_intr_idx {
> >>>    * @hw_intf:        Hardware interface to the intf registers
> >>>    * @hw_wb:        Hardware interface to the wb registers
> >>>    * @hw_cdm:        Hardware interface to the CDM registers
> >>> + * @cdm_cfg:    CDM block config needed to store WB/DP block's CDM
> >>> configuration
> >>
> >> Please realign the description.
> > Ack
> >>
> >>>    * @dpu_kms:        Pointer to the dpu_kms top level
> >>>    * @cached_mode:    DRM mode cached at mode_set time, acted on in
> >>> enable
> >>>    * @vblank_ctl_lock:    Vblank ctl mutex lock to protect
> >>> vblank_refcount
> >>> @@ -183,6 +184,7 @@ struct dpu_encoder_phys {
> >>>       struct dpu_hw_intf *hw_intf;
> >>>       struct dpu_hw_wb *hw_wb;
> >>>       struct dpu_hw_cdm *hw_cdm;
> >>> +    struct dpu_hw_cdm_cfg cdm_cfg;
> >>
> >> It might be slightly better to move it after all the pointers, so
> >> after the dpu_kms.
> > Ack
> >>
> >>>       struct dpu_kms *dpu_kms;
> >>>       struct drm_display_mode cached_mode;
> >>>       struct mutex vblank_ctl_lock;
> >>> @@ -213,7 +215,6 @@ static inline int
> >>> dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> >>>    * @wbirq_refcount:     Reference count of writeback interrupt
> >>>    * @wb_done_timeout_cnt: number of wb done irq timeout errors
> >>>    * @wb_cfg:  writeback block config to store fb related details
> >>> - * @cdm_cfg: cdm block config needed to store writeback block's CDM
> >>> configuration
> >>>    * @wb_conn: backpointer to writeback connector
> >>>    * @wb_job: backpointer to current writeback job
> >>>    * @dest:   dpu buffer layout for current writeback output buffer
> >>> @@ -223,7 +224,6 @@ struct dpu_encoder_phys_wb {
> >>>       atomic_t wbirq_refcount;
> >>>       int wb_done_timeout_cnt;
> >>>       struct dpu_hw_wb_cfg wb_cfg;
> >>> -    struct dpu_hw_cdm_cfg cdm_cfg;
> >>>       struct drm_writeback_connector *wb_conn;
> >>>       struct drm_writeback_job *wb_job;
> >>>       struct dpu_hw_fmt_layout dest;
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>> index 4cd2d9e3131a4..072fc6950e496 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> >>> @@ -269,28 +269,21 @@ static void
> >>> dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
> >>>    *                                     This API does not handle
> >>> DPU_CHROMA_H1V2.
> >>>    * @phys_enc:Pointer to physical encoder
> >>>    */
> >>> -static void dpu_encoder_helper_phys_setup_cdm(struct
> >>> dpu_encoder_phys *phys_enc)
> >>> +static void dpu_encoder_helper_phys_setup_cdm(struct
> >>> dpu_encoder_phys *phys_enc,
> >>> +                          const struct dpu_format *dpu_fmt,
> >>> +                          u32 output_type)
> >>>   {
> >>>       struct dpu_hw_cdm *hw_cdm;
> >>>       struct dpu_hw_cdm_cfg *cdm_cfg;
> >>>       struct dpu_hw_pingpong *hw_pp;
> >>> -    struct dpu_encoder_phys_wb *wb_enc;
> >>> -    const struct msm_format *format;
> >>> -    const struct dpu_format *dpu_fmt;
> >>> -    struct drm_writeback_job *wb_job;
> >>>       int ret;
> >>>         if (!phys_enc)
> >>>           return;
> >>>   -    wb_enc = to_dpu_encoder_phys_wb(phys_enc);
> >>> -    cdm_cfg = &wb_enc->cdm_cfg;
> >>> +    cdm_cfg = &phys_enc->cdm_cfg;
> >>>       hw_pp = phys_enc->hw_pp;
> >>>       hw_cdm = phys_enc->hw_cdm;
> >>> -    wb_job = wb_enc->wb_job;
> >>> -
> >>> -    format = msm_framebuffer_format(wb_enc->wb_job->fb);
> >>> -    dpu_fmt = dpu_get_dpu_format_ext(format->pixel_format,
> >>> wb_job->fb->modifier);
> >>>         if (!hw_cdm)
> >>>           return;
> >>> @@ -306,10 +299,10 @@ static void
> >>> dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
> >>>         memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
> >>>   -    cdm_cfg->output_width = wb_job->fb->width;
> >>> -    cdm_cfg->output_height = wb_job->fb->height;
> >>> +    cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
> >>> +    cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
> >>
> >> This is a semantic change. Instead of passing the FB size, this passes
> >> the mode dimensions. They are not guaranteed to be the same,
> >> especially for the WB case.
> >>
>
> The WB job is storing the output FB of WB. I cannot think of a use-case
> where this cannot match the current mode programmed to the WB encoder.
>
> Yes, if it was the drm_plane's FB, then it cannot be guaranteed as the
> plane can scale the contents but here thats not the case. Here its the
> output FB of WB.

Is it a part of WB uAPI, to have the FB dimensions equal to mode
dimensions? Or is it just our current limitation? I can easily imagine
WB outputting data to a part of the FB (just like we can clip FB using
plane's clip rectangle).

This boils down to a question, whether CDM should be setup in terms of
actual output date or the physical memory buffer parameters. I suspect
the former is the case (which makes this change correct). But it
either should be described in the commit message or (even better)
split to a separate commit.


-- 
With best wishes
Dmitry
