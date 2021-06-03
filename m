Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6377339AE84
	for <lists+freedreno@lfdr.de>; Fri,  4 Jun 2021 01:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35306E096;
	Thu,  3 Jun 2021 23:19:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2B36E096
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 23:19:08 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so7390294otp.4
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 16:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hQgUp3SEy3n12KWwuAp4G7saP1ifGjcDT5qP0d3bq/E=;
 b=dMw4w7yxFEkhi6vIaddcnLjcLM9HD7Bdor+5wMklitaNgESzmyjwbVCYp83kEgr808
 KSntBQqo9bbbM211K4tkXi9sNUjE4f4PhDVmPJ/Rn2H9Hth+OVAUF0PFVTncL9x5lUfr
 5ZkeZ6HA0BvpA07a1Zaq9BDmGimZBL3vm3qpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hQgUp3SEy3n12KWwuAp4G7saP1ifGjcDT5qP0d3bq/E=;
 b=W8v71UA0A9U6D7WVcvOBYjKL2tE38e7WIyHzPKf/k5pw6LcXamVIk5CYgce5YExvWg
 frnMvxP2aSNZcVySZJEOp6PslSFtBRpRyoqW56cxKtMOq32n/8dqYeLjAFxknRMvvm5V
 Rc8BFcbOkQErz00IcgFBkFnNQ1bMpZKqOGwTLBh6RPiWKNsofZdiWdwM0G0hNR7+rI5+
 TyB/6WrmMbmSDGvkNk/NvYSKcOkoDYu9kbyia2rQ+g4bWz1HASH4wEyHiR2VWn8Vzdog
 BASlqitb1WzFh9vWVa4BtUTXZCHDmcAlXivuXLPSYzCQTpvmnboWKVsDVSwHduIjgapR
 X0Tw==
X-Gm-Message-State: AOAM531DuMfLYda4xHKgkWGjoqIdiag9ZZtBxxiTJbKXylpH9D62m6gO
 4JGB7r+qLbIx10C2AmIVFK9hgKG9uKfaHYCrlTfDlw==
X-Google-Smtp-Source: ABdhPJxzdb4WdqDahQ8sBCMrVHSxCw07OebJeAIROoN0SDmUX2m3leUZaXQLLfQu8qBsngegdJHo3AzpwpdErBvGuxA=
X-Received: by 2002:a05:6830:1f51:: with SMTP id
 u17mr1428545oth.25.1622762347800; 
 Thu, 03 Jun 2021 16:19:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 23:19:07 +0000
MIME-Version: 1.0
In-Reply-To: <3f62fc2142f6089c43ec3a4b7b10cadc@codeaurora.org>
References: <1622734846-14179-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51-CsHPwYmceUq1kTaG=L+ifG3kX2pxJxTG_=r4Xm67_g@mail.gmail.com>
 <3f62fc2142f6089c43ec3a4b7b10cadc@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 3 Jun 2021 23:19:07 +0000
Message-ID: <CAE-0n52P+xZwL5xWnEnj3qQpmrhhLhXnaYvJST_-NM8hnXZdvQ@mail.gmail.com>
To: khsieh@codeaurora.org
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: power off DP phy at suspend
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
Cc: freedreno@lists.freedesktop.org, vkoul@kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, aravindh@codeaurora.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-06-03 14:59:49)
> On 2021-06-03 13:22, Stephen Boyd wrote:
> > Can you Cc dri-devel?
> >
> Sorry for dropping this cc.
> Should I re submit this v5 with cc=dri-devel?
>

Yes please. Then the patchwork stuff will catch it.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
