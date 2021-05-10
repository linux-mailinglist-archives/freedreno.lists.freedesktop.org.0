Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E373794A8
	for <lists+freedreno@lfdr.de>; Mon, 10 May 2021 18:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918CC89BF0;
	Mon, 10 May 2021 16:55:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D3B89217
 for <freedreno@lists.freedesktop.org>; Mon, 10 May 2021 16:55:10 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id k25so16399662oic.4
 for <freedreno@lists.freedesktop.org>; Mon, 10 May 2021 09:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=sVOf3rnQQoCxErFwACuycQahXXh0Mo2aHzmf0ZUSPko=;
 b=HQy+UmcK03DuKLfDIAryB3qD1Mil6T0UDB98z17huWfwRWDjMSI+T3c85L9CGSPeay
 DU+Evt3AJhioziDQCNcCJSrpcKj5BsrsNIscNv7h4V1kko81oWGTehQmGxZDnyW4CUe5
 yw9wsqE9adjtg4qamSlq2FebUWGdDllpv8PeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=sVOf3rnQQoCxErFwACuycQahXXh0Mo2aHzmf0ZUSPko=;
 b=WX6lEq6y00v3uDq4VbxbPVS3AudXBZfc6+zSg1oHe22w4HzGuVUNLRo9K76McqS+Gy
 +C2EmPezvJh11dneypbqJaJ0lvhw3dEoMkfUmEAvGQJWKtcKzFExCd8/fM1jCWt1sW/Y
 s4y+yCsoSsh4fTQeeIBi2zctRG0ZlALG7xL8UAkhZS38Bk+e2uxu0tSpzoOdbMNhG1AP
 V41paZJFE+CWi9igrs4icOw933kmI5hE11zG7QZ/MRtKUCe6z233BNoMTLTHoR9/0UIC
 qDD8Hh3M/rmL25yOkJydrHRZiYTZpyTJzUilwcQExTC+IvYF29zXiqPuY6pTJD6Q52o+
 qkkQ==
X-Gm-Message-State: AOAM531yNUT1XzeyaL8jBERVE2TPwWbrmATvmL5jd42S/8QWZ3n/AyiC
 ssJQjpHCzm8e2MZH4E4zaJbHeVJOz4U+SonXhjlNKA==
X-Google-Smtp-Source: ABdhPJz5RLoBLot1CVzxTjJkBJp56d5KozQuBoFhRpWF7SSXLzx/nTWQb1uAogO6gMhleLVVnQnOjunOH/YyigS6+KU=
X-Received: by 2002:aca:211a:: with SMTP id 26mr18395539oiz.19.1620665710136; 
 Mon, 10 May 2021 09:55:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 May 2021 09:55:09 -0700
MIME-Version: 1.0
In-Reply-To: <20210510063805.3262-2-thunder.leizhen@huawei.com>
References: <20210510063805.3262-1-thunder.leizhen@huawei.com>
 <20210510063805.3262-2-thunder.leizhen@huawei.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 10 May 2021 09:55:09 -0700
Message-ID: <CAE-0n52a4hAsg0bq-1PeL=gK3uFQ0mkvWngdfA_NqdhgWg6tuQ@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Zhen Lei <thunder.leizhen@huawei.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH v2 1/1] drm/msm/dpu: Fix error return code
 in dpu_mdss_init()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Zhen Lei (2021-05-09 23:38:05)
> The error code returned by platform_get_irq() is stored in 'irq', it's
> forgotten to be copied to 'ret' before being returned. As a result, the
> value 0 of 'ret' is returned incorrectly.
>
> After the above fix is completed, initializing the local variable 'ret'
> to 0 is no longer needed, remove it.
>
> In addition, when dpu_mdss_init() is successfully returned, the value of
> 'ret' is always 0. Therefore, replace "return ret" with "return 0" to make
> the code clearer.
>
> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
