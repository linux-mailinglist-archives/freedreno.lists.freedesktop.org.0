Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D83545EF
	for <lists+freedreno@lfdr.de>; Mon,  5 Apr 2021 19:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39EF389E15;
	Mon,  5 Apr 2021 17:21:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A2989E15
 for <freedreno@lists.freedesktop.org>; Mon,  5 Apr 2021 17:21:11 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id d12so18423671lfv.11
 for <freedreno@lists.freedesktop.org>; Mon, 05 Apr 2021 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/WjUWRXo+IDe/y+mKCTfQrTSTm3mkNsX9WTYOWOW3s=;
 b=lcPVlijF9oCVJyDvCuZq2rr1utg018XwqSJXnD12WyGEjGeNuCf+6oMoDHXEpTgD4H
 wAdg8ybhnDFNe1swhnJdMsptZJCkD2UV3EhTkB+h394vDWlOwQC4DOYWtRglgen0rWwl
 TtwOXYwnl6w2k8Hsmh4K0ltIVSeyruJ5EaerIAid40B1jeZoAiZ+jCGz/tnAVAG85XPq
 UdErIE9XJVhq133xdygBPh5h8+MxmjQk5Li+I/K2gdhGofjfD/T23mK3ND2onc5PEjOl
 JqHwWmaVzl5bD8iw5boeASm2un5suAh8wyXK7fEtYdDx4YKfknRfRJe6hSDJjvpd1fTC
 qRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/WjUWRXo+IDe/y+mKCTfQrTSTm3mkNsX9WTYOWOW3s=;
 b=c8ygc3JaVAH9V64ma2AzBfat/NFn3RW/+RqgaKSO22tq2m4lzIPYAn0Rj1zBw5RAgi
 cXyeWFwFGpeXr2qQZ0qvLlnOUFgvlEAVmHFvFrnMobwD/nJUHCi6X9ifYL73482Zo8hy
 POvM5w8728nRFk9m6m+ZhDN6lNS3Y7KOHmWjd4Kt/uUZbk7LYuL98gLbdO+cZf8wlbcj
 kjRs6cx5iz9MP8NuG8xM2My49nb2810LLLPvHeTvkuYEz3ISdS0eO3z6Kj2oXxdh0o6U
 q+SEjuPoo+TmIz10JM7jf8HnGH2lR15OAauTvPiaKBw3T+/b59uBN6LiQ/hNTGVcAf5l
 mhHw==
X-Gm-Message-State: AOAM531LXnvl8PaOFefFrlQ2hADiyezqhiU8S2zDERMcM+VIgtPEYWve
 PGcxuBMnPifwDh7jCwB489DTMw+wZGzkYc1xA730vA==
X-Google-Smtp-Source: ABdhPJzpa/Qv4TAxznqUz7EKeGVdks1XIH+m58fd/U23qQHvjXNXxBChZn6kXkZNUfGgqeNN7Kpp3vt6qoVGRuJAIRM=
X-Received: by 2002:ac2:549c:: with SMTP id t28mr17791532lfk.7.1617643270361; 
 Mon, 05 Apr 2021 10:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210330013408.2532048-1-john.stultz@linaro.org>
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 5 Apr 2021 10:21:01 -0700
Message-ID: <CALAqxLXBjTO4b01BJnboVKWZVyqLM1pXRv3M-rOYq6tMXaHozA@mail.gmail.com>
To: lkml <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix removal of valid error case
 when checking speed_bin
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
Cc: freedreno@lists.freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, YongQin Liu <yongqin.liu@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Mar 29, 2021 at 6:34 PM John Stultz <john.stultz@linaro.org> wrote:
>
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
>
> That change resulted in the db845c board display to fail to
> start, with the following error:
>
> adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware
>
> Thus, this patch simply re-adds the ENOENT handling so the lack
> of the speed_bin entry isn't fatal for display, and gets things
> working on db845c.

Hey Folks,
  Just wanted to re-ping you on this, as it resolves a regression
introduced in 5.12-rc5 and I'm not yet seeing this in -next. Would be
nice to have this in place before 5.12 final.

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
