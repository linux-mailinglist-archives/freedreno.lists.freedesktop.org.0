Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FB18C017
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 20:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02F16E02D;
	Thu, 19 Mar 2020 19:08:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891246E02D
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 19:08:54 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id u68so1926906pfb.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 12:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zlKmJ2002BFVX2ZXxYBAvMXUqHfOUCBNDSCbpquzDD4=;
 b=snEHPqIWVHGADR5tx1NSp9UdpaVA8/qSH0Y5/qNyPUv+rOJjSnBcUlIRiOvg5qGYfL
 Q0tqqT+WC6ncGdFoDlIF7JUnLpTq+8HNiQrPwREwNfEW6ccu1EfFnJGPPdC4QyPRIIkp
 5RU3tBCF0kyWrOjXuVq9gYlrQdYaJJZ4/ZC7Z9KyzK+xElRq3r8I5gDp8n+sQZ+0W38g
 9DxL/vlgYcKiUR6T9xbGsce4Mt/ky+5U1OQKf6naER91G1OxbNLCCOJZYSISWKf15TgW
 FvD6EyKTUeYndw15/zS7RolG/uv7r0CmrelG4NlIXeVSxIqx02wVEeSlC9EqCUFmWboR
 k5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zlKmJ2002BFVX2ZXxYBAvMXUqHfOUCBNDSCbpquzDD4=;
 b=J/7iP8S5LKBBw3hW6qIe54ZL0J81Hrfy6QHGK8KaPu7qv8bKviCp9hGxg1dI35rrA2
 8VqXRVYmQQmml0a3Khp2tHnYeeIvHBlvnX4IgqZ2IzDfYHg5OFjxHPPu+qtHuG2CPGUE
 Q3l9/yj3mVlmxOVBMSSvYnkRXQ7fo1ssBzHjNoZxKCVLXgnMleow7g+q+UQVSsNKcnG4
 TY9lFmDWRa49W++rTZBYtAQsfmfWq6ivE8dKy1OFSd/V/ct0wIvZxaX+KKyK+l4xQw+g
 gSpi2e1Z+3BqqOq/RBIZYW9MhgeRidO8iNc3ONKKTO4fOpA7s7iXyMSXlaABlFbrBzmU
 IVdw==
X-Gm-Message-State: ANhLgQ02HxQ2qDsn28jNUUS2f7GQWl4PHETnhEHQMWgLurnqok1gl2P5
 Z0D0/uT0sw4khD5TqxWo4LGioQ==
X-Google-Smtp-Source: ADFU+vvbguubW7E6FOD/bR6UAFbsfiXhbysyZNZA0X02MHIz8KIBZKkLDrSYMWTpjPPb3cT9rshHyA==
X-Received: by 2002:a62:b604:: with SMTP id j4mr5635879pff.93.1584644933964;
 Thu, 19 Mar 2020 12:08:53 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f8sm3151821pfn.2.2020.03.19.12.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 12:08:53 -0700 (PDT)
Date: Thu, 19 Mar 2020 12:08:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200319190851.GB458947@yoga>
References: <20200319043741.3338842-1-bjorn.andersson@linaro.org>
 <CAF6AEGtvSZOp48hyrBUzqQLV6+twtuy6k6MLimz6fhC-dqWEVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtvSZOp48hyrBUzqQLV6+twtuy6k6MLimz6fhC-dqWEVA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Don't attempt to attach HDMI
 bridge twice
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu 19 Mar 11:19 PDT 2020, Rob Clark wrote:

> On Wed, Mar 18, 2020 at 9:39 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > With the introduction of '3ef2f119bd3e ("drm/msm: Use
> > drm_attach_bridge() to attach a bridge to an encoder")' the HDMI bridge
> > is attached both in msm_hdmi_bridge_init() and later in
> > msm_hdmi_modeset_init().
> >
> > The second attempt fails as the bridge is already attached to the
> > encoder and the whole process is aborted.
> >
> > So instead make msm_hdmi_bridge_init() just initialize the hdmi_bridge
> > object and let msm_hdmi_modeset_init() attach it later.
> >
> > Fixes: 3ef2f119bd3e ("drm/msm: Use drm_attach_bridge() to attach a bridge to an encoder")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Thanks, I think this should also be solved by:
> 
> https://patchwork.freedesktop.org/patch/357331/?series=74611&rev=1

Yes, didn't find that when looking yesterday. T-b and R-b.

Thanks,
Bjorn

> 
> BR,
> -R
> 
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 19 +++----------------
> >  1 file changed, 3 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 6e380db9287b..0e103ee1b730 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -271,31 +271,18 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
> >  /* initialize bridge */
> >  struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
> >  {
> > -       struct drm_bridge *bridge = NULL;
> >         struct hdmi_bridge *hdmi_bridge;
> > -       int ret;
> > +       struct drm_bridge *bridge;
> >
> >         hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
> >                         sizeof(*hdmi_bridge), GFP_KERNEL);
> > -       if (!hdmi_bridge) {
> > -               ret = -ENOMEM;
> > -               goto fail;
> > -       }
> > +       if (!hdmi_bridge)
> > +               return ERR_PTR(-ENOMEM);
> >
> >         hdmi_bridge->hdmi = hdmi;
> >
> >         bridge = &hdmi_bridge->base;
> >         bridge->funcs = &msm_hdmi_bridge_funcs;
> >
> > -       ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 0);
> > -       if (ret)
> > -               goto fail;
> > -
> >         return bridge;
> > -
> > -fail:
> > -       if (bridge)
> > -               msm_hdmi_bridge_destroy(bridge);
> > -
> > -       return ERR_PTR(ret);
> >  }
> > --
> > 2.24.0
> >
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
