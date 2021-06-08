Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA03A069C
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 00:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19A6E5B0;
	Tue,  8 Jun 2021 22:11:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD316E7E2
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 22:11:31 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id x196so22733183oif.10
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bZu+LetIK/Ou2FsjTvcsb/kLMI/BFrEdJ0cjHy2JCV8=;
 b=WugNAEnuACzJlxhsYmqoGNmcz374feWJhegI70dUbZN0lHbXLs3N7XS7hVJZWo2b21
 7AIUBwfNNK/9OrVa9v7Nu0BxFw/zfFd/8tkUL4mvbMK/sO6I6MDgYr7/KOCImFnzE5C/
 8xpYIMwngZwfRxquLyxkSwQLJKBL+WdwZ/qCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bZu+LetIK/Ou2FsjTvcsb/kLMI/BFrEdJ0cjHy2JCV8=;
 b=UEShdc31uK91yA+5ltOoPsq8l1N9SJydHRLmUllNLbAiDYlJOMDdbJL//60MHx1G39
 fR3Xn7RoOmIiP+/yiHDbdK0dKDsX5skcHHKbu1VHqH9W7T4t0HRUc1C9mlPGrHJs/17L
 rqzya4wyd66r8/xzOrW9BuzsHEfJbvxNh4AVJBWMV7U9oJ3oEft1vYSYcT+jmJz2o94C
 6g7W8CjlEv3iIRBHc5TdHFuIx+zD7FVynyEL9xtl3qjLrUE4+2IaHlpR8Gw5a2TqxhPF
 StFhYQ2r6CqwYkpfU6gttxVCGBE1Tfay+U34fpUlmPbFlZjtz5xBHV4rRL7qPTL4EixF
 TFmA==
X-Gm-Message-State: AOAM531LJOElaAnlYCfLLMddMUr7DC8ICf6hoJWFFAHCpkgnL0z3tPIz
 dJrLEe4gTDSCqlLgCHNFafsSjbwmtFhFA4myls6gvA==
X-Google-Smtp-Source: ABdhPJyLYJDdbR65ulUT98CM3xPB2U9bboRcC6MSbcDFmAX4Le8b+UG/ndJJnToeztAoKQHEZXx0LG2EHK3taiGGXFA=
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr4502727oiv.166.1623190290310; 
 Tue, 08 Jun 2021 15:11:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Jun 2021 15:11:29 -0700
MIME-Version: 1.0
In-Reply-To: <a6356956-9d4a-6fe7-2acc-bbe968d3a936@linaro.org>
References: <20210608195519.125561-1-swboyd@chromium.org>
 <a6356956-9d4a-6fe7-2acc-bbe968d3a936@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 8 Jun 2021 15:11:29 -0700
Message-ID: <CAE-0n521fW2F9V6E_7ei2KMsEUMLKSOCtAbRrVX+xXyrS0K9XQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Stash away calculated vco
 frequency on recalc
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
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-06-08 14:41:21)
> Hi Stephen,
>
> On 08/06/2021 22:55, Stephen Boyd wrote:
> > A problem was reported on CoachZ devices where the display wouldn't come
> > up, or it would be distorted. It turns out that the PLL code here wasn't
> > getting called once dsi_pll_10nm_vco_recalc_rate() started returning the
> > same exact frequency, down to the Hz, that the bootloader was setting
> > instead of 0 when the clk was registered with the clk framework.
> >
> > After commit 001d8dc33875 ("drm/msm/dsi: remove temp data from global
> > pll structure") we use a hardcoded value for the parent clk frequency,
> > i.e.  VCO_REF_CLK_RATE, and we also hardcode the value for FRAC_BITS,
> > instead of getting it from the config structure. This combination of
> > changes to the recalc function allows us to properly calculate the
> > frequency of the PLL regardless of whether or not the PLL has been
> > clk_prepare()d or clk_set_rate()d. That's a good improvement.
> >
> > Unfortunately, this means that now we won't call down into the PLL clk
> > driver when we call clk_set_rate() because the frequency calculated in
> > the framework matches the frequency that is set in hardware. If the rate
> > is the same as what we want it should be OK to not call the set_rate PLL
> > op. The real problem is that the prepare op in this driver uses a
> > private struct member to stash away the vco frequency so that it can
> > call the set_rate op directly during prepare. Once the set_rate op is
> > never called because recalc_rate told us the rate is the same, we don't
> > set this private struct member before the prepare op runs, so we try to
> > call the set_rate function directly with a frequency of 0. This
> > effectively kills the PLL and configures it for a rate that won't work.
> > Calling set_rate from prepare is really quite bad and will confuse any
> > downstream clks about what the rate actually is of their parent. Fixing
> > that will be a rather large change though so we leave that to later.
> >
> > For now, let's stash away the rate we calculate during recalc so that
> > the prepare op knows what frequency to set, instead of 0. This way
> > things keep working and the display can enable the PLL properly. In the
> > future, we should remove that code from the prepare op so that it
> > doesn't even try to call the set rate function.
> >
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> > Fixes: 001d8dc33875 ("drm/msm/dsi: remove temp data from global pll structure")
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> Thank you for the lengthy explanation. May I suggest another solution:
>   - Apply
> https://lore.kernel.org/linux-arm-msm/010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com/
>
>   - And make save_state for 7nm and 10nm cache vco freq (like 14nm does).
>
> What do you think?
>

Maybe that can be done for the next merge window? I'd like to get the
smallest possible patch in as a fix for this cycle given that the Fixes
tag is a recent regression introduced during the most recent merge
window.

I honestly have no idea what's going on with the clk driver in these
files but from the clk framework perspective there are bigger problems
than caching the vco freq properly. As I stated in the commit text
above, calling set_rate from prepare is plain bad. That should stop.

From my quick glance, the patch you mention looks like another
workaround instead of a proper fix. Why would we need to save the
registers at boot and then snap them back into place on enable? Maybe we
shouldn't reset the phy after registering the clks? Instead register the
clks after the phy is reset so recalc_rate can accurately calculate the
frequency. I suppose that would break continuous splash screen though
where you want the PLL to stay running the entire boot? But then
issuing a reset would break that, wouldn't it? As you can see I'm pretty
confused about how this is all supposed to work.

Note: my problem isn't about recovering what boot sets, it's mostly
exposing incorrect usage of the clk framework in this driver because it
relies on this chain of events:

 1) recalc rate calculates something different than what is
    set via clk_set_rate()

 2) clk_set_rate() is called with the different rate

 3) clk_prepare() is called to actually enable the PLL and wait for it
    to start

If clk_prepare() was called before clk_set_rate(), which is totally
valid, then it should similarly fail and think the rate is 0 and the PLL
won't lock. Does implementing save_state fix that? If so, it seems like
we have two pieces of code working around each other, maybe for
suspend/resume purposes.

I admit this patch I'm proposing is another workaround, but at least it
makes things work again without going off and adding a bunch of register
save/restore logic.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
