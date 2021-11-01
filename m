Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC274441FCF
	for <lists+freedreno@lfdr.de>; Mon,  1 Nov 2021 19:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0926E202;
	Mon,  1 Nov 2021 18:10:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEDB6E202
 for <freedreno@lists.freedesktop.org>; Mon,  1 Nov 2021 18:10:23 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id g125so26110367oif.9
 for <freedreno@lists.freedesktop.org>; Mon, 01 Nov 2021 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=RTpcjCaKMjk8wOfkGg+XhDUUHXGzz0r5LuC/nlABn74=;
 b=Hms4n8EsBYjDqEWRwfdorGPR19Sl0b3GXGDHqXv7432wT6aufk+qulIlNLvHRxWc7Y
 6GqpCN/WAvrnAbLSSgUR8ItaRk4yqFg2tqM2BQjivbc736Aqte31NKEF7KwCFIxJWVEp
 h49MfXiHYM8ZfKMRwLGJRHnF18Z+2mV7PY2yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=RTpcjCaKMjk8wOfkGg+XhDUUHXGzz0r5LuC/nlABn74=;
 b=MVA4tRLezNSYg+DnspCFl9OnO4cMnzbfPl8JAisuHntO936uoshzYY5trcXCaWhdrF
 UkJhmlKv4wzCS4MeZP+bTB19UBjWZyqVNGmQ9Om5Cb/NkQLO50jXZ+7iuGZb5f3B7cTM
 YQ6LuH2SOlq4ZsWB1f9ltDHRk3muqnkrGbam5LIEnLpTxNO5Ifw6HoEJIAVvLv0MIaQz
 NNI8t5IG3SmHI5fN8rjEFLO8EnUx7jMevmYrxA/Q2MUnDaPS8tBhSFR2do8ymAsijxdv
 6VRMFnBE69RD9jKp6trfv/WwILcYIrEwCRTiYk1VwTYaVSsV8dW65nfAKS7XivXgbslL
 aeBA==
X-Gm-Message-State: AOAM5322bkPxtoTYEOEabeGHbXeIid3HgARbg3jTOtAKDWf6L7updElT
 7+YxlbEpopEykxR5qmkdOnwA8bHC6k3vIjloAhkrCg==
X-Google-Smtp-Source: ABdhPJzgFmKoi4uMfFK3RymVte6R4WSjg8lMx4INzmZ1qraDiHERExAQVxP6DSOAOu0WpWxcuwqOAr8FQwmKA+sd1BU=
X-Received: by 2002:a05:6808:2307:: with SMTP id
 bn7mr519321oib.32.1635790222358; 
 Mon, 01 Nov 2021 11:10:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Nov 2021 11:10:21 -0700
MIME-Version: 1.0
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 1 Nov 2021 11:10:21 -0700
Message-ID: <CAE-0n529Nfp7rOA4a4dtvh83rPxjVQ2VK0uDORgzOWmSsDa6rA@mail.gmail.com>
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: set default num_data_lanes
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 Nicolas Boichat <drinkcat@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Philip Chen (2021-10-30 10:08:50)
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
