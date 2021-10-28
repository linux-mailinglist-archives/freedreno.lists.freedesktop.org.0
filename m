Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6443DB07
	for <lists+freedreno@lfdr.de>; Thu, 28 Oct 2021 08:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D95289B84;
	Thu, 28 Oct 2021 06:20:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D5E89B84
 for <freedreno@lists.freedesktop.org>; Thu, 28 Oct 2021 06:20:33 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 k11-20020a4aa5cb000000b002b73749f3cdso1798069oom.4
 for <freedreno@lists.freedesktop.org>; Wed, 27 Oct 2021 23:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6+eTf7nyr6M3KwEm+TOLweZAQxKtMfVD5JwzIPGapF4=;
 b=XFMvMVNKWo0K9tklL2H+PQ5pnRbAvZXkJu6OVqgEKFrzqKb/qBrXK4jeGJCuIl/2Rs
 ycXF/pYyFD7R3khkDEkpZo6R+ipPDYlxcQEIcRaMUSb/DuplmshZSHY9vfO4n/HZ8/Ir
 lxD4yIUK5obFrRuQqv5qF5INpaolMTU/WPINM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6+eTf7nyr6M3KwEm+TOLweZAQxKtMfVD5JwzIPGapF4=;
 b=6Bgypa6PrQW5WJP588a+KcVmsKHJ8YzPYue9U907OciVNL20UUm9vjhTt6JYrUxx28
 YouHx+p9+SupynsbXWqlPZo0Toz4W7GQyrcPsRwsshtBeqwBCWHb8uftp6YuKx++FRwx
 N36WFYbZZawlyYnKlldda5Kxxbihy9kghZqnL5YaGqy51hoAQzI7vOYkz/Wi/YQP5tAE
 5e1cjDKNxliwu+exlFWZs5Gs4Qo+SokIZ3RPNrXXt2aUHFTaS0ECEQYDoijDtG6++u+Y
 hNCOYE3XFt4XSZkViIgl9wt94hvu4dSlKycoSz2DyUGKhQzwzdg0ywwATTBrW4jT/bb+
 qbvw==
X-Gm-Message-State: AOAM530Wed2DUddjle21T0P5ld6SvljzV7BedAMs1QhwVnxcvBTOigdA
 Ledv7PRKFEaFXsH7d3/+K1FxLoD7KF4QUsfUMwETQA==
X-Google-Smtp-Source: ABdhPJyea8Fwx4YyKse423qLTPTFc+z3zOfjtneOqoZsNUJoAqTszW1lfetTqMDV080TNLNVBZYOcvECNsZXED/wHU4=
X-Received: by 2002:a4a:e94e:: with SMTP id v14mr1125894ood.1.1635402032695;
 Wed, 27 Oct 2021 23:20:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:20:32 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
 <1635386088-18089-2-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 27 Oct 2021 23:20:32 -0700
Message-ID: <CAE-0n51J60efae0yMvC_ZfxX53YZLOgY_K1cpA8PLPedr6hMBA@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Sankeerth Billakanti <sbillaka@codeaurora.org>, robdclark@gmail.com,
 seanpaul@chromium.org, 
 kalyan_t@codeaurora.org, abhinavk@codeaurora.org, dianders@chromium.org, 
 khsieh@codeaurora.org, mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/6] dt-bindings: msm/dp: Add DP
 compatible strings for sc7280
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

Quoting Sankeerth Billakanti (2021-10-27 18:54:43)
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The Qualcomm SC7280 platform supports one eDP controller
> and a DP controller. This change will add the compatible
> string for both eDP and DP to msm dp-controller binding.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> changes in v3:
>     - Modify the subject (Doug Anderson)
>     - Add sc7280-dp also to the list (Stephen Boyd)
>
> changes in v2:
>     - Sort alphabetically (Stephen Boyd)
>     - Cleanup residual stale changes in the patch (Matthias Kaehlcke)
>     - Modify the subject (Doug Anderson)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
