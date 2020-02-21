Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E96166B74
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2020 01:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC466E1A8;
	Fri, 21 Feb 2020 00:20:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D256EE88
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2020 00:19:59 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id p125so263694oif.10
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IHr5qo3B7v5uxs0wZA0fZW6J9zqGy3IdsKd+NBLqxdQ=;
 b=Hz3Wvel0TrnLWu2KOGBLM37xIzOel8u9Z3LL3LKWhQ5uDvm2hmCI+8lAaq9dDcnzK0
 mmF29yC6bk6kCEp7Rp8Xphv7SaNuWSCpytm5t0gbTsUTgWYqT1kGf0Uk4snguMx7ktEB
 CUaU4UXvlG8DiQPZ0fLoxZ7q8pzZGa6twCkjkNgfUTBep5MTIzKNPNNZmjXvVmIuajDT
 x1oGn/KBMPVd010kg/4IBE9Z7pYnop4ImXcsjGIsjF1rqOEZh0XzY3XCKZGRIyEUPwgM
 dnOCLimGwLQYnIXwqYXRG3zAdpZoXpkT5LDSWOlqz/mbvst5M1heaxiNSpmi3QJ6N3pL
 qeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IHr5qo3B7v5uxs0wZA0fZW6J9zqGy3IdsKd+NBLqxdQ=;
 b=LjHdInRbXBVcFZXIlA8B5QAt3GVr4VWu27zt4raqlv1TlL6rTDldCdRjGX4nhFpqCK
 I7PB2KCbjlMQjmbk4x3MmJOoEf6O11kNSYCA8frQ2EaKX/Uk0l+IavCtTuW3fI41k0Ko
 ziXner5SUMrO6GUJQWDsoUN9BFv/h+hlsT8ME7Hp28Kcb1CmJeS6egBuAchrdXCB5xtH
 dt8/wfUwIyYLMaur8kPeDGmuTOZ7AtaI5dtPkypZo/l9MQ/4lw0Jz8mMNkjcMMoy3dfm
 0UDzNJszXWvBPbHbpbczNr8djtr/4htJtCKn0Lh5Hr+zk2863rYuXQQ1xqfKnLGgTLGY
 rZow==
X-Gm-Message-State: APjAAAUkrcd4oPN6Fq9jW+dIDx4GkHxWr7iHR+hIPGnupmXSf9trXPO+
 /6zIQpbpG5F+JiYGhjEfex472IKIXzLdGX8pTEniGw==
X-Google-Smtp-Source: APXvYqxyLS/9yBWFyxJu7nngbozjCnxStnGWdAIgQ8O7CZoqSKHHSFq255QaoTFU0a3hJMPv5SrYAZQF8EZ/aFXEwgA=
X-Received: by 2002:aca:c0c5:: with SMTP id q188mr3935454oif.169.1582244398771; 
 Thu, 20 Feb 2020 16:19:58 -0800 (PST)
MIME-Version: 1.0
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 20 Feb 2020 16:19:46 -0800
Message-ID: <CALAqxLW3PHtdFY20AStETme7sp-YLMLXBhqRyjOeLkQDSFOeVQ@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2 0/4] msm/gpu/a6xx: use the DMA-API for
 GMU memory allocations
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 10:27 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
> cache coherency issues because it is mapped as write-combine without clearing
> the cache after it was zeroed.
>
> Rather than duplicate the hacky workaround we use in the GEM allocator for the
> same reason it turns out that we don't need to have a bespoke memory allocator
> for the GMU anyway. It uses a flat, global address space and there are only
> two relatively minor allocations anyway. In short, this is essentially what the
> DMA API was created for so replace a bunch of memory management code with two
> calls to allocate and free DMA memory and we're fine.
>
> The only wrinkle is that the memory allocations need to be in a very specific
> location in the GMU virtual address space so in order to get the iova allocator
> to do the right thing we need to specify the dma-ranges property in the device
> tree for the GMU node. Since we've not yet converted the GMU bindings over to
> YAML two patches quickly turn into four but at the end of it we have at least
> one bindings file converted to YAML and 99 less lines of code to worry about.
>
> v2: Fix the example bindings for dma-ranges - the third item is the size
> Pass false to of_dma_configure so that it fails probe if the DMA region is not
> set up.

This set still works for me as well. Thanks so much!
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
