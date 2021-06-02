Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC8C399683
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 01:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045496EE9C;
	Wed,  2 Jun 2021 23:52:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4313A6EE9B
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 23:52:13 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id d21so4440338oic.11
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 16:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=O7sUSvVx4X9Ue3ybXZaq3WZClmga3LyfA3CPoyVQ7pA=;
 b=KaO68w8HrAKn93zPkQaVfAuWyiF8UF7ryWsJU0WXjR5fysUaBY1gUWQGsPthtslf/R
 dBA+coYoduNqCmqyku+m4pfBR+jcwA05SKTnWK++Mwku/2mgyql4oybFlb2UfuVvpqyX
 ii82e17MwzT5sLFPPCsXI9PgffSsDPzKHe8ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=O7sUSvVx4X9Ue3ybXZaq3WZClmga3LyfA3CPoyVQ7pA=;
 b=A7LrC+tXN+qnn1AYRc5Y3eJfPBO0nybOKZ5FoSQpdEsF3YI1pCjp2e3cnVCVUkeFRd
 AWuf8Z4PXJv3kXGTbqLEPwjjCWgXocRYN+TA1TX/R7G9K82AnfDRKjclBAto3fB8OJw3
 YH1Qw40I7uiZwLQotXnx20ax8XQSuJPoUBo1iDaclHaqrg1p5R2zIO4BecyjobW8tPe4
 eE+8DFxk27l/1GcpRJ1/e7qKw3RkMuQJp/VhCTFvh7tVuOQWyv9jRimG47PA6qejrMIy
 QasZx7Y7a2SFoUXQXSU+f5DkDe6XMUE22dOPG4/G1+2vhiUEPPpwG7xKaXgm8n0mlsKH
 NG4g==
X-Gm-Message-State: AOAM53325JyJYy8N9ulTBFEKiSfCZfCPpjztDmhZ5FrawLPmd/Dj21PJ
 yecwM6atvuX1mtFitnfgZKlxMQgMqHPxifvGjVXbhQ==
X-Google-Smtp-Source: ABdhPJyEpvV7pUBImKOSlEHTC9uSRojsd37dHEdkjH80CvIPIOyDLk/7FhcUDuDurpeY/zPKdQJPkGeigbtQkdmu7Uw=
X-Received: by 2002:aca:654d:: with SMTP id j13mr5573390oiw.125.1622677932502; 
 Wed, 02 Jun 2021 16:52:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 16:52:12 -0700
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-14-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-14-lee.jones@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 2 Jun 2021 16:52:12 -0700
Message-ID: <CAE-0n53PvVjUzXsZ6etSAOEOjCD3MV5gXd6YmtfrjPaO0kEdkQ@mail.gmail.com>
To: lee.jones@linaro.org
Subject: Re: [Freedreno] [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly
 document param 'dp_catalog'
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Lee Jones (2021-06-02 07:32:47)
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
>  drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
