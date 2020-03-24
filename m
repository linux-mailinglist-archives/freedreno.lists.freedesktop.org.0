Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEDA191346
	for <lists+freedreno@lfdr.de>; Tue, 24 Mar 2020 15:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DAC6E49F;
	Tue, 24 Mar 2020 14:35:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AD06E287
 for <freedreno@lists.freedesktop.org>; Tue, 24 Mar 2020 14:35:34 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id e138so11213689vsc.11
 for <freedreno@lists.freedesktop.org>; Tue, 24 Mar 2020 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
 b=YiMsSpudpT6FxZHxA6De/saSAHGXK7VlyDXtpNtN9hNzxOPelBBcnUkk9LPz8Mz4Ir
 KztvWvGmrqbAk7jwUQE14sSAWV4hf05oN5i6odmjR/cou/29qpALc9peKPyrjgXDkrAc
 oq6V4L/S8pZ9LSBWm00J5so+SUpk1hSQ8Va+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
 b=o/5WXMSsZNGCZKL/Af6Mv8vJeL8PdqqPy8SawIUP7+pV1lbgdD2xTy+lz77bi0qNl7
 L6uWXeIAKZcHpGnrDi8kBtROWsH9PZHviO5rfMTwvLqZVCAshAysiVIbLsMutCzyVE6a
 WmNTc7GHAvP404BCMerPVaHZCvlH80hWUUrrNHLhJe++1Dt7YWegMxKrdrNFDHiSDHMi
 jHXDqjbzMds5KNeLbe5kywczxXEdxX7WtwIsN55mZsFHiCbh1fnastAONB4cPYTXoytW
 YGNGe52qXNUf5AS6NEa2SyChFEGr17KwzO1wo6XmGX7GHTTkN/rttHqlG9lKc9qZQ3cs
 zULA==
X-Gm-Message-State: ANhLgQ2h35a+dzzYo6cCpv2A1E24ggYCK2Cs/iTo9fVSzSdTR7l0f9UA
 kZ0NtM9xEhWy2n+rsxKnlJaLdDGUnbY=
X-Google-Smtp-Source: ADFU+vv5SAVqvEWASLHuBSxQQZ/kVr3OklCnMJQQDcdHvo0QAlWLdGBDvviqGLN3iY6JkV6KSCjqzg==
X-Received: by 2002:a67:d706:: with SMTP id p6mr20286212vsj.143.1585060533431; 
 Tue, 24 Mar 2020 07:35:33 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44])
 by smtp.gmail.com with ESMTPSA id p70sm8970318vkf.1.2020.03.24.07.35.32
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id h35so6391190uae.5
 for <freedreno@lists.freedesktop.org>; Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr18039835uab.91.1585060531555; 
 Tue, 24 Mar 2020 07:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 24 Mar 2020 07:35:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
To: Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>      _dpu_kms_disable_dpu (Rob Clark).

I'm wondering what happened with my feedback on v1, AKA:

https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com

Maybe you didn't see it?  ...or if you or Rob think I'm way off base
(always possible) then please tell me so.

Thanks!

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
