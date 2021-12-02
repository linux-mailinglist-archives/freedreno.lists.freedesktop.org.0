Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C97466D40
	for <lists+freedreno@lfdr.de>; Thu,  2 Dec 2021 23:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3D06FD40;
	Thu,  2 Dec 2021 22:51:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49DE6FD3E
 for <freedreno@lists.freedesktop.org>; Thu,  2 Dec 2021 22:51:39 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso1629447otj.11
 for <freedreno@lists.freedesktop.org>; Thu, 02 Dec 2021 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=G+McyWCYbmpjpANc0iPYcABDaPO85Ld/wlLRZjD5kLg=;
 b=JVh5EP5UyHHaNRAtHYGVi+rhzICB7i9jWA1Llw5vFsL30ZWFm5dov/5HgQ7PrjfyMF
 cdhIvN66DELXflYZC8l/t0rdBc4UZyRKrrPs4OCNOpZN3vFxTYthGshbxe6zu3eLVXoC
 mCRNLamhog6hLB5zEO+t7mg5RBtZFQhYanQsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=G+McyWCYbmpjpANc0iPYcABDaPO85Ld/wlLRZjD5kLg=;
 b=ygn4U/0Rl4/QrYGt0FF8spfcXrhmppsncqiJ65Q16eqHsSsEMh6mv/O+gZ24+/+n57
 2K8I2i7q8tvO2GvhkZAh8xMHCCH5cDjUWRk3P25H88gwGvPY/BrY7N9XiUP/DLInQRXU
 gNukZpIXDHyJ+8LqAwkHK39zpFuwsv2eUgsJHaISFCbXCM6ltsKgxg8ygVsVSdvTr5XL
 4vu7hM9K5RVnYSbfrGeDn6+CorChjFr6wPGo7bToS1DCsbA76JCpNhWEWW+QayF2meQg
 0HDciWejyi+vAdAu0WQuc9xk5PrAUDfCYqZnsw7ChS/D0k1yBY2BXRRTVSrzBhtk0GQd
 3vuA==
X-Gm-Message-State: AOAM530TqCpv/y0u9/Z60/U9tXN3iiq+7Ay1YU/yqjZsET08/c+75gsW
 qNhZIM2ZfjUzf+gdksZahnH45jfTTolv/ZSdcUrPGQ==
X-Google-Smtp-Source: ABdhPJzS29+LQ903PdAUxA5kWhCkKjLGFY2Fq0VTw8nEaBMpva7LdDAsgQrfNLDEHcVCbXgEfKRtiUEhJh5gZE/o+P0=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr13366960ota.126.1638485499138; 
 Thu, 02 Dec 2021 14:51:39 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 14:51:38 -0800
MIME-Version: 1.0
In-Reply-To: <CAE-0n50R1wfw=V7o19N20YOqSrRZKR7Zd4QLcRcjYQNsdf3QHg@mail.gmail.com>
References: <1631637901-11603-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n50R1wfw=V7o19N20YOqSrRZKR7Zd4QLcRcjYQNsdf3QHg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 2 Dec 2021 14:51:38 -0800
Message-ID: <CAE-0n51OA3c_hcnpJ-k5ZQvCN3kv8PcjLMRw4BLx9OKZPjGLcA@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, kishon@ti.com, p.zabel@pengutronix.de,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Stephen Boyd (2021-09-14 12:49:13)
> Quoting Kuogee Hsieh (2021-09-14 09:45:01)
> > Both voltage and pre-emphasis swing level are set during link training
> > negotiation between host and sink. There are totally four tables added.
> > A voltage swing table for both hbr and hbr1, a voltage table for both
> > hbr2 and hbr3, a pre-emphasis table for both hbr and hbr1 and a pre-emphasis
> > table for both hbr2 and hbr3. In addition, write 0x0a to TX_TX_POL_INV is
> > added to complete the sequence of configure dp phy base on HPG.
> >
> > Chnages in v2:
> > -- revise commit test
> > -- add Fixes tag
> > -- replaced voltage_swing_cfg with voltage
> > -- replaced pre_emphasis_cfg with emphasis
> > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_v4_phy_configure_dp_swing()
> > -- delete drv_lvl_reg and emp_post_reg parameters from qcom_qmp_phy_configure_dp_swing()
> >
> > Changes in V3:
> > -- add __qcom_qmp_phy_configure_dp_swing() to commit swing/pre-emphasis level
> >
> > Changes in V4:
> > -- pass 2D array to __qcom_qmp_phy_configure_dp_swing()
> >
> > Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")
> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Can this patch be picked up?
