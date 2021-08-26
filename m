Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E73F82C8
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 08:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826936E525;
	Thu, 26 Aug 2021 06:54:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0356E525
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 06:54:55 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 z3-20020a4a98430000b029025f4693434bso618714ooi.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KhqwvKpX2QUupbDYfTBjhyLe2hfemZiewWwZY0rgk0w=;
 b=IKoyYNbSttHPGi5+7FMcORxQLLUgr+nGS4hi/HbbDCxYtSfz6/Do8eIOqxPKT1CBLS
 57YpI2ic79FSuSudLRG1MGqTg9lN/wHHgdsb7G3o8qCDJNHn0aaoK0/clk6xpbJYou/v
 EX5Iw3aDq7mm5yF87RCn/NMkWrW0Hr+1g683k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KhqwvKpX2QUupbDYfTBjhyLe2hfemZiewWwZY0rgk0w=;
 b=gmBhJb7hGGxEez7CucRa7vU0nncI/5xGewwc9gD2I2pPEsLTZYf17ToGuUUCCueOHU
 ooPH+HPRR+JThh8Q4NWnYkqBLTA9CorpJDa9Jyu7Vi4oPW8sRW+XR8kzZ12wGL+66ssu
 gaafs8ic5np9yb+cmfmsmQh/ayDml1pH3cwH8Y4RmHofAC6+srU/hGn7k0/ojMnMVphD
 1SgdJE1QTvS8F0CZEJrQoJdS6jrbR1t2yTk7SJDkmC/EpdE8bWdVgKJgz0Idrw2IYTpm
 ysp0ggwSdyKymjITrYvqH3HkPewD+cY08hnCra4lU2gdmBvuFhjudvUXQobzBXghqXWp
 HyUg==
X-Gm-Message-State: AOAM533o7Rs8FbuSaSdal7m7z+TYJCZns9c9h5i91EBmbad7OASn12Rl
 SzNbIUNuIamBaGdX537sAg1o1GtXuWiC+f0866b37g==
X-Google-Smtp-Source: ABdhPJxXVSZ0AeDf4bM/tncwC3s9EqVDnIEfhIMOL7c4INLIqsTWlLNWu96+47aZUOf/3EzE4j0uBVgY5Q0OkeJXviA=
X-Received: by 2002:a4a:a841:: with SMTP id p1mr1813277oom.92.1629960894339;
 Wed, 25 Aug 2021 23:54:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 06:54:53 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-2-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-2-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 06:54:53 +0000
Message-ID: <CAE-0n53M-bk-525Jh5owT54fQu-E+cHM-6m-qLo3APYLDLuueA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 1/5] drm/msm/dp: Remove global
 g_dp_display variable
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

Quoting Bjorn Andersson (2021-08-25 16:42:29)
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
>
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
