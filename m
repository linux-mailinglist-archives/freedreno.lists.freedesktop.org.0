Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9751D4465B5
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 16:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95B96E8C7;
	Fri,  5 Nov 2021 15:29:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFEE6E8C2
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 15:29:38 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id f9so10993036ioo.11
 for <freedreno@lists.freedesktop.org>; Fri, 05 Nov 2021 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/UkXJV0OUTVeSB3ZWIvuOW6MEyDXb/nfPaZn/YUVDEM=;
 b=I+rltgFifRvQNsNZIVeUD++Ek0yxbA4Jl5XK/KgCoQHB3uXJ8aLeXftGBqi9z/1Kuq
 MrjVCYOIOTp1QVbJQjt9kamQzE5JQsSUgT9ZljMvlaMnRakZuA3oNlpOPB30kGsPPok2
 fCU4eyoVqWvjDFsRlugQxg0PBjBNFQMCQoCjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/UkXJV0OUTVeSB3ZWIvuOW6MEyDXb/nfPaZn/YUVDEM=;
 b=O6QyxQS7ckCaqDKuzzccSEtzaPa0HRub79G6wv+rrxIv2t7iqUeQS/a285Wlwqj3s+
 o0FNKc+rDKgfpg8K+Xn9llEmUtxn44Y/ZCZ2xBQckQOGwESy+Xk6FsN4Tbs9OESvlKbW
 qA5LBNH7ei9z19hjmIiMpdI4hRmxTVEgxAxuelVJwx9scnIHboQVFPj9jlsDSDOzUrU+
 63+etNbDSD8FTHS74FCtanOj5uV6UVVuBY8lBUV36vC7K9r4ydE0+3Fz4EHhIJDiOdq9
 YlE/jBk//j/8fC1/bEBiSUNtL8Uv9zCx4iroyuOqarRXBzByfSJUGxIcHCuBBMcwbYVa
 wXvw==
X-Gm-Message-State: AOAM532pfrzvrp9cdBA9dbZN8GOXtmc+qJwNREg6wL+uJd+alt6cW15m
 fK7t4DilEHAKBWGF7S3B/fitqLybosNDrA==
X-Google-Smtp-Source: ABdhPJwJ6Pc4Nd94NKVORwGFsrqi6y5iVDIRCdtvAqAxzxpY1/ab9eEQLoZBgQmOfB8Hyirf2mnhkQ==
X-Received: by 2002:a05:6602:19a:: with SMTP id
 m26mr25059520ioo.162.1636126177394; 
 Fri, 05 Nov 2021 08:29:37 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id j16sm4691204iow.24.2021.11.05.08.29.35
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id f9so10992846ioo.11
 for <freedreno@lists.freedesktop.org>; Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
X-Received: by 2002:a05:6638:c49:: with SMTP id
 g9mr9752326jal.54.1636126175216; 
 Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211104222840.781314-1-robdclark@gmail.com>
 <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
In-Reply-To: <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Nov 2021 08:29:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WnTsdU0TzbbFhRzoYtiX6-HG+g=OHiu1LP+tODPGXZKQ@mail.gmail.com>
Message-ID: <CAD=FV=WnTsdU0TzbbFhRzoYtiX6-HG+g=OHiu1LP+tODPGXZKQ@mail.gmail.com>
To: Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Nov 4, 2021 at 9:32 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 11/4/21 5:28 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Reported-by: Douglas Anderson <dianders@chromium.org>
> > Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index d32b729b4616..9bf8600b6eea 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >       struct msm_gpu *gpu = dev_to_gpu(dev);
> >       struct dev_pm_opp *opp;
> >
> > -     opp = devfreq_recommended_opp(dev, freq, flags);
> > -
> >       /*
> >        * If the GPU is idle, devfreq is not aware, so just ignore
> >        * it's requests
> > @@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >               return 0;
> >       }
> >
> > +     opp = devfreq_recommended_opp(dev, freq, flags);
> > +
> >       if (IS_ERR(opp))
> >               return PTR_ERR(opp);
> >
>
> Testing this here on the Lenovo Yoga C630, and I'm starting to see in my
> dmesg output
>
> [   36.337061] devfreq 5000000.gpu: Couldn't update frequency transition
> information.
> [   36.388122] devfreq 5000000.gpu: Couldn't update frequency transition
> information.

Ah, I think this makes sense. We're now storing a frequency which
might not match an actual "opp" and I suppose that we must return it
in some cases.

I guess a simple fix is to still call devfreq_recommended_opp() in the
idle case but just call dev_pm_opp_put() to fix the leak.

-Doug
