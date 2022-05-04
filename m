Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA351A2AC
	for <lists+freedreno@lfdr.de>; Wed,  4 May 2022 16:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4210F75D;
	Wed,  4 May 2022 14:54:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD7F10F75D
 for <freedreno@lists.freedesktop.org>; Wed,  4 May 2022 14:54:12 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id t5so1972741edw.11
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3CqMewY2qLhNoVYy8pnABiQEXDBLwdmzuZuCQ9llcqA=;
 b=JIZF4JLztNOcNEo4SWDoc3uVBUY3XVnnSRMHtEmNqfbINrHZhs+RqZgaXWlLYQJKBz
 45bRnisHROq/k5C6gSZLnuw+1KoJTn9/H2tf+974HGCcSzHB5rcmKSJEgIto4cJK9HKy
 8MAoyaI0cOrY6W4KqDLMFN54Jrif7hydeiZrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CqMewY2qLhNoVYy8pnABiQEXDBLwdmzuZuCQ9llcqA=;
 b=2+bx3kDKcEyRuP2Mdo4+4AeogJf8QFVedZJCLp0bxtS4DuC9gNKCzcOyLM0I34Llx0
 X/eOFXx4gipbfzVThrDL+//cwQqLrIM280oqqHTmyXiSwG5jyRS3nbSr8swBwm3tO8Za
 MQBvkNHe0i4eBAijBeXu/YtwjiOyBPsG+B5zO/AUgbitvJejuuCdNsosOBLQIgjno2kP
 mugOFc1IJxRaGvBCQ2nB/pvsQq9RsQIUCwfqCr9zXLWPA3SiNCUuK65ca3UtOe9lItJ9
 B8CHQjo1sNX+qNo35XmDel2pz8UkhGaos4GqeSzITzS3VyHV9WhYLy9wpk7MuuIr7Js/
 hpIA==
X-Gm-Message-State: AOAM533vD0lERaa64BW4skHySw+F10IdveMs1V+fbaaNhrpfLB02u0Sa
 raJKqTpeQsh76pDVksVoONcSFgEkydc8cTmkHPY=
X-Google-Smtp-Source: ABdhPJzSONrhsK04C/NSQ2RtY0Wvi4IdeNgabcdhGf8faWekwKOkpLq844jSNkn97o01jXNUuEf4nA==
X-Received: by 2002:a05:6402:270c:b0:426:22a4:f38a with SMTP id
 y12-20020a056402270c00b0042622a4f38amr24149760edd.51.1651676050191; 
 Wed, 04 May 2022 07:54:10 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 o4-20020a056402038400b0042617ba63c9sm9265625edv.83.2022.05.04.07.54.06
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 07:54:08 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id e24so2375547wrc.9
 for <freedreno@lists.freedesktop.org>; Wed, 04 May 2022 07:54:06 -0700 (PDT)
X-Received: by 2002:a5d:6d09:0:b0:20c:53a9:cc30 with SMTP id
 e9-20020a5d6d09000000b0020c53a9cc30mr15857966wrq.513.1651676045944; Wed, 04
 May 2022 07:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220503224029.3195306-1-dianders@chromium.org>
 <20220503153850.v2.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <d4541684-337f-4c3f-fafa-a883be370c0e@linaro.org>
In-Reply-To: <d4541684-337f-4c3f-fafa-a883be370c0e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 May 2022 07:53:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XMuUELUbLEuzG_r0J2+82gKxNLe5KTsvFBK2hNhKnLHQ@mail.gmail.com>
Message-ID: <CAD=FV=XMuUELUbLEuzG_r0J2+82gKxNLe5KTsvFBK2hNhKnLHQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/dp: Add callbacks to make using
 DP AUX bus properly easier
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Lyude Paul <lyude@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 4, 2022 at 3:41 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > - We had forgotten a EXPORT_SYMBOL_GPL on the non "devm" populate
> >    function.
>
> This can go to a separate patch, so that the fix can be backported to
> earlier kernels. Please don't forget the Fixes: tag.

Sure. Will do for v3.


> > -EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_ep_devices);
> > +EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_ep_device);
>
> Small note about the name. What if we change that to something more
> future-proof? Something like of_dp_aux_depopulate_bus() (and similarly
> rename other calls)?

Will do for v3.

> > +     /*
> > +      * If no parent "of_node", no "aux-bus" child node, or no available
> > +      * children then we're done. Call the callback (if needed) and return.
> > +      *
> > +      * NOTE: we intentionally pass the return code from done_probing
> > +      * directly out here. eDP controller drivers may want to support
> > +      * panels from old device trees where the panel was an independent
> > +      * platform device. In that case it's expected that done_probing()
> > +      * might need to return -EPROBE_DEFER to our caller.
> > +      */
> > +     if (!np) {
> > +             if (done_probing)
> > +                     return done_probing(aux);
>
> I see your point here (and that it makes code simpler). However I'm a
> little bit uneasy here. What if code this more explicitly in the
> drivers? Like the following:
>
> if (!dev_has_aux_bus()) {
>         ret = panel_ready(....);
> } else {
>         ...
>         ret = of_dp_aux_populate_ep_device(dp_aux, panel_ready);
>         ....;
> }

Yeah, I had considered that and was about 50-50. You think I should
change it? Is it really easier to understand if we break it up like
this? I'll wait for a response from you, but if I don't hear anything
then I'll change this as you suggest.


> This way you won't have to worry about the EPROBE_DEFER. Or you'd rather
> forbid it explicitly. Why? Consider the following scenario:
>
> dp_driver_probe()
>    /* This creates new devices */
>    done_probing returns -EPROBE_DEFER
>    /* device registration is unwound */
>    dp_driver_probe returns -EPROBE_DEFER
>
> However as the state of devices was chagned, the dp_driver_probe() can
> be called again and again, ending up with the the same probe loop that
> we are trying to solve.

Actually, I'm not sure we'd necessarily end up the loop we're trying
to solve. Let's see. If the panel probe itself doesn't create any
sub-devices and neither does done_probing() then done_probing()
returning -EPROBE_DEFER shouldn't cause any looping, right? It would
look just as if the panel returned -EPROBE_DEFER.

So I guess one could argue that _perhaps_ we don't need to forbid
-EPROBE_DEFER from done_probing()? It'd probably work OK (we'd
eventually retry probing the panel and call done_probing() once more
devices were added), but it'd be ugly and the system would report
(/sys/kernel/debug/devices_deferred) that it was the panel that
deferred even though it was this extra callback.

I'm going to go ahead and say this is too hacky, though. Also as long
as Linux still has the probe loop when you create devices and return
-EPROBE_DEFER we can get stuck because the panel _can_ create
sub-devices. It can do this with DP AUX backlight.

So I guess the summary is: yes, I'm confident that we should forbid
-EPROBE_DEFER from being returned by done_probing() when called by
dp_aux_ep_probe()

-Doug
