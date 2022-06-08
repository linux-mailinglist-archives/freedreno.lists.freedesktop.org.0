Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FB6543F07
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 00:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F295C11A5B0;
	Wed,  8 Jun 2022 22:14:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0AA11A5B0
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 22:14:55 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-edeb6c3642so28995960fac.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=4+3RQXUOPtCpLvkD/U0erPbjIdgGtkmXEv+DgUOZHBk=;
 b=kD5nxNFk80W+73EVv5maekxoUggnhB7L4tjOpUL4RRMV5c6rh/qT1Rt1SrPD6LfQi+
 Spbena1c1XCLUDtW8Sh5BOJhqkJRyiGnBFMLU3M2EgtcdLie4f4a7td17XlNsz7/RUnl
 PfqlebSOrrHdXbIIVyL4gF+Qo070/pnIZmwd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=4+3RQXUOPtCpLvkD/U0erPbjIdgGtkmXEv+DgUOZHBk=;
 b=KsD/eviXUsv6a6Imrwhk1bm2fQfzNj82r5mf137j0je8bLW6Ank4FPsOARH+T9hX1g
 pGxh4mXzsYcZiUV6GzG9a6EFb4mUHxuIc9m3SraO4Y9Rr7M6MIi5szE9SFXXK/7yUnaj
 nAhWZPVpWZ230a4MqcbiUM6907sX92pUqN1SCd4m8VjqtSEwRkAepZhn87JkeYJ++E0U
 b2kNEsMGcqzMJVyo1ZZ7hjxOrtQmSySHwCz48DzbZNNQJEM2jIDcsY9//LUeWoTPmHdv
 +fjESZYZt0/6UCUsKHUZKF46MJejLa8pEYOPJrPmiePMVKuSIqVEK04ZZAFmjR9nMQOp
 JL5w==
X-Gm-Message-State: AOAM533kEO3+Q2NaFhMUH9kd0PTJCKHnWYXHA63nSOprXy8kWdOjTWp7
 GPnYxeNlCYjJK6YSVzZ3l9slUkQa9T/evPdEb/OBww==
X-Google-Smtp-Source: ABdhPJyqsGvOKTE4uunfCR1Mb+T+23hK+RV3b+F13PhuhOCuTw0rP+YUQOmxZHfZGkHHt9+RtkGFHec2aKtLrzEwEeo=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr85785oap.63.1654726494871; Wed, 08 Jun
 2022 15:14:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 15:14:54 -0700
MIME-Version: 1.0
In-Reply-To: <20220607110841.53889-1-linmq006@gmail.com>
References: <20220607110841.53889-1-linmq006@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 15:14:54 -0700
Message-ID: <CAE-0n52aJC_LzT_cYxQXKEpcE58YqCbT7jW0iEaaxtbW9jL4jg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guo Zhengkui <guozhengkui@vivo.com>, 
 Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh@kernel.org>,
 Sean Paul <sean@poorly.run>, 
 Xu Wang <vulab@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp4: Fix refcount leak in
 mdp4_modeset_init_intf
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

Quoting Miaoqian Lin (2022-06-07 04:08:38)
> of_graph_get_remote_node() returns remote device node pointer with
> refcount incremented, we should use of_node_put() on it
> when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
