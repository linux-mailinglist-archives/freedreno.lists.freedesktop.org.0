Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A963D2C92
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 21:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C223D6E84F;
	Thu, 22 Jul 2021 19:15:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A196E7D0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 19:15:50 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 j1-20020a0568302701b02904d1f8b9db81so6269176otu.12
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 12:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=EusEYbQ13bFWsLQf0HYpb/wdiNyPX9L+F2ViR+RO33Y=;
 b=D+iysSmfAuVRkVd1YCYohemSgnbS7Iy5ZzkvKR3YyklHA+zasDTCgz+zlrYctzR1wL
 XdFzJdjD60jMBjjnHX03lBmHM5x+f8uWfK8s2/CYBx5lCppC463LwBRMfxza0K3f/wWy
 UfdzO0P+5ciJiKjBzO/O61wwUDVvT2F8Pd+xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=EusEYbQ13bFWsLQf0HYpb/wdiNyPX9L+F2ViR+RO33Y=;
 b=qQiEwqFslZ6bZLDEfKc34yEj8zyv/rY5kYAc0lW44kj+F7ECi2ucKBlCWO29ewQ84J
 UGX0V5r8aaHs5oRSjWNaGoYxuGPmYc2yBw+ifknz6iu2iGGqo8SlpNa5BWdG+Ny4HbML
 0C9vvYWLTJnC7s0ek3rUsosSYGd7DMc+Y6xIY4pdQLrYI6KS2QYUkfzrCbcMV65FsAb8
 jg/t7vtdAKjeoEWJfFJ0dIRAISXlbrVVnzpJkS86RVomcDttCIUi5za3G4e/IPickS2d
 qvohVl+s0SanM5yCDHsVK6w3Eq7S+Rm3mM7DWpBo/xP0IrYTm8icbp2rWogOFZwEf4lJ
 Oatw==
X-Gm-Message-State: AOAM532iCnJvZKoRaNf6BlzmQZHr30OTvLNZdJWHFCxNguCeoIxtpyVe
 S+CSPA20fvmfNeK0j/IjHwoMoDuIDu4r+LkAnByBCg==
X-Google-Smtp-Source: ABdhPJxZi6ghcXO9BFFOzhyS7XDAHh9cxgA1qHQYoljh9jZDXj31sg2BDKAeSnxi1yD6Oc1FE7A9cj0f1/F2ivB0p2U=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr859418otl.233.1626981350381; 
 Thu, 22 Jul 2021 12:15:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:15:50 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-7-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:15:49 +0000
Message-ID: <CAE-0n53e0cM2dFxwOGwUTW+u-X8yTPka1HyzAPPcuwq43zBh4w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH v2 6/7] drm/msm/dp: do not end dp link
 training until video is ready
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:06)
> Initialize both pre-emphasis and voltage swing level to 0 before
> start link training and do not end link training until video is
> ready to reduce the period between end of link training and video
> start to meet Link Layer CTS requirement.  This fixes Link Layer
> CTS cases 4.3.2.1, 4.3.2.2, 4.3.2.3 and 4.3.2.4.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any fixes tag?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
