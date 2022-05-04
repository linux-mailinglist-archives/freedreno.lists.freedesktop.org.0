Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9181E51B3A8
	for <lists+freedreno@lfdr.de>; Thu,  5 May 2022 01:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514A10E08F;
	Wed,  4 May 2022 23:43:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2D210E08F
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 23:43:58 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id i27so5703828ejd.9
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 16:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YXeq/XPiJwEkXU3dI75Tl8dYba/oZ3LQ1VjEhaH9Vwg=;
 b=F8ZAHz6WSgNmgenOXICnR5VtLZmMglppgmbrbMqwX6PNKEjGhmfLbTITzRwZBewfUH
 /b5EfJyVCZr6ehKbYwB5lu3juAduuJ9CSsx6et/o9QODUmwNkM5rS8cqpMUwF6jSf0r6
 C//ckdHWg9VL4W9ByKAQIt66nwfQW6b5QZvls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXeq/XPiJwEkXU3dI75Tl8dYba/oZ3LQ1VjEhaH9Vwg=;
 b=aW6T6khdUQMmbJti213+isWWjl0eShrraPMOMb8SUlrHF7MNYhMgqv+ExUpeOaQ5ia
 nrwo9pStXxSyYozaFRDNYJ6Zb1k/J1ToL90/pmN7PQc98LiTCfVS7usrNRGfnaGNm+dm
 ydsi/4LtONLbrvt9qj1pCG0tmcAczteUeQBL7W1953r0kcykEGGtJrYVPfuMh+Rnn0nT
 NBZ+xqlPRDmhXmySwMJoE5463ynbJ2Q7isAhxitMFK29oe5lPXGBh7MUM5ndSC//U9A1
 BEzobYuFepwAAcAbV5JG9JTMwuFTRPuUjbLeSR2qzNMkhz47PyWqim2qiGxNYfK89dts
 kc9w==
X-Gm-Message-State: AOAM531sOUZND16rv0HsAtmzWYSV97ldxscDvHzCEQUY56982BSz0ZGR
 8106TsUmoVYonmLANiURXsAxcd0kTM74BTyQ5+4=
X-Google-Smtp-Source: ABdhPJwxnCkeNDHBsBCw/t6L6PYtFOY5seNmqBBQWzPtNWf6rcf1KfYdQM1e3ll74S2B3X9/rXsPWg==
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id
 s16-20020a1709060c1000b006f46c70b00fmr13510736ejf.660.1651707836893; 
 Wed, 04 May 2022 16:43:56 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 jy2-20020a170907762200b006f3ef214e50sm87905ejc.182.2022.05.04.16.43.56
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 16:43:56 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id g20so3401493edw.6
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 16:43:56 -0700 (PDT)
X-Received: by 2002:a05:6000:c7:b0:20a:d8c1:d044 with SMTP id
 q7-20020a05600000c700b0020ad8c1d044mr18472545wrx.422.1651707485535; Wed, 04
 May 2022 16:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
 <CAA8EJpqfKKELrkRS89ssDU_bP67_sJ06B6VGGSmR_=D4bV-wZg@mail.gmail.com>
In-Reply-To: <CAA8EJpqfKKELrkRS89ssDU_bP67_sJ06B6VGGSmR_=D4bV-wZg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 May 2022 16:37:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEHn6QxhN9c6xaceaXBwre4K0Tvnr-ESd+SOqL9D4ZHw@mail.gmail.com>
Message-ID: <CAD=FV=VEHn6QxhN9c6xaceaXBwre4K0Tvnr-ESd+SOqL9D4ZHw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix shutdown
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
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Xu Wang <vulab@iscas.ac.cn>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 4, 2022 at 4:29 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 5 May 2022 at 01:49, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > When rebooting on my sc7280-herobrine based device, I got a
> > crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
> > "pdev" was the one associated with mdss_probe().
> >
> > From source, I found that mdss_probe() has the line:
> >   platform_set_drvdata(pdev, mdss);
> > ...where "mdss" is of type "struct msm_mdss *".msm_drv_probe
> >
> > Also from source, I saw that in msm_drv_shutdown() we have the line:
> >   struct msm_drm_private *priv = platform_get_drvdata(pdev);
> >
> > This is a mismatch and is the root of the problem.
> >
> > Further digging made it apparent that msm_drv_shutdown() is only
> > supposed to be used for parts of the msm display framework that also
> > call msm_drv_probe() but mdss_probe() doesn't call
> > msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.
> >
> > Digging a little further, code inspection found that two drivers that
> > use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
> > to them.
> >
> > Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
>
> More likely:
> Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")

Oh, I see! The commit I tagged is the one that set the shutdown in
msm_mdss.c, but at the time of that commit it actually _did_ call
msm_drv_probe().

v2 coming right up.

-Doug
