Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B277D13F3
	for <lists+freedreno@lfdr.de>; Fri, 20 Oct 2023 18:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0CE10E5D3;
	Fri, 20 Oct 2023 16:26:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21A210E5D8
 for <freedreno@lists.freedesktop.org>; Fri, 20 Oct 2023 16:26:43 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5a7b3d33663so11556707b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 20 Oct 2023 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819203; x=1698424003; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=laCUhecyJPMse9WCZXFmWhJICCZVXR+jQqS99SOAngQ=;
 b=AM9MxFqpo7CNYcWNwKy1UpTdNGhK7n4eFFshSP5qLMkTbNTTJYGg+Z50BClInBWyM+
 +YJ/i+mVpliWgjV9ZnJRAkGIQmAHoadm7lmg4UPSD0OISl+yi8KOEibLtrPGyoPPuDPR
 Co3gYt+SUhRv6DqLTXKGTSz2ohb7WD+ieH7nCowX8EzbpC5ZuL+7RUNNkQ+8hNxT0iEI
 s1epvWigCZ7xdgAiacVV7PiFf8/1iSdsxPWJKf/csbQ1uUhWhGCHqruU4SHvOu819zzu
 j43AawcKPqd8TRti2XC+Bl1hMRYhWAdyvF5gqpzJqa4pU2GSm9YNuYUCBi9cPqZPHDJh
 qckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819203; x=1698424003;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=laCUhecyJPMse9WCZXFmWhJICCZVXR+jQqS99SOAngQ=;
 b=qiZn87qgAAcEw/EpFuAKAfLkdtnXTgSXwOWLV+p1I8ejHtwdBw00VB44dZYjMqkAWE
 CnmhN1NnG53gznmlQ370LOPmZcRJQyqRgNYTBUSwuAdikqPlZCW7csvspCJtAo4L4ocy
 2R33jEBYsUB4zVdOGi1uuOhwiTLq4RcpUBUrVO4zFdxz7UtU+qypLyTRNpf6OCy2Euqy
 F1w/PkN3F5Uu/pW7ai9K0xfIaFXTv9qz17vyIiO8aab21ds9AS1WESMGFZNZt5xw8r7W
 1lU8MU/DIeB+sT9vxMK4vJTAYUoDHCv/FSJKP2di8/MIUCsA6pOjg+0e05CAx7kfNUIj
 ammg==
X-Gm-Message-State: AOJu0YyPQu/fYIimja8LowF7wHs42F8dTMg5+zcYXO9VqYJlK2ONly0o
 xvy35yCG2z3j62iuwbWTP5z6ui3lXKq24TE8fx7bVg==
X-Google-Smtp-Source: AGHT+IHlS5lOS1dRyKb32JPUatddf/uU7kGSi+POVALsr0E3HwVcVMoX7GP36MY5ZrltEXBQage+2OuLDlCcdM7+K8s=
X-Received: by 2002:a81:e20a:0:b0:5a8:1844:124d with SMTP id
 p10-20020a81e20a000000b005a81844124dmr2284502ywl.9.1697819203005; Fri, 20 Oct
 2023 09:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
 <883e40de-7d1d-03fb-014f-74db5b6ab406@quicinc.com>
In-Reply-To: <883e40de-7d1d-03fb-014f-74db5b6ab406@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Oct 2023 19:26:31 +0300
Message-ID: <CAA8EJpr8MdtSYyF5Q==TRo60VD2nx9p6vhjb5CJMoGA2NhmEZw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: attach the DP subconnector
 property
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023 at 12:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/18/2023 12:46 AM, Dmitry Baryshkov wrote:
> > While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> > support setting the DP subconnector type") I had the patch [1] in my
> > tree. I haven't noticed that it was a dependency for the commit in
> > question. Mea culpa.
> >
>
> I agree with you that, we should be setting this in the framework is better.
>
> Will review that one on the other patch.
>
> But yes, we need to fix this regression first.
>
> > Since the patch has not landed yet (and even was not reviewed)
> > and since one of the bridges erroneously uses USB connector type instead
> > of DP, attach the property directly from the MSM DP driver.
> >
> > This fixes the following oops on DP HPD event:
> >
> >   drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
> >   dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
> >   dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
> >   hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
> >   kthread (kernel/kthread.c:388)
> >   ret_from_fork (arch/arm64/kernel/entry.S:858)
> >
> > Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Just to note, I'm going to send v2 in the next few days, fixing this
code to also work in eDP.

>
> One question, while reviewing the code, I see you have two calls to
> drm_dp_set_subconnector_property() for the connect and disconnect case.
>
> Why cant we have just one call in dp_display_send_hpd_notification() for
> both cases?

Hmm, I'll have to check.

>
>
> >   drivers/gpu/drm/msm/dp/dp_drm.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 40e7344180e3..e3bdd7dd4cdc 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -345,6 +345,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
> >       if (IS_ERR(connector))
> >               return connector;
> >
> > +     if (!dp_display->is_edp)
> > +             drm_connector_attach_dp_subconnector_property(connector);
> > +
> >       drm_connector_attach_encoder(connector, encoder);
> >
> >       return connector;



-- 
With best wishes
Dmitry
