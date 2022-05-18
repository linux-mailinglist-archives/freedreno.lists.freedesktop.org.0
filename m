Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220652C4C6
	for <lists+freedreno@lfdr.de>; Wed, 18 May 2022 22:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C7510E5D9;
	Wed, 18 May 2022 20:53:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233D910E5D9
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 20:53:41 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id w130so4232579oig.0
 for <freedreno@lists.freedesktop.org>; Wed, 18 May 2022 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UNqWZZ/W5ko5bopxO2cXE64dq+vAay+pJVcB9JPEK7k=;
 b=MZU6ZApL+VJ2nR/SOYL+8sNV8dz7t8gWj15O7ujNs2F9Fz+Vn9RCogVeN1vvAnRWRS
 ilsC9DGDD64NEGVFzpPB1wzxKAVfzks8J0UC+0ZH1/CCa+nGcAPbTMg0RH+kWk0nCnip
 XhfMZL6B6uOhpLcXD57lGxIbgFNNO8i1wISrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UNqWZZ/W5ko5bopxO2cXE64dq+vAay+pJVcB9JPEK7k=;
 b=sxDcUAhOyptcQ1wX2ZihHV7gZc8qj6z7k4iB01Jz9OWrTHOERaDRPcruCc09aWAyIx
 mWKqhv/WbPv/yDJ2uJA/W5+PJ+F/duF6xoptN1+Ephtt36vrCBwwvjnTYWQgZe9MmHJr
 JvjqoYgIlk6tp65UFzGmOgxzc3sqqNQyLLiyOR4LKqd1PEd6a2Vbl0f5RUgxyyYqFypm
 O0W8iJ/cW8N95E24EoXGTJsM1BcBoP/85hRbhv0PD7Tnq0BXee4Queg8oNqWYthJrMC/
 Vnye7RLQDmTCn8qae0FGbDl30zQFGoHCjVJgRK18uMn+HdhNp1R2XP0qc8eE2bK0ZYS4
 5Qbg==
X-Gm-Message-State: AOAM531/ameOBDGQxAtDM2z2MbgqxSQTZyqMU0QUBxP1/vwovoAymNwP
 uOdSCvjahXCgtarwkfvQLYPW6bjwOdcnV/fzFGxQzX9E2lk=
X-Google-Smtp-Source: ABdhPJydobKed7t7rxB1Dk5wydK9YkQwNJ01ZtS6wCryK3YwFULkGDQ1slIBbwUS+XCTTygMr92gMAt/aKu+AoKQ+Hw=
X-Received: by 2002:a05:6808:23c3:b0:326:bd8d:7993 with SMTP id
 bq3-20020a05680823c300b00326bd8d7993mr892931oib.63.1652907220416; Wed, 18 May
 2022 13:53:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:53:40 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-3-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com>
 <1652905444-10130-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 18 May 2022 13:53:39 -0700
Message-ID: <CAE-0n53o234QGNiDZ20Bmtrxcr03wUEbTgM82i1-sF4VhT=JsQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 2/3] phy/qualcomm: add regulator_set_load
 to dp phy
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-18 13:24:03)
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Changes in v2:
> -- no regulator_set_load() before disable regulator
>
> Changes in v3:
> --  split into two patches

Same changelog comment

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
