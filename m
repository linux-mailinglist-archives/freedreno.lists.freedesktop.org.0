Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 086CA486FA5
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 02:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B29F10E6CB;
	Fri,  7 Jan 2022 01:20:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9D610E6C8
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 01:20:52 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso4994798otf.12
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 17:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=CxOVaVhRsLRq4HYjShTRxL0ueYps3B6EUDEkdRDY66M=;
 b=Bc4V1bTXXuzXBKN/0105snRyrQuze8wvwlkzqC1644vLFWsn3zSMXhMAunlIfW1i/H
 H2iTVBRkzSk5P4Kl14I28gES3f/2FHaIuUHsqfrWbdlMKP5b1GUw+WYkFMuYk5kUQqwz
 dmHJRUMEqeILxaYz4K3Ga9ncN7YdfSOCSRoeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=CxOVaVhRsLRq4HYjShTRxL0ueYps3B6EUDEkdRDY66M=;
 b=2cKg5J+Uyhz2Pu7dfkIBYbOump82gPG1dxtT0gMs13aZoH2jjYVcNHUPH2b69tgq0d
 rJWePmgaSCKl5oUMc+qxDVtanhzE3c8Up9dzFPHrKvg6B3p0LJ1VmpB3q7A2fC+DQ0PG
 HNlPV9ago8zErm24B1ECed7df7cFV5D8YHStKya9MHA/2FzZzDnyOC8Vm6x5LpQayh3F
 XFkXKJDgQcQyJXL+jRE0HdmUIwSx8mRY5qr5Pm4ujvrEmcR9M3wKMjXTGLd+xdP8qmR5
 E2I1gGw4edEfkRPK7C6GGQ8DrEZetjJNuFA7LoGLYlBauXWMDFo3xSxpU3sEd0+Q6Rd9
 emaw==
X-Gm-Message-State: AOAM533WpT+w2tmV2lwgm9YS6ASa7E4JJa6656CY91YzkwDILq0uzp1m
 dbIgLGX8UAtoipv8wUYybYPaqCNZoBmV0pnCLkkhnQ==
X-Google-Smtp-Source: ABdhPJx1QQDJrSBFz4xdC91jJMHJuO28JfFvcCm1pIgqyb9rNoMZxVNCuSqnuEPrtm/rE8qVSc3AUvrVc76Q71cv7Z0=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr3971287ote.77.1641518451931;
 Thu, 06 Jan 2022 17:20:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:20:51 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:20:51 -0800
Message-ID: <CAE-0n50SzQY1pujP5owR60CCa4at6mgpDXMqhwkwFnhQaY+Dqw@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 4/5] drm/msm/dpu: stop embedding
 dpu_hw_blk into dpu_hw_intf
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

Quoting Dmitry Baryshkov (2022-01-05 15:10:30)
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
