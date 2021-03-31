Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC5350A4F
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 00:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BF96EB9D;
	Wed, 31 Mar 2021 22:41:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E6F6EB9D
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 22:41:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j9so19463564wrx.12
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 15:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zL02aTh2+xB20mrzZTojWu/p9mboxJJMVbqdRwrxVWU=;
 b=adqroYbVZMOn6aywcuL5FiFj/TTSYhza0g/b3jWAXGkMbxgka2FAwP2vwkFuKh5YKR
 sBzIeT+qEa1cE8HG0ukQctjtt1Os2zzGE/bpKid0jlqSIorrQb3A4KuCGhvHAIsbMm/r
 K0Lu7AUyvzUA6cbYk1h9WWFaO9HeqnZkLoLhnPg2i9U5OX/H3PB3CH1o3KMrnyv7HkdE
 jcVD++Q0NuQp9d8GG3B5E0U6KPWh4W+UnxDsTquo1JARfUEjBHtEzss+Kds4RLOjN+Y5
 p2yAGvybkIlSHcnOo4Lv36R51cyXwC1+OH6oRyUgmsWAFtqR7Jhdsy9461shUQzIaYgI
 KV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zL02aTh2+xB20mrzZTojWu/p9mboxJJMVbqdRwrxVWU=;
 b=K3Ku49GEVOc3RfBf5NFqgUyL2yj/NVbMaMdZr0tBMqzc3feINZ1WYpKzhNwQx43os7
 uAl6ApBTJzw52uorsp4jEHyzMMWi89c/BYs2Z5S4WuqODwbipCpqDEqHEzlpsTzMRlE5
 +9gZETLE/cmZhUxNFJBWfF03jsdLw9BXc7G0vA5rOq4UZ53yiiX8w30YE0EEOZHVPpcL
 3mqpkshgyc0elIVZNLAFVxBF7ms4Ie3tohpZl1o+qlVmsUNp10ihcfhqNP953Ssf5LgK
 TIgeD5fUwDL6+UmxdllTXy8A3o2ceYlS75KN1pWyJ+8eY5DJjce1QtjUyjn0dx8+fk3/
 Ibwg==
X-Gm-Message-State: AOAM533p96DFVeRrfRdiIUYlQ+RMpUPAZk5vFlkdtN2z7DasYbaoOzuk
 8a/gX9A3ot1XKrsNqGP8kiL61B8uaGub5mQAGJTmpIIP6M4=
X-Google-Smtp-Source: ABdhPJzweIdnxhLeaiHOfcBP3GgWZUWJ0OWvZt5FEH6yBIZLAVjYG4OgES7RTLr/BWfJJImn3MtWWDxPyBcSdMcriyY=
X-Received: by 2002:adf:fb42:: with SMTP id c2mr6066632wrs.83.1617230467404;
 Wed, 31 Mar 2021 15:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210325143700.1490518-1-jordan@cosmicpenguin.net>
In-Reply-To: <20210325143700.1490518-1-jordan@cosmicpenguin.net>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 31 Mar 2021 15:44:31 -0700
Message-ID: <CAF6AEGuf45zpE67YEBjgtYWbrr7zGhEY6xvsZpwXSDM1OFoyeQ@mail.gmail.com>
To: Jordan Crouse <jordan@cosmicpenguin.net>
Subject: Re: [Freedreno] [PATCH] mailmap: Update email address for Jordan
 Crouse
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Lobakin <alobakin@pm.me>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 7:37 AM Jordan Crouse <jordan@cosmicpenguin.net> wrote:
>
> jcrouse at codeaurora.org ha started bouncing. Redirect to a

nit: s/ha/has/

> more permanent address.
>
> Signed-off-by: Jordan Crouse <jordan@cosmicpenguin.net>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.mailmap b/.mailmap
> index 85b93cdefc87..8c489cb1d1ce 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -165,6 +165,7 @@ Johan Hovold <johan@kernel.org> <jhovold@gmail.com>
>  Johan Hovold <johan@kernel.org> <johan@hovoldconsulting.com>
>  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>  John Stultz <johnstul@us.ibm.com>
> +Jordan Crouse <jordan@cosmicpenguin.net> <jcrouse@codeaurora.org>
>  <josh@joshtriplett.org> <josh@freedesktop.org>
>  <josh@joshtriplett.org> <josh@kernel.org>
>  <josh@joshtriplett.org> <josht@linux.vnet.ibm.com>
> --
> 2.25.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
