Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAD35398DC
	for <lists+freedreno@lfdr.de>; Tue, 31 May 2022 23:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E9810E705;
	Tue, 31 May 2022 21:39:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC58310E705
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 21:39:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id f9so79054ejc.0
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZSLV3GBQBnlAV5yFp3A4v28u1Gnmik85ogLelASJBlM=;
 b=G6+2ri/VlQ8yFwFXj74MfREI3aG4EAj3Tv4RTyXriFCkuNZgqqsE6YEb+RI1MiiG6u
 jUrvLmn+pmyEOMkFGPDQlwvGDysPypwMJAL+4flzyKzCAEFIQRRucXeADWRCWhYR2I6f
 ciei005AA9QQiQXNIDi8ojvPdlBRv+7S4gA7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZSLV3GBQBnlAV5yFp3A4v28u1Gnmik85ogLelASJBlM=;
 b=ACP50sRNc098Cwi4upD2KgpmssauqvKO5vUIr1ePu0eE9+eqfKeQ3JQjXFclBOc0y8
 tiZFcGu7IBq0dvLz561lCVza9sTQN9BaYG3Qh+Sk1wSh3OgpJWflavBDsvtkEnJV7BMm
 Vb6ZIrZ8rBhiY35posOVjQNDQtfN8o8Fu9oJXoFQb99fXzgisM1RhPLK5jnJGWGcZCjJ
 oCSpHUKL919l1X3tu8Gm/RPNbOTyUSqhgdZYd0LtwUZSIdtVDxJSS/FK5xMrdZkcq0ni
 ZdugDMDDNliB2jyDlqmGo8qROZkfVkvhgNnUkSNO+kYeRFcPWGupj6cLpd01bmeHjfd0
 pp8g==
X-Gm-Message-State: AOAM532zS171QxPQKCID6wk++MgnpIazoGE9Pqm6flIwtIKP/xk6YwE+
 UoqdxtADT/4FJ8TCXzffpNWppw5WccXYLIqL
X-Google-Smtp-Source: ABdhPJzhoPWRlcJ0BuCOEaY3fNVV9OazZi7QbR9X7Py+Qr23/V3WRkl8XPrmDCM/j9mBJDdwUSDlUg==
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id
 g8-20020a1709065d0800b006ff08eddb63mr31627509ejt.408.1654033152005; 
 Tue, 31 May 2022 14:39:12 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 x12-20020a50d60c000000b0042bced44061sm8920370edi.10.2022.05.31.14.39.07
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 14:39:09 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id u3so20322935wrg.3
 for <freedreno@lists.freedesktop.org>; Tue, 31 May 2022 14:39:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr41857017wry.513.1654033146812; Tue, 31
 May 2022 14:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220531072757.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
 <1ce24f74-3c9e-60ed-46ad-3ba714fb7c61@quicinc.com>
In-Reply-To: <1ce24f74-3c9e-60ed-46ad-3ba714fb7c61@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 May 2022 14:38:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WP9-W-_rQMNbCb6JYrz9FT3wG1J1irwMZB_0ug4-jK9Q@mail.gmail.com>
Message-ID: <CAD=FV=WP9-W-_rQMNbCb6JYrz9FT3wG1J1irwMZB_0ug4-jK9Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Move min BW request and full
 BW disable back to mdss
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, May 31, 2022 at 2:29 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> > @@ -136,6 +178,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >   {
> >       int ret;
> >
> > +     /*
> > +      * Several components have AXI clocks that can only be turned on if
> > +      * the interconnect is enabled (non-zero bandwidth). Let's make sure
> > +      * that the interconnects are at least at a minimum amount.
> > +      */
> > +     msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
> > +
>
> This patch does two things :
>
> 1) Move the min icc vote from the dpu_runtime_resume() path to the
> msm_mdss_enable() so that while resuming, we add the min vote to the
> parent device. We do need a min vote before turning on the AXI clk as
> per this comment mentioned in c33b7c0389e1 (drm/msm/dpu: add support for
> clk and bw scaling for display)
>
>
> @@ -1101,8 +1129,15 @@ static int __maybe_unused
> dpu_runtime_resume(struct device *dev)
>          struct drm_encoder *encoder;
>          struct drm_device *ddev;
>          struct dss_module_power *mp = &dpu_kms->mp;
> +       int i;
>
>          ddev = dpu_kms->dev;
> +
> +       /* Min vote of BW is required before turning on AXI clk */
> +       for (i = 0; i < dpu_kms->num_paths; i++)
> +               icc_set_bw(dpu_kms->path[i], 0,
> +                       dpu_kms->catalog->perf.min_dram_ib);
>
> So I understand and I am fine with this part.
>
> 2) Add a min vote in msm_mdss_init().
>
> This is the part I am not able to fully follow.
>
> If we only need to add the min vote before voting for the clocks, adding
> it in mdss_mdss_enable() should be enough.
>
> Do we need this part of adding the min vote to the msm_mdss_init()?
>
> If so, why?

Ah, good question. Mostly I was matching how things were done before
commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
bandwidth"). Before that commit we used to put the min vote in the
init path.

...but you're right, I don't see any good reason for it. I'll send a
v2 removing that line from msm_mdss_init().

-Doug
