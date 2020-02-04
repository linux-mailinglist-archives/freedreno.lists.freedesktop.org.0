Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00CC1513C0
	for <lists+freedreno@lfdr.de>; Tue,  4 Feb 2020 01:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BDE6E513;
	Tue,  4 Feb 2020 00:40:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A56A6E513
 for <freedreno@lists.freedesktop.org>; Tue,  4 Feb 2020 00:40:53 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m8so17996788edi.13
 for <freedreno@lists.freedesktop.org>; Mon, 03 Feb 2020 16:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dj1hr3nC99JuvkU09XV7ayB0+YSPBYgoXgElkOJgmzg=;
 b=OMhFkOfWAK0jlVydiXMohJVXTPAHEPDPkHJ1c6tFod2BMXKyBEkqSsiZmNK7hdp2ji
 hjvvzsv+zfuvHAvV1IGMHpcWwzdQllCn5Q56ibwE1N4L7kkL6c+3Q/y5p+WE5FFcSQNY
 aw1xsgtt7Dysn69u9irzrCJcxh31dOeUWw5vj6raP8DsnnqT3fjhYYOYO45wlmnsVfsK
 4wl3SJV5LAfPBX6E1HhLC5vn8q8tiGC6QSoyEgieQh1bnnJFTc5FNYsxdLsenT6W7vXu
 SfT2R2XmOAhLg/RSVkWJhKGpez+yifBE0Rf79xuBE6Pp8fx5kEFFSfXeVdyKpEqzLA1i
 VU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dj1hr3nC99JuvkU09XV7ayB0+YSPBYgoXgElkOJgmzg=;
 b=OfZ2/ySr6bLHiAM1C0kpgo7QMZLDNvzfeHS0s5PdQmYLIcZnaMM4QatDNJdKsXjr2i
 9zn819ixG1jtwOr7KQfm5OiXqKOnFxjV9xNbMWNneqIExcKAUMqP1uF1S9NDQiT00vmo
 SfmD2SskvOeqX7kElCzaMEyt9MJ7SP4HkOd64htPCjUSoQuJQMmC/NZrrgURL4DolIsb
 EiVnL5FOZyB2hUaZiQmgm3Xes9QPL9B8mfHU5amaaqvQUHrLSWRlyUBTdbFwISecDIFf
 0+UBjE7il5IjxPcE4jpam8p4L3oqNDdLkKZ0le7yDnhCA4ZBO3iVXc9bYtTMwtT6A3U9
 xLuA==
X-Gm-Message-State: APjAAAW6bMWuT0N7IS2J798d6urvLSLS9zHYIJxgEfU0koB1JTgWh8BZ
 Tz5TaZaZcdtD0/IGQlPRO+nUqI5XKZWM/fQAq48=
X-Google-Smtp-Source: APXvYqyFsuijb4pxN+FCPFBZGR03YAhbbzg8McEI+im+HEHIvWPDusNo46gAIuLArQP5FgrOxgPNDog46maRiViYDNY=
X-Received: by 2002:a17:906:19d8:: with SMTP id
 h24mr22838316ejd.166.1580776851956; 
 Mon, 03 Feb 2020 16:40:51 -0800 (PST)
MIME-Version: 1.0
References: <1579763945-10478-1-git-send-email-smasetty@codeaurora.org>
 <1579763945-10478-2-git-send-email-smasetty@codeaurora.org>
 <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
In-Reply-To: <CALAqxLU9-4YEF8mTjuPF+LBJH8fFw_OfrdT7JtTqib127RRaEA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 3 Feb 2020 16:40:40 -0800
Message-ID: <CAF6AEGtxtJU5dJxd4idQgPL2HYgiLm2vJejjK-gzDXqtoaTr9w@mail.gmail.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 2/3] drm: msm: a6xx: Add support for A618
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Feb 3, 2020 at 4:21 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Jan 22, 2020 at 11:19 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
> >
> > This patch adds support for enabling Graphics Bus Interface(GBIF)
> > used in multiple A6xx series chipets. Also makes changes to the
> > PDC/RSC sequencing specifically required for A618. This is needed
> > for proper interfacing with RPMH.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > index dc8ec2c..2ac9a51 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -378,6 +378,18 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> >         int ret;
> >
> > +       /*
> > +        * During a previous slumber, GBIF halt is asserted to ensure
> > +        * no further transaction can go through GPU before GPU
> > +        * headswitch is turned off.
> > +        *
> > +        * This halt is deasserted once headswitch goes off but
> > +        * incase headswitch doesn't goes off clear GBIF halt
> > +        * here to ensure GPU wake-up doesn't fail because of
> > +        * halted GPU transactions.
> > +        */
> > +       gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
> > +
> >         /* Make sure the GMU keeps the GPU on while we set it up */
> >         a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
> >
>
> So I already brought this up on #freedreno but figured I'd follow up
> on the list.
>
> With linus/master, I'm seeing hard crashes (into usb crash mode) with
> the db845c, which I isolated down to this patch, and then to the chunk
> above.

(repeating my speculation from #freedreno for benefit of those not on IRC)

I'm suspecting, that like the registers to take the GPU out of secure
mode, this register is being blocked on LA devices (like db845c),
which is why we didn't see this on cheza.

Maybe we can make this write conditional on whether we have a zap shader?

BR,
-R

> Dropping the gpu_write line above gets things booting again for me.
>
> Let me know if there are any follow on patches I can help validate.
>
> thanks
> -john
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
