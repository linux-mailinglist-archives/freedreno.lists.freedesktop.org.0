Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC84B1BF9
	for <lists+freedreno@lfdr.de>; Fri, 11 Feb 2022 03:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120510E9B2;
	Fri, 11 Feb 2022 02:12:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4788810E9B2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Feb 2022 02:12:01 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id g4so6958795qto.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Feb 2022 18:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06aBiVvbhWkfXru/N9K7na0D6XrgIVuslgTLZxvkDek=;
 b=WIcP552qomNEjdcOHaTSCGKmebrYHEM6VQ3xlCShI8mAoL9/+yUJ4p6Qa2rPVKvpP6
 XBPO1lzNE69XEFzLhdauJbuaQ/V+IzD49npN6nQh1i0bO1tdr0KM9eZ8xJJXGlaWzi6q
 Pve7GDkdE8luCalDrM/R3j+1rkDOyQHcXHCxw414yuTrDFnuRabFOeRExMPZL2zOB3t3
 JqQ2/8sd5USAJz7DEUqHuzQ3928MUlLqR7O0EcVsaqxu/rASzGBpb8kthUBAEmUlkcCk
 wjU19iPeylMGo0RYEmGkkuY5rFfc7r3Dpff+K8Uqb/PCUjy4wMm4+L93QWT6Dc1R7ntf
 WlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06aBiVvbhWkfXru/N9K7na0D6XrgIVuslgTLZxvkDek=;
 b=K/SK9VT6Nd26FGwLzyRifQJEfmu5KwnTXi8znm8qTyRU1MhTDv4Em//5YP2WWj0j9w
 n5U8lZrcJUKCL/z1eYfLWJXuRvlljjUKnT+O9s4Yxm9lrDQ+LSLscU/gjdm5cTsjiXXE
 ulTNQbADOHQ1m1NluM0+XmGx+w0iDryNQvHlbzDIbK3rlk4VhtCwpipADYKx4VvqZeoM
 oYqtVyUJM99qKfbDMnTSOKwh6wvJesBbFkzSPOzH1e6cwCvT6frk0SrVBUJ3FGopRyEv
 kaUNaV9PKXA+c3KD8U6RkNF2AwoZAFF0tEH2nLQxMs1uxzEdYLZuP61nd+9QuX7dlPYG
 dj7Q==
X-Gm-Message-State: AOAM532dDEdmwSh9yfe2nsdugUHxiMhOAQdSv8Ab/63nEHPVKk8XXqcM
 05N8zpqJ29H3a/knR7H12w2jV6Mp34CSDXWTbq3uag==
X-Google-Smtp-Source: ABdhPJwK7HH5Z3aPWfCQnRO7fXOlintpSX7+Wo3G/7vTfUrJgjQl/zb43Or4bBKvloZZ6EymgcbVxJMJZKXipywum74=
X-Received: by 2002:a05:622a:4d:: with SMTP id
 y13mr7092687qtw.629.1644545520212; 
 Thu, 10 Feb 2022 18:12:00 -0800 (PST)
MIME-Version: 1.0
References: <20220210224933.379149-1-yury.norov@gmail.com>
 <20220210224933.379149-9-yury.norov@gmail.com>
In-Reply-To: <20220210224933.379149-9-yury.norov@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Feb 2022 05:11:45 +0300
Message-ID: <CAA8EJpqwtQ6JF5+Zhx89LhObue8D5c_OK1yqarQXmOBzpAbtGQ@mail.gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 08/49] drm: replace bitmap_weight with
 bitmap_empty where appropriate
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
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Dennis Zhou <dennis@kernel.org>,
 Alexey Klimov <aklimov@redhat.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sean Paul <sean@poorly.run>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 David Laight <David.Laight@aculab.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 11 Feb 2022 at 02:09, Yury Norov <yury.norov@gmail.com> wrote:
>
> smp_request_block() in drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c calls
> bitmap_weight() to check if any bit of a given bitmap is set. It's
> better to use bitmap_empty() in that case because bitmap_empty() stops
> traversing the bitmap as soon as it finds first set bit, while
> bitmap_weight() counts all bits unconditionally.
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> index d7fa2c49e741..56a3063545ec 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
> @@ -68,7 +68,7 @@ static int smp_request_block(struct mdp5_smp *smp,
>         uint8_t reserved;
>
>         /* we shouldn't be requesting blocks for an in-use client: */
> -       WARN_ON(bitmap_weight(cs, cnt) > 0);
> +       WARN_ON(!bitmap_empty(cs, cnt));

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
>         reserved = smp->reserved[cid];
>
> --
> 2.32.0
>


-- 
With best wishes
Dmitry
