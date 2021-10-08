Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6AA426219
	for <lists+freedreno@lfdr.de>; Fri,  8 Oct 2021 03:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D186E082;
	Fri,  8 Oct 2021 01:37:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469D16E081
 for <freedreno@lists.freedesktop.org>; Fri,  8 Oct 2021 01:37:52 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y207so8502234oia.11
 for <freedreno@lists.freedesktop.org>; Thu, 07 Oct 2021 18:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=yVAkjeIZi/RbzxYhdceixworGw/JG9cDOxqyScssBzU=;
 b=CJatcbsfmIt8VOcjDy6VK/c4MgLoP+YSH4Vh+1zhbf06EXs5ffcEmOL36kTm2u5Fp9
 4KUU/PEHnASbvGn2Rb9wxHUHv7VSrxFVcY2KR8okjiELFtQxff/HUcc9DgQQjw1+r+5u
 vk68wSomU4qloYAhHg38a9fccY7A/6pfYKeWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=yVAkjeIZi/RbzxYhdceixworGw/JG9cDOxqyScssBzU=;
 b=k9YNBpbD8gJjvUbpPxIqKS9R+NNQAqT0EXTxXMIbKhpG2/wP36hROAM0dsEEFweMzp
 SFhjmkl4VSBTu9vCWwJI8LxMOnITfRd7yME/g6MAAOteJNLiln6xrPbzaRJAWJP+hFaw
 TX7/VvjtNB+4yLB8aPMMuKhvM/ubx9rs41fzrFkFyL+Ad7UQSn6WruCWKVtLM59x76fl
 PTrMviyDRlB1RhOoNAyMI6v1YgCt9PoKyzlV8l+YxOlQyqAj2FrrHOLnR2yU4smMA+Ld
 PYbMtWwtvaOxjHAkXf37nhUQKMEGcn/jOq0oNljCKC6DVrCVibxgxKhq9r6SXh6bVjZb
 UdSg==
X-Gm-Message-State: AOAM533cFaS8yHZM0KrHAKp0ZCB9XF+4Ae9APij6IorgCys27UucEBf5
 klcjjRMte3a67PBWww3KWNFw6FbYOz66WzfsMEZvfw5b/3o=
X-Google-Smtp-Source: ABdhPJwG27QOLOYB0BYRIv+qYzPsjyc+Fm+gkPI77N3rDpZ12HYcKlJ51jPrBtfX7D/I+FlamQPJfMTeoN7KcVFQPow=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr14522862oia.32.1633657071628; 
 Thu, 07 Oct 2021 18:37:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 21:37:51 -0400
MIME-Version: 1.0
In-Reply-To: <CAGETcx9+pL1DxDyZOBGFFVsmb0haAzJTFtyQFEO9ab9u8N=FXQ@mail.gmail.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-3-swboyd@chromium.org>
 <CAGETcx9T59dHXodt9MW=tTV_hYhtNOZzYFT=35D--VN7WJ0GqQ@mail.gmail.com>
 <CAE-0n50YqKr1nKy-4WaxsfuwPiJ5kZcf46t-U_4i-TpfXzOX1g@mail.gmail.com>
 <CAE-0n532XYgT=dTTCyLcwikvxgUyGi=TcybDh=v3wQTNb=wqyw@mail.gmail.com>
 <CAGETcx_0GRg7u3dAxP9u0qO-hfJ0N3V44CGLwFFX1kVxZ00g+w@mail.gmail.com>
 <CAE-0n52ytNtf5atojYrLviuAKOt3v+mLVoPeqtRUf-6uBpkiJA@mail.gmail.com>
 <CAGETcx9+pL1DxDyZOBGFFVsmb0haAzJTFtyQFEO9ab9u8N=FXQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 21:37:51 -0400
Message-ID: <CAE-0n51DJc9FNDZM-ybsP8ivoGN6ARsJN_MALr80SmDn5FXLpA@mail.gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 02/34] component: Introduce the aggregate
 bus_type
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

Quoting Saravana Kannan (2021-10-07 18:32:20)
> On Thu, Oct 7, 2021 at 6:24 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Anyway, I think we still have to do a rescan so that we can try to bind
> > the aggregate device. Is there a better API to use for that?
>
> If you know the exact device, you could call device_attach()? That's
> what bus_rescan_devices() eventually calls, but you skip the
> unnecessary looping over all the other devices.
>

Unfortunately we don't know the device. At this point it's possible that
the aggregate device hasn't even been registered yet.
