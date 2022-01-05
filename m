Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EEA485C61
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 00:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC7410E49D;
	Wed,  5 Jan 2022 23:42:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8600F10E497
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 23:42:31 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t23so1333430oiw.3
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=BlMu1CysniMOf49rg6aElEJvFhN3Nt4imzu3+q/s+vQ=;
 b=fo8LvVX9fWJ8F1/Q3dncllwCe9UqzI/MeZmQgRdDpS1WQj3biFYa+gTn17ecboXHtd
 cGgag0bpPheib6NMF3GR0WaOe9yY/NmsKfdG57SHyViPdmA8L9E3VxelNtHyacVARr5b
 wUsQyTwnUHfzdhq8K4QcWhqN9OVUe400Yj3hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=BlMu1CysniMOf49rg6aElEJvFhN3Nt4imzu3+q/s+vQ=;
 b=DZoTvTizduf6sq3YuIlqIYWUVRP4L2NR+rYhgBJUZCYEzn1CQa6BAmygaHfIY/5Y/T
 WQnGxcTw0fuYYyF/Dy/sZYhm5Dy3QgQq8MSr55YqzzsM3Z3a0V9hFKXOoqp9SBOiy3RF
 4Drwn00JtD7yBXX8sBtT37IJTWUC5jPU9z3eY4DAt6l8eTQK9ajuDyqqHhE59bvZ25q4
 /L1BqtefV3KU8HN9UbNYFVkd6xqEkzhfyFPriyFj1D3Nf+LBsc/Atzp13lAvN9l9hHym
 5JUS0x9I9WbG0ME5A+5M/NYV4RFkPFIzeK0jja7dQLCzp0lcJhYV8bbZG3qT53Osxbx9
 Tkig==
X-Gm-Message-State: AOAM533oyC1WCdUd+fqsp6xAkplYsAuI2DhS3WMd1hCB+4M0MaikAMA3
 4tSyDF7sAR/USQ0kJXKRbqYCU/ukzqHZcFyE4Stbbg==
X-Google-Smtp-Source: ABdhPJwkqm4yFPgwfgyjBKBAe2ueIE2xGw328/xMD5T2gGFk60m1dpDSonU5lDiPkZj0Fh8YTBMlICE7176XrlHTnyY=
X-Received: by 2002:a54:4710:: with SMTP id k16mr4333140oik.32.1641426150855; 
 Wed, 05 Jan 2022 15:42:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:42:30 -0800
MIME-Version: 1.0
In-Reply-To: <20220105232700.444170-2-dmitry.baryshkov@linaro.org>
References: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
 <20220105232700.444170-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 15:42:30 -0800
Message-ID: <CAE-0n51ibtmZWmxjfSVNprJQZjttFSqGJ7Wp8ifO_WnNiozn3w@mail.gmail.com>
To: Abhinav Kumar <abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm: drop dbgname argument from
 msm_ioremap*()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-05 15:26:59)
> msm_ioremap() functions take additional argument dbgname which is now
> unused.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
