Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3EB3D19D8
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 00:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6373E6EB48;
	Wed, 21 Jul 2021 22:40:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4983C6EB3A
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 22:40:53 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 n187-20020a4a40c40000b029025e72bdf5d6so924200ooa.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KEVgavtFokaJseyLsj85tRS/d/rmuvKUZEz1jbsigY0=;
 b=YWntnAY45UIkoNTLLa74vviHMxh/jaVtTmvHPSSDb5RD2eo3rsagGUGXof2ePUT7dg
 kKHv+kyJqjE10h5nvKoL0VVytFjVHwqiPAAu7aB4hIw31vGX5D9/2Rp6FzkVLE+V4Vmr
 IbfnZswljUpK9UkXzyJ/jhjsELUfJxxMtjUJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KEVgavtFokaJseyLsj85tRS/d/rmuvKUZEz1jbsigY0=;
 b=Lv2qgzSU1M8iJVCksjSjrQfdWBVGCRA5sarzB8OKr7ngWKXU46MoaxnRnwqGJ98X13
 ter3qKy/WOjO8BlPB82xj85RNfMeTfvmXvIU5tdtHvirGeAyYfyIeMam6xTz35tg4cat
 82IxkdnTzXXnwdjNAEemsPYa6nq7X4/BY1tULai7P8k74zEJYhEZoV0jvHPciqQxUaMu
 Ny1uCtl8e1MerUkPX+x5Qn9t++XOG9Bseu8LRDRAnk0aEStjKHcJUTTyL6sDV1MbKeRF
 TOkvLpLKYqoRy3NCompgUXCTbLSMxdCQd0BC6qmsazaduGTCop9T5i9z+24VBxq+L3iy
 /rdg==
X-Gm-Message-State: AOAM532UNr8KD6zzGev+IdY0BnV/Hyyt4aIeEjs2qOK6cynCbX8yz8g5
 40Y4PmQaXFmbTsG/gMzF9Nt3px9xftJVIgoq54E2ZA==
X-Google-Smtp-Source: ABdhPJxntp+G+9rokY2CN2MxKmxY0rpDa6yDFX1UvyHoclObrnzcw8afQvfO/r7cISRj3JfakWdZ3O8HM3QzIH0aqwA=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr25761720oot.16.1626907252629; 
 Wed, 21 Jul 2021 15:40:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:40:52 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-3-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-3-git-send-email-rajeevny@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 22:40:52 +0000
Message-ID: <CAE-0n536DwZhxb6M1HvJHAiaChtq2vg1HfiYV+ntrjMVfpRxdQ@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [v2 2/3] drm/msm/dsi: Add PHY configuration for
 SC7280
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
Cc: robh@kernel.org, jonathan@marek.ca, mkrishn@codeaurora.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 robh+dt@kernel.org, kalyan_t@codeaurora.org, dmitry.baryshkov@linaro.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rajeev Nandan (2021-06-22 05:42:27)
> The SC7280 SoC uses the 7nm (V4.1) DSI PHY driver with
> different enable|disable regulator loads.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
