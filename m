Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678B3B0D1A
	for <lists+freedreno@lfdr.de>; Tue, 22 Jun 2021 20:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C535589CAA;
	Tue, 22 Jun 2021 18:42:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BB189CAA
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 18:41:59 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id u11so465665oiv.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pumBvi+qi7d1sRM6cwo7R1W/BHxp1boGJK8L9dh8S7I=;
 b=Gnb/8JfrLJ+yvZfpmSoMuJKpnj9MskU5T49YYM3w8+ZW9IypPBpCVKfYBZ02l5sZS0
 52RS8k1paGyZM5BA6bltHp9N0Sq2IWSZwbT/ojCUlljFvnkTkQmcIHt74VxA+KVyV8lY
 wiVJcA1DfdRMryKyocv7WRfaVD9tANv1RWGyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pumBvi+qi7d1sRM6cwo7R1W/BHxp1boGJK8L9dh8S7I=;
 b=dZnet33zdbIYH0pNn8wjbk3QHSbn8qmvEbyXfudAfYwhLMKJR2GF2qhn/rMasRVdr9
 zlbrn3H04LcUlFqM9m+NScwo+yHSuskC2gyGHjXoL4NvQMNWTUNeaejpnLFS4Cvmj0tM
 8sq+Ch4120o2rIsBQ/bNPzgAgWWT4pvjz2SgM0U34/IdysJpFqOui915aBZpnsFfPw3O
 YDsdQime3tf8ZTJEgVnoJVkMUwEMpSUkIzYJQ2nq4WvfF0BXocIRw67g8dt4H74cYgBM
 1GhJ3/ryb220wV2vc88KcyfXTkS+aJb9QuGOwAYIeAucegHywq/VS2HFsIRgNG47VhkC
 cNOg==
X-Gm-Message-State: AOAM531sroy9alAineG6HIUf4hdRsRpE8kgG11bwYAhJQQUE4rIXIc7L
 gvp+cwOGCzG6dg32LAfZCFsbNtX3YZI1Og==
X-Google-Smtp-Source: ABdhPJyujo5Qtucs7pTjIuAf2Elqz0xPDnw25rtpaYr3m2NWTDsYuCIfY3YtuJcBGaLEpwCbXwSwjw==
X-Received: by 2002:aca:1c11:: with SMTP id c17mr130560oic.77.1624387319090;
 Tue, 22 Jun 2021 11:41:59 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
 [209.85.210.46])
 by smtp.gmail.com with ESMTPSA id w20sm42191otl.51.2021.06.22.11.41.42
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 11:41:59 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so22257675otl.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jun 2021 11:41:42 -0700 (PDT)
X-Received: by 2002:a5b:54a:: with SMTP id r10mr6520278ybp.476.1624386805037; 
 Tue, 22 Jun 2021 11:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-2-git-send-email-rajeevny@codeaurora.org>
 <20210620093141.GA703072@ravnborg.org>
 <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
 <20210621183828.GA918146@ravnborg.org>
In-Reply-To: <20210621183828.GA918146@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Jun 2021 11:33:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
Message-ID: <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Freedreno] [v7 1/5] drm/panel: add basic DP AUX backlight
 support
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Lyude Paul <lyude@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jun 21, 2021 at 11:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> > > I cannot see why you need the extra check on ->enabled?
> > > Would it be sufficient to check backlight_is_blank() only?
> >
> > This extra check on bl->enabled flag is added to avoid enabling/disabling
> > backlight again if it is already enabled/disabled.
> > Using this flag way can know the transition between backlight blank and
> > un-blank, and decide when to enable/disable the backlight.
>
> My point is that this should really not be needed, as it would cover up
> for some other bug whaere we try to do something twice that is not
> needed. But I am less certain here so if you think it is needed, keep
> it as is.

I haven't tested this myself, but I believe that it is needed. I don't
think the backlight update_status() function is like an enable/disable
function. I believe it can be called more than one time even while the
backlight is disabled. For instance, you can see that
backlight_update_status() just blindly calls through to update the
status. That function can be called for a number of reasons. Perhaps
Rajeev can put some printouts to confirm but I think that if the
backlight is "blanked" for whatever reason and you write to sysfs and
change the backlight level you'll still get called again even though
the backlight is still "disabled".

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
