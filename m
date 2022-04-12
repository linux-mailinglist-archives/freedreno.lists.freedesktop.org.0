Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E944FCD94
	for <lists+freedreno@lfdr.de>; Tue, 12 Apr 2022 06:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6808710FE32;
	Tue, 12 Apr 2022 04:24:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285CE10FE31
 for <freedreno@lists.freedesktop.org>; Tue, 12 Apr 2022 04:24:20 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 12so17850041oix.12
 for <freedreno@lists.freedesktop.org>; Mon, 11 Apr 2022 21:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=wT1ipJ+z6nc0cV5pPdBgKr4CL6t1pZ10f3e64vOVaAk=;
 b=IzYw+aFrZYlAA3irCMBEMNlVetWN6Cvq/bEgM3Lo/0TkezivNTRXdVhVaADc9HZagw
 4pwlOwWufF8wBtrEoYbXfGM6mTBkfxWbVM9SgTIM6FeBIeCD/4yH/v8NP/e5h6CL/mis
 I6N7CIwas+HFuSJTLS2XUNrOdtf1d/DFTwtuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=wT1ipJ+z6nc0cV5pPdBgKr4CL6t1pZ10f3e64vOVaAk=;
 b=IkkHCQFtAhKWjBXjEfMPZKsqql9ROkuOBrEjpPjTMtD0nwxosaUHFhvYudx7Y662bO
 /6sNd5vKOYRWCc3TiuqwNRBE6lj/Whv4VtJqlV2AzB5DkcYM028FqftNm0oOGcU11LvD
 fsZauC3lgdebkQ/lYb3dU7QjXgirb538tcivHPJARHsTZl3hWm4rTLniGzJwl8Gy/jrI
 CiL7zSDTX6v+p3gWajCoN/Ec4KGUzoESXy4Zr/FxcFpoHuS66bPJS5aQG5/KcZW/uFl/
 +YFL4K0tVibBtLHAA3yxvkY0ZdaoV6QZSWGbfJkmh1pdSto7da6TAXa6Or9kdrKCAc26
 cgpA==
X-Gm-Message-State: AOAM533g4gThSBz2ZUQ9CihSXChgC+hNt1RD7gDVl3rjgj/89OlGYk7q
 cmVyh4CAfJRYpOHCpSabx0zBAl+MVIWjkJIkA94Plw==
X-Google-Smtp-Source: ABdhPJwQbxRfXrEl+yilyKFLG7gYsvTkWk6/J2NgE5ytQbVcrhyDZVAFL6sku9A05Sz3mgEknv8z6X2l0idsd9GHrnE=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr922783oie.193.1649737459493; Mon, 11
 Apr 2022 21:24:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 00:24:19 -0400
MIME-Version: 1.0
In-Reply-To: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649451894-554-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 12 Apr 2022 00:24:19 -0400
Message-ID: <CAE-0n514Cv1ruTO_dN9mSBtjbYNzscty479QJ2tyXt=q8WNE-Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: add fail safe mode outside
 of event_mutex context
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-08 14:04:54)
> There is possible circular locking dependency detected on event_mutex
> (see below logs). This is due to set fail safe mode is done at
> dp_panel_read_sink_caps() within event_mutex scope. To break this
> possible circular locking, this patch move setting fail safe mode
> out of event_mutex scope.
>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
