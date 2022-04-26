Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4D510B1A
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 23:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543AF10E010;
	Tue, 26 Apr 2022 21:18:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632F610E010
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 21:18:34 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so8055958fac.12
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 14:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UQdTLiFS6s5lb76z4V/zrcCjKl7kNha5dSW7q7Ju4iw=;
 b=i4UpTC9epX2dJK4owogRVosBAzugi615/pZuFaNT0GMn/rXImP/Z1IkC2BP9L9m3KO
 mOisseWijdZbjf0asGuv7vhXCkSH5GH52OL4ryQ5V/9AvT8Iyl7NkSWHt+uM/IKxVuKp
 8mCGvnSETOUjT5zWn1gPpmQuBa/iZlytHc92U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UQdTLiFS6s5lb76z4V/zrcCjKl7kNha5dSW7q7Ju4iw=;
 b=eV6jQtx4OgTvcZ7OmJ9xxIMaxzfLZYIIXPlmvOtdAgUQlPUZ4NHA/gzEry8nuDHb6U
 JPVPh/JknZxZLzW5ItSiS4JNXmOFn526ND2h+dgHH6Dj9FYnitgX7s0Kei+te7Tvjdu3
 l18RkSjKCwooR1zLC2C4Vl0hPB/T4/SUt/SQuv43AmzkFfVts3D4yey5HYWAr4n6FPEc
 9668dUo1eibYAIoVz6hMPg6ZVCC7a8fIf6K5InG49jXKLnn426ILk7ZugZGghMbCh7s0
 jWLHSYPhlASlVybPBPrqdzl+Ur0+UQ3DryuAL0SR2sU44aidmOcQi4Z9m1ZuLNmpua2Q
 qCUg==
X-Gm-Message-State: AOAM532TtIV1QPjDdL+otFCOuFZzGFWbb6zATW6zHweDiamaSJuDZLI0
 7giFjXns5i651XFyFLdJtJ8L08MyajuUYxWYsHUo+Q==
X-Google-Smtp-Source: ABdhPJyW17NjxF3rs/I0KgToaqsIbXY3bjCBx58ePbAI217dDz1IltjBckzBntvCJY0CiDdmMaXOV9ldviATzU4d0f8=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr8599802oad.193.1651007913723; Tue, 26
 Apr 2022 14:18:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 14:18:33 -0700
MIME-Version: 1.0
In-Reply-To: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651007534-31842-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Apr 2022 14:18:33 -0700
Message-ID: <CAE-0n50Hpt92HAZH2JF88LfXzGEJ8sa4cy5RsnKpFmZ5fWSzAg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6] drm/msm/dp: remove fail safe mode
 related code
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

Quoting Kuogee Hsieh (2022-04-26 14:12:14)
> Current DP driver implementation has adding safe mode done at
> dp_hpd_plug_handle() which is expected to be executed under event
> thread context.
>
[...]
>
> Changes in v6:
> --  fix Fixes commit ID
>
> Fixes: 8b2c181e3dcf ("drm/msm/dp: add fail safe mode outside of event_mutex context")
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
