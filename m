Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406383E830B
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 20:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99C289F61;
	Tue, 10 Aug 2021 18:33:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03FA89F61
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 18:33:43 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id r5so434766oiw.7
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=gYZz10QOH/TLSpK9xInSP5W9KjyrAu8lPPeUY1ToCJE=;
 b=UkvTnleb2ewtinuVC7dDQEd5XOLkYp23xWGkwCzb6rbXV4wMfIeKFe8mHA8REQnDU6
 zGcRQ4iXxZoqPZSXdY2hTOG25VHEEnhB5DnBZVq/0HB/QDmw0jte5gSNNAFfDuw1RDvN
 6vxdDI/B+WY8yszlYAUNnPhoiWJpC8GPZsS3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=gYZz10QOH/TLSpK9xInSP5W9KjyrAu8lPPeUY1ToCJE=;
 b=oPKAAHIKryQnH3/X9X+CJ8DcqmYq/wtBZFRIoRYCd4jufp33M9pRl9GasRlPpx3DBf
 S+qyv3EA6tXCJJgwSOBLsKSK8VlAIBoaGjRKYZ4pWknHhzHmvoIdZGtLGCu49R24Jqqb
 e1Q6nufuh4JbihSHvgYo1qiEsvJk0vEgcBw8a66riyHUUxb/gwQyfnbWzfMhW/v03wWU
 8lsxMmfveOHpVto8YRduUGawtUr7+5Fo3RprHbX8xHm57CH/ObNsuWd9NDOPRxYu2PcS
 KxE2rhhKumtsA1YaadDtKIzycRNy4Q2Uabq6wvYM9TM4dBDXY1vUJKPId906AHqKxyxI
 0gBQ==
X-Gm-Message-State: AOAM532BN8U/JxU4xOAykzHltMnkqYvdbbHwNMzlopebfd82Pa4sPPge
 ydCCeP4ZQhnrha9Y31LSSXO7e/72BjIJq7q6BPe7SA==
X-Google-Smtp-Source: ABdhPJx0r1eGpKElyHXDzuipufR0h+pMIYXO/v3pEKBRmpQ1oxloy4TUZvZtg8REVo/F47kGgJfrsCMhXbD/8mXWsTE=
X-Received: by 2002:a05:6808:984:: with SMTP id
 a4mr4781026oic.166.1628620423016; 
 Tue, 10 Aug 2021 11:33:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 11:33:42 -0700
MIME-Version: 1.0
In-Reply-To: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 11:33:42 -0700
Message-ID: <CAE-0n52a8i-2oNxtqKaS+XGBE0+wcp0Jx05VgL2KnHoQLW-vDQ@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: add drm debug logs to
 dp_pm_resume/suspend
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

Quoting Kuogee Hsieh (2021-08-10 08:29:22)
> Changes in V2:
> -- correct Fixes text
> -- drop commit text
>
> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease of debugging")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

BTW, this conflicts with commit e8a767e04dbc7b201cb17ab99dca723a3488b6d4
in msm-next. The resolution is trivial but just wanted to mention it.
