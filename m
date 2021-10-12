Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E4B42AAE2
	for <lists+freedreno@lfdr.de>; Tue, 12 Oct 2021 19:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6BB6E901;
	Tue, 12 Oct 2021 17:36:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF086E99A
 for <freedreno@lists.freedesktop.org>; Tue, 12 Oct 2021 17:36:31 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so237651otq.12
 for <freedreno@lists.freedesktop.org>; Tue, 12 Oct 2021 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2BypScO76h55G7PPwXnggV0DBtGQ8bEd9vyWr6bUXKE=;
 b=Wk+QXyGeOJld76njFrWWdXYkW3GKfTQ/CyXWZkUGzuyWPJX+Pi+MoN3lO8gWfd27YA
 XEPw4irp+IJnOtcZz29Vo+/QPkJ65ex8DejKLsHs3fsas3yab01i91K14MykMq+BJyb+
 qrZxf95YrZgFCXZtjSdsJwzrWfJKTTJPnuGOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2BypScO76h55G7PPwXnggV0DBtGQ8bEd9vyWr6bUXKE=;
 b=r9RnwTtrXoTb5PteZEN7Hg248Se68gAdsYJUsRowUo0v7yyNjbH7FO/J2NHc7pj73e
 CGFvHsrdz+zsF9jyAulrAFPzFupD3Od7QR10VZSXjuDfbg6NSqQ/iPWEgfqzJa6IPf1C
 smJNBkn2dcGpl9t/Qr1z24goI8O79+556cy4E6mpUb2eNyhUvkYt1SWfUJsmL4zZEFXC
 moNNytWCeC0g7iE3uTkX2HZDtvMSecItTe5bGaftOEFF19tYznGVWy6VTifTip6W8ys5
 RUEXlGcHW06dZDSXMsXpYkaaKc6G3/ul7rAu+ssuCFMGurzNvWCak7lzjZHB6bA+TY/K
 /hjQ==
X-Gm-Message-State: AOAM532XMKPgJONclD5ACCzRhYjAZoDp7sz1+RABu7htQTQTUj+sc/dv
 AuNJ+Qruzs3jX6BGioQMyIJEObDghbGzG2DaBUTuaw==
X-Google-Smtp-Source: ABdhPJxNOhgeqTAMjp5PAp6NyMFEPhaSaElT5ghTzkghPyWvKz0oqRQxrlR4ntBvFAX5KBLIMoaGbJbsJGSY5ELjd44=
X-Received: by 2002:a05:6830:2317:: with SMTP id
 u23mr12874222ote.126.1634060190606; 
 Tue, 12 Oct 2021 10:36:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Oct 2021 10:36:30 -0700
MIME-Version: 1.0
In-Reply-To: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
References: <20211010030435.4000642-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 12 Oct 2021 10:36:30 -0700
Message-ID: <CAE-0n51CoX131DsDWZUxWoCu6c+HEm4HbK=SrKraqhDqFkc6ww@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Use the connector passed to
 dp_debug_get()
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

Quoting Bjorn Andersson (2021-10-09 20:04:35)
> The debugfs code is provided an array of a single drm_connector. Then to
> access the connector, the list of all connectors of the DRM device is
> traversed and all non-DisplayPort connectors are skipped, to find the
> one and only DisplayPort connector.
>
> But as we move to support multiple DisplayPort controllers this will now
> find multiple connectors and has no way to distinguish them.
>
> Pass the single connector to dp_debug_get() and use this in the debugfs
> functions instead, both to simplify the code and the support the

s/the support the/to support the/

> multiple instances.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
