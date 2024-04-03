Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1320897B69
	for <lists+freedreno@lfdr.de>; Thu,  4 Apr 2024 00:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA79112F82;
	Wed,  3 Apr 2024 22:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZBVNY3p7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8612C112F82
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 22:05:03 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-516c5954e41so243555e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 15:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712181901; x=1712786701;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=wMV6DGmC8+TexjV5H4CBihBSEOZEkPeyx4+1TZ0zHaI=;
 b=ZBVNY3p75cE2104QORGOCeLY4PAWNYYWVbb93cMJzPx1HUpwV8Yab9EI5mtNrVDZ3c
 ebKoiffz1NFH0RfG2uecMlZRgggHcWNhetI9VX1GXSqrWajZJuXGz4JtIlXiQQjpDqwt
 +s4I9NVEQ0cy6YMIh7Q7+xnSlzrDbIcUmjoHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712181901; x=1712786701;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wMV6DGmC8+TexjV5H4CBihBSEOZEkPeyx4+1TZ0zHaI=;
 b=mJg6HOebiujLpruUKgWv/gUxwO0lRGKyxtzDd6nQXcW8wrgB7lvloHtjOaySsYeyvB
 kh4oXmD8g8sFjrZqoJHKrbVfqwk/bK/igtcSOUApEq0Oxj7Lyq7VY/lJspNa0KOXEhYB
 BTohPB9KL5O/9+kAOfz9C2hnOriDNSivsnu4EvTwu1V9DtUjQQRSyVuy9RFZXvf7qQGN
 jZA47ahsSbgdNuYd/rIxUymGNlg1qI86B9pSCPV7g+wdYU5em0sjTDs0f5tJa/NWga3e
 2NBQW1Xwu2ntmgvbl1IMqAuFKTHsyA9rlAUaHFJDQqqz4fMln7lp3K1UTTNRu2fVfvWi
 SHGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT0FQa8WXibi5rh8paa4YTBLGfCufyjBOHBnMQYzmNYjEivxyIt/lhbj3TZf+ucRjIaJAexNI9Cw2kV2omLtpq6LEdg+KxXE63xqFto0VN
X-Gm-Message-State: AOJu0YyP+TzSY21QCe2GWcvLIcqHZR3v2k5lcJCe9r3404lBod+T5jzS
 f4zVwnORTssatGNTu5k+FKI9Gd0sEpGx6ID3J3sE78R39pyRWe9jCHtPp6hT0bcolqdhaDwDtVE
 FvQ16HQZ1tmAx4lR7+/QLm5mDKl6jRVZRzuk+
X-Google-Smtp-Source: AGHT+IGlGz6NwwFId6Uph2fl3g1kjsfJMQ9PNfKcdq6jZYYy7ZRg9sXlAEjcuxlOjhWg+5krSZlkS2bEyqTjCzrx7JQ=
X-Received: by 2002:ac2:4253:0:b0:513:df5f:38cd with SMTP id
 m19-20020ac24253000000b00513df5f38cdmr1409240lfl.4.1712181901096; Wed, 03 Apr
 2024 15:05:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Apr 2024 18:05:00 -0400
MIME-Version: 1.0
In-Reply-To: <01ce1142-04ac-5978-9d5a-88f94b920055@quicinc.com>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
 <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
 <CAE-0n50qT2mHOGiU89NAmHdADQAAgs3aMP1RFOTTV8oCUbZKgw@mail.gmail.com>
 <01ce1142-04ac-5978-9d5a-88f94b920055@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Apr 2024 18:05:00 -0400
Message-ID: <CAE-0n53MEQHAXsfoCrJdtu5vSTxbjgak-dLFsmLfboPQAawSzQ@mail.gmail.com>
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 abel.vesa@linaro.org, agross@kernel.org, airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Quoting Abhinav Kumar (2024-04-03 14:28:52)
>
>
> On 4/3/2024 1:04 PM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2024-04-03 12:58:50)
> >>
> >>
> >> On 4/3/2024 12:51 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2024-03-29 12:50:35)
> >>>> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> >>>> return value of cfg->configure_dp_phy(). This patch propagate
> >>>> return value of cfg->configure_dp_phy() all the way back to caller.
> >>>
> >>> Is this found via code inspection or because the phy is failing to power
> >>> on sometimes? I ask because I'm looking at a DP bug on Trogdor with
> >>> chromeos' v6.6 based kernel and wondering if this is related.
> >>>
> >>
> >> No, we actually hit an issue. This issue was originally reported as a
> >> link training issue while bringing up DP on x1e80100.
> >>
> >> While debugging that we noticed that we should not have even proceeded
> >> to link training because the PLL was not getting locked and it was
> >> failing silently since there are no other error prints (and hence the
> >> second part of the patch to improve the error logs), and we do not
> >> return any error code from this driver, we could not catch the PLL
> >> unlocked issue.
> >
> > Did link training succeed in that case and the screen was black? Also,
> > did you figure out why the PLL failed to lock? I sometimes see reports
> > now with an "Unexpected interrupt:" message from the DP driver and the
> > interrupt is the PLL unlocked one (DP_INTR_PLL_UNLOCKED).
> >
>
> No the link training had failed.
>
> Yes, root-cause was that the PLL registers were misconfigured in the
> x1e80100 DP PHY for HBR2. Once we programmed the correct values it
> worked. This was specific to x1e80100.

Ah ok, so that's what the x1e80100 patch is about.

>
> Yes, Doug mentioned this to me on IRC that this issue is still there.
> Surprising because I thought we had pushed
> https://patchwork.freedesktop.org/patch/551847/ long ago and it was
> fixed. It certainly did that time when I had tested this.

I see it on v6.6 and it is also on v5.15.y (stable kernel) so that has
been picked back. Somehow the aux interrupt is still happening though
when the PLL isn't locked. Maybe that interrupt bit should be masked in
most cases and only unmasked when something in the driver is going to
care about it.
