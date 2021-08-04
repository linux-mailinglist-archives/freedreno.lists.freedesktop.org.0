Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215B3E05DB
	for <lists+freedreno@lfdr.de>; Wed,  4 Aug 2021 18:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927706E3F2;
	Wed,  4 Aug 2021 16:24:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C776E3EF
 for <freedreno@lists.freedesktop.org>; Wed,  4 Aug 2021 16:24:36 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 z6-20020a0568302906b02904f268d34f86so1827105otu.2
 for <freedreno@lists.freedesktop.org>; Wed, 04 Aug 2021 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bPGAJ1O4XY4xsJwp1tio/KzVLh6cCEwMAyfzs69Wdns=;
 b=KOO128q3ZaIvPyPvjxovgNX30WEEa6/W/NpQhKwj13IOSiOJOIsKO/VXr6ItCk5W5O
 fg2gVArGO2n8ipiJ+RhV1fkJZgWm5Df72mRdKsWj9ouiDgQu6iB61BIiK6zbwPydqvTQ
 RkCEQ0DjUHHyamMi8cXB+PUfj1bbuC9YLQpuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bPGAJ1O4XY4xsJwp1tio/KzVLh6cCEwMAyfzs69Wdns=;
 b=L/lDMJXETZ811QH6yjWAAxAIX0Q1+e2qYqTgeuwIYip09q0ZXCxG/XRDy0hZMapokm
 t9yL5eGojcZGZiDMBy2bMzjNqJP2alkN5jZCudk/Dpoz3mPfTYmeFOkSWeGL0e6UCqmh
 mvbO6XXPHvsFw6hywC2HTd5NlTrQNc84H2KyxZG4+gjxhIBdAirWNQ5K+fs68JpicDde
 aodSOeNWp9alsqmhU4BvdNYyHuMqNTeT5W+dcdk+FKRUsxhjzjDJOZFOO02PVb0rfSlV
 EUeukv1mFiP+diTRzDNKS2RlmQvQEDb9/RSFUYwQ0nUqbhenjoZiLCLYi8P4t0I+GwQn
 3WWw==
X-Gm-Message-State: AOAM532Xmi9f0gBecHk2yErXngtiVOhzc2a25EqIt/kb4io+GICejU3p
 05R8miqDgMl0bnbzgUIvOE72W8PNU8gich5GHzszOA==
X-Google-Smtp-Source: ABdhPJwESZ2fueBO9Cwh5ZfEKrgIdlZyanmaz/kvcpyGNnZR1WLw1cWI+G4ecqRzKDmX26tsafgzDe4YPwUFx/Hsyas=
X-Received: by 2002:a05:6830:1490:: with SMTP id
 s16mr411904otq.233.1628094275464; 
 Wed, 04 Aug 2021 09:24:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 09:24:34 -0700
MIME-Version: 1.0
In-Reply-To: <ab2a7aadb6ada58246ec972c4938c627@codeaurora.org>
References: <1628007913-29892-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51yNrmrqgDrkj2+c2Bx-bYxNs1m2pQBxvVkSpBH2hxzoA@mail.gmail.com>
 <ab2a7aadb6ada58246ec972c4938c627@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 4 Aug 2021 09:24:34 -0700
Message-ID: <CAE-0n52bpS4mxM+=xxXvxQYSc5p_xyhkPQ07E1ad9uM1ZBKLwA@mail.gmail.com>
To: khsieh@codeaurora.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com, 
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org, 
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: update is_connected status
 base on sink count at dp_pm_resume()
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-08-04 08:48:04)
> On 2021-08-03 12:05, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-08-03 09:25:13)
> >> @@ -1327,14 +1327,26 @@ static int dp_pm_resume(struct device *dev)
> >>
> >>         dp_catalog_ctrl_hpd_config(dp->catalog);
> >>
> >> -       status = dp_catalog_link_is_connected(dp->catalog);
> >> +       /*
> >> +        * set sink to normal operation mode -- D0
> >> +        * before dpcd read
> >> +        */
> >> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> >> +
> >> +       /* if sink conencted, do dpcd read sink count */
> >
> > s/conencted/connected/
> >
> > This also just says what the code is doing. Why do we only read the
> > sink
> > count if the link is connected? Can we read the sink count even if the
> > link isn't connected and then consider sink count as 0 if trying to
> > read
> > fails?
> >
> yes, we can do that.
> But it will suffer aux time out and retry.
> i think it is better to avoid this overhead by check connection first.
>

Hmm ok. Maybe something is wrong with the aux channel where it doesn't
avoid the timeout if the connection is obviously not established yet.
