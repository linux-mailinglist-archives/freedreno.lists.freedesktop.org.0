Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7A4B3648
	for <lists+freedreno@lfdr.de>; Sat, 12 Feb 2022 17:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E39010E6F5;
	Sat, 12 Feb 2022 16:16:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F11710E705
 for <freedreno@lists.freedesktop.org>; Sat, 12 Feb 2022 16:16:44 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 200so10854773qki.2
 for <freedreno@lists.freedesktop.org>; Sat, 12 Feb 2022 08:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3eUSYNapb5x0nBAO2PC3SgJkWjN+mXVFDgbj8Nms+A4=;
 b=IbovKgOrNQZ3Y+TY6EwzkRLsveSQoXJQTPKGmLB0k2yGy8Az1EoFUDtWhRxpUNuGUF
 Bi/b0nqzz/FhJ9ofd7eMA0WPGsDDtqWvA3Mcp4ixRwi+Re+NHW4loZ64UBCITo1LGeWM
 eiWitKUKGEu/CqkVMJG254Notpcn1YpTIb9yntNl7VoYoHej75zs7XGnHE1EjC686AG9
 nswBg8dTA4dbkTdaHVxf80xhj557cT+CBE3lhwx+76/7+kpZ0Amve+MpwhXit7CwfjOD
 gbFAMWDz7V8Iw1fjbp7HIPOJNqr1bbGSqvnhpaaKN71bBdZW+fq1VeaqkWH6AVNQ1iKG
 GrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3eUSYNapb5x0nBAO2PC3SgJkWjN+mXVFDgbj8Nms+A4=;
 b=eY+wMR17pekB798NjYBywK1HvuwJ7EHh9lNBrTSI9XbTw2mgXDRICDAjl2oo/mVVQ1
 aqPaHEhrkyC2QkDXl8O4y0dq3M1oOgP6q1uyvojI+x3JxlNqmz8/bpRX5x1lqQDxh5qp
 cLRFdEvvk0pr70a0XTiGVqzI1kvdYfnIAWymrwn0kwCeuXK6/C+SaqPKTXEUcEzhxrPg
 mwJJbCysO4ZcsEQw4JrsAdGzO8hWyiDQLpY81zfjdAacVb8aZ1W14Xb8A7xNv9dyzgcJ
 YV6AzTDGdNjyl2mDHFz5fdHFOyaTo1omcBcNyp7tnJ1T91fdkllZwyPhmG64CHluWqp1
 f4EQ==
X-Gm-Message-State: AOAM533Uyj5L6ueZ1OgqxhgqgKuW9Bue0jqdn3vCEZpk78M/oi2tRNkp
 4MT4QwpRQ98Sw/UUu9GBKGNHbhdP+NN0XAz4g6auoQ==
X-Google-Smtp-Source: ABdhPJy4yNXKHI8Y5Y3irRuI3wCAhqkjdXkRQCIaGRHCH2HEY8Fz/S5Rz+oZlxZmAe/aD0Qa6GrZe3iD2sVhAlU010s=
X-Received: by 2002:a05:620a:75b:: with SMTP id
 i27mr3354494qki.593.1644682603176; 
 Sat, 12 Feb 2022 08:16:43 -0800 (PST)
MIME-Version: 1.0
References: <1644621822-25407-1-git-send-email-quic_khsieh@quicinc.com>
 <d77140f5-73b3-b9a4-aa4b-b240105eb5d4@linaro.org>
 <f86504ba-835a-6e30-6c30-8bb89b1359c4@quicinc.com>
In-Reply-To: <f86504ba-835a-6e30-6c30-8bb89b1359c4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 12 Feb 2022 19:16:32 +0300
Message-ID: <CAA8EJpqd_8VO1ah3HdhYJmFqRDQFquvrm-RfETZ5qjgC2ZU2tQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: populate intf_audio_select() base
 on hardware capability
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
Cc: airlied@linux.ie, freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 12 Feb 2022 at 03:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 2/11/2022 4:08 PM, Dmitry Baryshkov wrote:
> > On 12/02/2022 02:23, Kuogee Hsieh wrote:
> >> intf_audio_select() callback function use to configure
> >> HDMI_DP_CORE_SELECT to decide audio output routes to HDMI or DP
> >> interface. HDMI is obsoleted at newer chipset. To keep supporting
> >> legacy hdmi application, intf_audio_select call back function have
> >> to be populated base on hardware chip capability where legacy
> >> chipsets have has_audio_select flag set to true.
> >
> > So, after thinking more about the patch, I have a bunch of questions:
> >
> > You are enabling this callback only for sdm845 and sm8150.
> >
> > Does this register exist on other (newer) platforms (but just defaults
> > to DP)?
>
> The register itself exists but there is no logic associated with it. Its
> a no-op.

Ack, thanks

>
> >
> > Neither sdm845 nor sm8150 support INTF_HDMI. What's the purpose of the
> > register on these platforms?
>
> Yes we also had a similar thought earlier that this register has meaning
> only on chipsets which have HDMI and DP but our hardware team suggested
> sm8250 and its derivatives should be the cut-off point to stop using
> this register. So we are just following that.

Ack

>
> >
> > Does that mean that we should program the register for HDMI (e.g. on 8998)?
> >
> Yes, we should program this for HDMI 8998 ( although the default value
> of the register is 0 for HDMI ).

ok, so ideally we should add an argument switching between HDMI and DP audio.
This can be done in a separate patch.

>
> > And, as you are touching this piece of code, how do we control audio
> > routing on newer platforms which have several hardware DP interfaces?
> >
> Thats unrelated to this register because on newer chipsets which have
> two DPs there is no HDMI and hence this register remains a no-op.

Yep. I just wondered whether this register would be reused to switch
between DPs.
It doesn't.

>
> But coming to the overall question on multi-DP audio.
>
> This is not a new question. I had first asked about this to Bjorn for
> sc8180x. The current hdmi-codec interface which is used for single DP
> audio will have to be extended to support this to support which stream
> to pass the audio on. This is an open item which was left to be done
> later on because the only chipset which has multi-DP in upstream is
> sc8180x. We dont have that hardware with us for development. When we
> start working on that, we will have to implement what I just mentioned.

The implementation depends on the question whether the SoC can output
several DP audio streams in parallel,
but as the register in question is not used, it's definitely a
separate question.

>
> Thanks
>
> Abhinav
>
> >
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c     | 9 ++++++---
> >>   3 files changed, 9 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> index 272b14b..23680e7 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> >> @@ -201,6 +201,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
> >>       .has_dim_layer = true,
> >>       .has_idle_pc = true,
> >>       .has_3d_merge = true,
> >> +    .has_audio_select = true,
> >>       .max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> >>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >>       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >> @@ -229,6 +230,7 @@ static const struct dpu_caps sm8150_dpu_caps = {
> >>       .has_dim_layer = true,
> >>       .has_idle_pc = true,
> >>       .has_3d_merge = true,
> >> +    .has_audio_select = true,
> >>       .max_linewidth = 4096,
> >>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> >>       .max_hdeci_exp = MAX_HORZ_DECIMATION,
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> index e5a96d6..b33f91b 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> >> @@ -357,6 +357,7 @@ struct dpu_caps {
> >>       bool has_dim_layer;
> >>       bool has_idle_pc;
> >>       bool has_3d_merge;
> >> +    bool has_audio_select;
> >>       /* SSPP limits */
> >>       u32 max_linewidth;
> >>       u32 pixel_ram_size;
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> >> index 282e3c6..e608f4d 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> >> @@ -261,14 +261,17 @@ static void dpu_hw_intf_audio_select(struct
> >> dpu_hw_mdp *mdp)
> >>   }
> >>   static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >> -        unsigned long cap)
> >> +        unsigned long cap,
> >> +        const struct dpu_mdss_cfg *m)
> >>   {
> >>       ops->setup_split_pipe = dpu_hw_setup_split_pipe;
> >>       ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
> >>       ops->get_danger_status = dpu_hw_get_danger_status;
> >>       ops->setup_vsync_source = dpu_hw_setup_vsync_source;
> >>       ops->get_safe_status = dpu_hw_get_safe_status;
> >> -    ops->intf_audio_select = dpu_hw_intf_audio_select;
> >> +
> >> +    if (m->caps->has_audio_select)
> >> +        ops->intf_audio_select = dpu_hw_intf_audio_select;
> >>   }
> >>   static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
> >> @@ -320,7 +323,7 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp
> >> idx,
> >>        */
> >>       mdp->idx = idx;
> >>       mdp->caps = cfg;
> >> -    _setup_mdp_ops(&mdp->ops, mdp->caps->features);
> >> +    _setup_mdp_ops(&mdp->ops, mdp->caps->features, m);
> >>       return mdp;
> >>   }
> >
> >



-- 
With best wishes
Dmitry
