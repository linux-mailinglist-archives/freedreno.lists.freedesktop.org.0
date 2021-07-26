Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0A3D68B1
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 23:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FF073001;
	Mon, 26 Jul 2021 21:31:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF1C6EA00
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 21:31:12 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so11425048otq.3
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2nXaLs/a4QnWZ6CsBprHQUZ0PT34FLzVCZM7MpduHa4=;
 b=gQGAGt9eEIgv8OU25omKBzR8PLkHSLWDrPryqtU60qn5PueYnFkrrRF5sZmw8zvbW8
 VNvqSxzJKU4JHj3qQjp0n6PyQtHvjicciYGeODKdQPIQW3jy2u5oycvxVco1k8n0Ln2x
 voLvNquo5k+uiomYEnvZohtgMYMykoPKM0dHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2nXaLs/a4QnWZ6CsBprHQUZ0PT34FLzVCZM7MpduHa4=;
 b=N1MP3wALm9jwPxqvbFgYPe4ur+MYc/DjlymHqrGdGpq8jgbutlgRjuvlS4xeofYH0M
 IN3pTXL5elfujZ4u6ga1zw2XYxuu/sNehhQ8YZf/Y/xCD0MN2lmKoMkzUu5j33FwlPpG
 v5PFlk+2NA9NDnE9eGlCIxBkoQLh4+7yDM/JYiIY4BvgNEEOMtueGeiPzDzmDumztHdo
 vyk8tI0gb6HEf5arKrL0vBwjCs0iZTsAQ/0kF6sihMssSwIPROK7ThcPmls0/zDWfbc+
 jI94I2F2yM29+CcZzurrjS35cf+4/BUcvj2hjlYfj7ky3VwaLHhskB3bKGPaRbnF1vPp
 P5Uw==
X-Gm-Message-State: AOAM531UjD7bhe4lDgQulCOh/viblxMYuTjmJC+9Np466owNa6vRL7LB
 Ill38SleHjbGMGUXHjK6FbEx+eGAmLivoE/6pBvo3Q==
X-Google-Smtp-Source: ABdhPJxwnRHClL4PJXQ2kAmJVcUKbc5TCfHvRyXzHShrdN8UAJDxajrWEr88V72kZPeMp9GmmNEQVKgYIcGEH0FLNgQ=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr13316575otl.233.1627335071314; 
 Mon, 26 Jul 2021 14:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 17:31:10 -0400
MIME-Version: 1.0
In-Reply-To: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
References: <1627320986-25436-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 17:31:10 -0400
Message-ID: <CAE-0n50gGT8nfQ0KEnCG=g2DiQdCPpQZsFOVB_8iROmHXXjNFg@mail.gmail.com>
To: dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: add logs across DP driver
 for ease of debugging
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting maitreye (2021-07-26 10:36:26)
> @@ -509,6 +515,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>                 DRM_ERROR("invalid dev\n");
>                 return -EINVAL;
>         }
> +       DRM_DEBUG_DP("sink_request: %d\n", sink_request);

This one is bad. sink_request isn't assigned yet.

>
>         dp = container_of(g_dp_display,
>                         struct dp_display_private, dp_display);
> @@ -523,6 +530,7 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>         rc = dp_link_process_request(dp->link);
>         if (!rc) {
>                 sink_request = dp->link->sink_request;
> +               DRM_DEBUG_DP("hpd_state=%d sink_count=%d\n", dp->hpd_state, sink_request);

Should that say sink_request?

>                 if (sink_request & DS_PORT_STATUS_CHANGED)
>                         rc = dp_display_handle_port_ststus_changed(dp);
>                 else
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
