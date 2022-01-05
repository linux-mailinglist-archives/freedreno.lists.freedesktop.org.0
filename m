Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1FF4859C8
	for <lists+freedreno@lfdr.de>; Wed,  5 Jan 2022 21:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEC089341;
	Wed,  5 Jan 2022 20:09:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20BB891C7
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 20:09:29 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id be32so551910oib.11
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 12:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=w5io1mhY/CuWn+JWdMxz5VGckhBoDiBFygEqCAudt+0=;
 b=ByFqQpR9BH6VLpD3Y7uVEe2w3xHpWWTCubZouHyzxghEmg+Cg5+b0oATDt3XwiDioS
 5ekjUrLOwlH+49O9isEHigY9nkIyzRk9KtOZ2sQXGBVjLEzIOmGJqJVXQaRj/1Ai8db2
 XRcKHZbdgV1yqyNRhIzuRRdkKz6LyvHfMMj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=w5io1mhY/CuWn+JWdMxz5VGckhBoDiBFygEqCAudt+0=;
 b=MVhHRS+bSNVvAzOwywBpUcxISMoVEaEvh4dyXfHBoqzwYeSqJK53bPIk6eMIw+hqPe
 U+yA1/TdR7WC5qgy9XG7CdXn9B1IKWFZj1YDO7sCDXvZKp8OEpW4+KB3gA/+gJ5dGRJ5
 werxjrdi97sifVl1jKdIrZpRaGB7rcP1XuAxusnSBzb5DJ+AWRHuWUyrcIdvMrXVgJE+
 0mrWgcZWE4CuJsoPsQYyoPDMO/5zGfXzhnKpNQqXym8QoRvrkB1OOI5C5iDBh9rtpFOE
 pBPTHWt+fUhicjC0kFVWMwAYyyIE60qfKD/u9AaTyxQF5xrZvy/41mgiKAF+CyediMWp
 bdRw==
X-Gm-Message-State: AOAM530hKmNi36QnKNRzsae35SyE/I30kv0igg1jWHIjcOmbjkXgU3gE
 0XzLiEE+eJofQcrROKu19HMugKVYWscRelO3O9nWqlIrJ8M=
X-Google-Smtp-Source: ABdhPJwjz8XD8bGgh/xlrvEPoae5Md2PsKfYPTixPnc9jD7I2Lt5h5lXbD1+Ynwc+vpJk77ax73vcuCTauiJOOoyfkY=
X-Received: by 2002:aca:4382:: with SMTP id q124mr3813128oia.64.1641413369023; 
 Wed, 05 Jan 2022 12:09:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 12:09:28 -0800
MIME-Version: 1.0
In-Reply-To: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
References: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 12:09:28 -0800
Message-ID: <CAE-0n52jDxkfYbsQPzKjSeD4rimTz1p2gaDRFpK-LLxxNV31Ow@mail.gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, quic_abhinavk@quicinc.com, 
 quic_khsieh@quicinc.com, robdclark@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Fix a potential double free in
 an error handling path
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Christophe JAILLET (2021-12-26 07:14:05)
> 'dp_bridge' is devm_alloc'ed, so there is no need to free it explicitly or
> there will be a double free().
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
