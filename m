Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA823CA878
	for <lists+freedreno@lfdr.de>; Thu, 15 Jul 2021 21:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186266E89E;
	Thu, 15 Jul 2021 19:00:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C867C6E8AA
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jul 2021 19:00:19 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so7294056otl.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jul 2021 12:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9GEmaDpQMUFvZjd/2LqfDua2IjDBMZfqrvLpdIshpRE=;
 b=LIW3L+U+KAOFBPJFqfMwPRPpFQZwpGABowsd08a+L3VQ0P/P4WR9//YMhNJlEeQM9T
 m44000IsOL4B5VY7j8OHXsGyN8DgUJAxRhDHN7Gln3Q8HXVtdGz2/HXA8BJUMRgnaOjC
 qycJ2q3183q2w9awG3PEfoxkz+hm5Xei9zoDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9GEmaDpQMUFvZjd/2LqfDua2IjDBMZfqrvLpdIshpRE=;
 b=K+l7jDo0qq0hLwzamV44Itj1DxOxVBlk94mwjqe9m3yfnUEic+1TC2+E9ugDZzu4z/
 r1aCI6arNMCimf6kjVJPH05ASCmMZMAzGhou/cI4TnPk3UTFXp6WbBu/ps8Nn+KCzQPV
 7enOTOwpIdgmzJgAonivYfwb6Ake6oocPdkP87G4bb6o//rvTBrZeQaYC6UwzFda5LQb
 VrDb8/TsOGGqVhfJBrYCBBcs0Ew1kteo6wnAR3N2qNUKqNtHPXJ2sIuzl4VB7Qyc1wZ6
 L+XpnfVwlW1SBjB2sVX4CgIyeGePE/TNwmtVZ2LGp8+d6q0KpHncBIiv9ljLDDpNTh/P
 c/Sw==
X-Gm-Message-State: AOAM533+wiLecl1WpKvKA90asRckRD8M6N5NAdhFt/IiWm5RfcLOX1lH
 x5yqRe5QiP5yc+GlXXIKn9YHSqxAjv9m4Oj1lFW+gg==
X-Google-Smtp-Source: ABdhPJxf21q1Ik3LU9OiVWzgN+Ii0qixpl5UQbE9oflle2O6F5lL6xJzhxgcmT9tg8sYDKVmYXEZLaWvr8DSlyGYBeY=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr4963674otl.233.1626375619183; 
 Thu, 15 Jul 2021 12:00:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jul 2021 21:00:18 +0200
MIME-Version: 1.0
In-Reply-To: <e6375232222bc357897b62c1752c06d8@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-8-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51U8faPjxfFcd3uuOk27urR2rCSGhg1Kat1AO6LLixYTw@mail.gmail.com>
 <e6375232222bc357897b62c1752c06d8@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 15 Jul 2021 21:00:18 +0200
Message-ID: <CAE-0n50ysxXkjWjmRhxUywPLEH4jkkDnweM969QX0bkKA2WU=A@mail.gmail.com>
To: khsieh@codeaurora.org
Subject: Re: [Freedreno] [PATCH 7/7] drm/msm/dp: retrain link when loss of
 symbol lock detected
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-07-09 10:16:52)
> On 2021-07-08 00:21, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-07-06 10:20:20)
> >> Main link symbol locked is achieved at end of link training 2. Some
> >> dongle main link symbol may become unlocked again if host did not end
> >> link training soon enough after completion of link training 2. Host
> >> have to re train main link if loss of symbol lock detected before
> >> end link training so that the coming video stream can be transmitted
> >> to sink properly.
> >>
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >
> > I guess this is a fix for the original driver, so it should be tagged
> > with Fixes appropriately.
> Actually, this is fix on patch #6 : drm/msm/dp: do not end dp link
> training until video is ready
> Should i merge patch #6 and #7 together?
> Or can you suggest what should I do?

Yes if it fixes the patch before this one it should be combined.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
