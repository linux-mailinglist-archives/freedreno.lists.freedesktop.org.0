Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6DC409DCF
	for <lists+freedreno@lfdr.de>; Mon, 13 Sep 2021 22:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011CE6E241;
	Mon, 13 Sep 2021 20:06:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC716E241
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 20:06:10 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so15048374otg.11
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8JlT5JO0f8nryHiaEll8oiHPpQCulxYXgviYtcuhVxo=;
 b=kQK19oR/tRPgDwwinGrctqV/cjYE/BHCVlg9i1sPNtvaHnhPTv6PufYg07FCpwujoz
 NPHcty65gIJY/rRoQASOYq4YAXjCzO8ruiwMNV9kLIGZIFClyOyZiPPiOchUbudJeN9e
 yM2gf18ELsJwMfLsUTHPc0WMwjAOJoTjBK2zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8JlT5JO0f8nryHiaEll8oiHPpQCulxYXgviYtcuhVxo=;
 b=osvM29nqXdCsMmOjmWGF4LzIdMYGE8FMhyBD56WK12Rqq79GXtvPlueA8NHI3dwAeX
 WBZAR4Bn22LZu4fAuFUADoqLQClpmyXpSuA2L95X+7O327rRp8p4kXStDnKI8WSN+cdX
 uIx3dBpUKhOfwIPcqzQ3nKZ49APt5yJqG1AhoDub3JeT42fS9wcbACukxID91QTb/aTw
 7nvtDHlYfHCNYR50hULbp9jHmFfLkIM2y1vE6QuznZ+kvzOt3I1+cgnxs0Om/tMeMQ+i
 Ozxn5T9iYJKwXeAfgg32PVotyrM1fNhJ59kwaoKd1xKLjZ06o5hnp7hsV+bOj6tU9xq4
 QW6A==
X-Gm-Message-State: AOAM531O4ATMd+KfbVl1VkEHnZshcXI9u8qqVT5NL0yHp8RxJUhkk2li
 4zFgCPVFg/ujmffzvgs6VK8d8NVwXZKcnJ8oboyn7g==
X-Google-Smtp-Source: ABdhPJxgxKme3xoUGCx5xyhrZPhc+XqJ9apKSj199UxcUSc8rkyCSP5ymrGxutXE0sY+CvdylfwFOBKRbqVanKrarNw=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr11195587ots.77.1631563569866; 
 Mon, 13 Sep 2021 13:06:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 13:06:09 -0700
MIME-Version: 1.0
In-Reply-To: <1631223065-12607-1-git-send-email-khsieh@codeaurora.org>
References: <1631223065-12607-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 13 Sep 2021 13:06:09 -0700
Message-ID: <CAE-0n50P2OR9CPku3qq7+xR56fpg2Y7JDinikkY+uX6y9XtcRA@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] phy: qcom-qmp: add support for display
 port voltage and pre-emphasis swing
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

Quoting Kuogee Hsieh (2021-09-09 14:31:05)
> @@ -3757,16 +3796,14 @@ static void qcom_qmp_v4_phy_dp_aux_init(struct qmp_phy *qphy)
>
>  static void qcom_qmp_v4_phy_configure_dp_tx(struct qmp_phy *qphy)
>  {
> -       /* Program default values before writing proper values */
> -       writel(0x27, qphy->tx + QSERDES_V4_TX_TX_DRV_LVL);
> -       writel(0x27, qphy->tx2 + QSERDES_V4_TX_TX_DRV_LVL);
> -
> -       writel(0x20, qphy->tx + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -       writel(0x20, qphy->tx2 + QSERDES_V4_TX_TX_EMP_POST1_LVL);
> -
> -       qcom_qmp_phy_configure_dp_swing(qphy,
> +       if (__qcom_qmp_phy_configure_dp_swing(qphy,
>                         QSERDES_V4_TX_TX_DRV_LVL,
> -                       QSERDES_V4_TX_TX_EMP_POST1_LVL);
> +                       QSERDES_V4_TX_TX_EMP_POST1_LVL,
> +                       (const u8 *)qmp_dp_v4_voltage_swing_hbr_rbr,

Surely we can pass a 2d-array to a function in C? We know the size of
the array is always a 4x4 so we could enforce that in the type so the
compiler complains if we try to pass something else.

> +                       (const u8 *)qmp_dp_v4_pre_emphasis_hbr_rbr,
> +                       (const u8 *)qmp_dp_v4_voltage_swing_hbr3_hbr2,
> +                       (const u8 *)qmp_dp_v4_pre_emphasis_hbr3_hbr2) < 0)
> +               return;

It's void and this is the end of the function. Why is there an if
condition and a return?

>  }
>
>  static int qcom_qmp_v4_phy_configure_dp_phy(struct qmp_phy *qphy)
