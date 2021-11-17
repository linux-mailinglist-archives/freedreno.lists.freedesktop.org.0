Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4C454110
	for <lists+freedreno@lfdr.de>; Wed, 17 Nov 2021 07:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531489B3B;
	Wed, 17 Nov 2021 06:43:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D708789B68
 for <freedreno@lists.freedesktop.org>; Wed, 17 Nov 2021 06:43:28 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso2999732otr.2
 for <freedreno@lists.freedesktop.org>; Tue, 16 Nov 2021 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=//I1TVp7dTuZFMgwOKyJoAu2cQfvXhC1d7f5K65wAYg=;
 b=W4+dGHWHFret9QtsEmcwlFjLqGEyyi9t7/oCkJZ/TwkTYuYEa/jV1aBJZC87aZFH+Z
 ZcwfLRewlOAYtKlQcrcRTwVVUovIj8uV2Ks+n5lVYIbDuJKeK22Y7wufVsX+8XFaMG9j
 x8SAYO9b7shYj3pUqD4qzMX1wOtDq01iBWKQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=//I1TVp7dTuZFMgwOKyJoAu2cQfvXhC1d7f5K65wAYg=;
 b=e91TzbmR+Eq/TjQ1Jbep2wBC8ZuCzddZUxtmJYuZ0X5AiaD7BDIdw7XuOYUsjjCLLj
 mc0IZP5zH2fCry4sCSCRH67dXUwzp3xim9ttB712Y3RNU1WqGj4AHNbkv9fGAaisPyiA
 jn5u51RIhX85GJ172745Mmw81kTHP75lksr8gIMJXpVIOo/D7UasSWftU26lYX+MDK42
 c286h/9yc/3fucvBe411KjyhlDxq65B0tdijVNtOxiNNkbG7tpUryb34As0njVl19PhY
 wF4Mx7657uQvWa4YiEJKC2mNOLDr+tvpqGP7lPApJNYNpcSAP2HHNHcxtEKT6X7DLemY
 iOyA==
X-Gm-Message-State: AOAM53286kPUpd4pTjKYwhPQ2Xx8bGLkpPrna4mma5xUCo5Zl11eVoCS
 kL0RB/zzbKKNkt0omkEtieXf4GpO8RKpkJGIH/kMxw==
X-Google-Smtp-Source: ABdhPJwsKo1fEanM9NX3oCL5hyNK8f/aAd2sJcSS0+gxRvzjdO1BOo0snB/j/kUcnxhMJsS/ejuxg0vZQzHnPyroIEs=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11596628otl.126.1637131408127; 
 Tue, 16 Nov 2021 22:43:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:43:27 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637046458-20607-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:43:27 -0800
Message-ID: <CAE-0n50cjm3O+i12Jxvfe6DdVDVG3cRrmz0ej6bMCKAeL0zHCA@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/3] dt-bindings: phy: Add eDP PHY
 compatible for sc7280
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, robdclark@gmail.com, seanpaul@chromium.org,
 quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:36)
> Add compatible string for the supported eDP PHY on sc7280 platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
