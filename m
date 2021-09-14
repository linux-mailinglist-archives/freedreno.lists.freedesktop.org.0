Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB4A40B857
	for <lists+freedreno@lfdr.de>; Tue, 14 Sep 2021 21:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900CE6E5C3;
	Tue, 14 Sep 2021 19:49:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5536E5C3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Sep 2021 19:49:14 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so178726otc.4
 for <freedreno@lists.freedesktop.org>; Tue, 14 Sep 2021 12:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=v3c6E6MMQg7r5oBUq1m5l+3onlEbo8USrY7KqxJROCA=;
 b=d82STJplqEDvwvwojrzgiDLySxHC1xT1ThA3Ss936NRBXycfFJuLyM8brNvGk8Q0BZ
 RfBmUa9WgZiV5/lphxebcR9MMFlYTDzmZFqlnn1xZL+BdktpnYJhU6VO5vbPEWNE8pmP
 0O+noFpedvkPblcENKaTnLBR08KFvN7bCh7tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=v3c6E6MMQg7r5oBUq1m5l+3onlEbo8USrY7KqxJROCA=;
 b=S2zpmue7Ka0FkwJpsMEW8bHbLndrxXTRvZOpuHCx2IWJvnUkw8o5zH3taltO4fJJ9K
 BDcaO57h8LxY/3OTkFaDCK2Ui2UE0q+twRGfzQ827GF4AF79DZQjyY8B7DkpOyd6vTv6
 YF+vEb5PKuwDYfi24xT+vng2mU1FNyH8PCl2TAq69UTlWqnyol4rIFcc2zzJRIBx9qj1
 9IMJFON8gaVchg97+SS3g/M+UkcNn/i5FKGs5216GnFOWLhlHKFfQNL6vczhwTRZlbAa
 XNT+Fjotf3cWlf8N86r4bUt2Ef0bQeoBk6ZLz6AlGqfxU6QEAfHCFGI0MTNXviyuVkes
 AbaA==
X-Gm-Message-State: AOAM532ELvhg4JgHmsK+OwR07OKknjw1YnJOmH2+A9GkMMmxF5HAzqxD
 mrsSKkhiu8KJPlpNVsZfp7KJnjY8ALGAuk+kLB6JB80vGfs=
X-Google-Smtp-Source: ABdhPJxmespo1Jy0mHteRtDveO8RQ+I+51B8KS7gLjSxy7Zo9ipn42budJZnsYHGhJ2GXe/Dp851pqDqSjKJs8/Nhqk=
X-Received: by 2002:a05:6830:1212:: with SMTP id
 r18mr15731034otp.159.1631648953925; 
 Tue, 14 Sep 2021 12:49:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 12:49:13 -0700
MIME-Version: 1.0
In-Reply-To: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org>
References: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 14 Sep 2021 12:49:13 -0700
Message-ID: <CAE-0n50R1wfw=V7o19N20YOqSrRZKR7Zd4QLcRcjYQNsdf3QHg@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kishon@ti.com, p.zabel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4] phy: qcom-qmp: add support for display
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

Quoting Kuogee Hsieh (2021-09-14 09:45:01)
> Both voltage and pre-emphasis swing level are set during link training
> negotiation between host and sink. There are totally four tables added.
> A voltage swing table for both hbr and hbr1, a voltage table for both
> hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> added to complete the sequence of configure dp phy base on HPG.
>
> Chnages in v2:
> -- revise commit test
> -- add Fixes tag
> -- replaced voltage_swing_cfg with voltage
> -- replaced pre_emphasis_cfg with emphasis
> -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
>
> Changes in V3:
> -- add __qcom_qmp_phy_configure_dp_swing() to commit swing/pre-emphasis level
>
> Changes in V4:
> -- pass 2D array to __qcom_qmp_phy_configure_dp_swing()
>
> Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
