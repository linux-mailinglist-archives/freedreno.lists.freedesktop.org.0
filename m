Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBF4CC88E
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5B010E331;
	Thu,  3 Mar 2022 22:06:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9142B10E337
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:06:41 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id j2so6141830oie.7
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=r7kKCHWz3Rfv0TQHHwtEWE4mf+UhKdYlq+PNtd3O+F8=;
 b=Z/JYd4+V376HcbtMkvRBhrUgb5bIqQI7F34q31nMVDyB5DKCMuF39gIVI7GHkLnK5z
 xwecd6zPlWqMWR83kkWkOdDZRbFCWNM5KowBFcTzELnIZyrazGRjk+9YjZMMPeCzfSen
 Dc4coFcuRY/XfS2qdlrDgBfiaAjeb+BrfQnDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=r7kKCHWz3Rfv0TQHHwtEWE4mf+UhKdYlq+PNtd3O+F8=;
 b=L+rCFNyPSlMwtRV3rB55NmS5VGCsuXhZg6KK6dd2Flhi8ZXsLrlWnWY9igJ1+xa06P
 XhdxMV2F7CWmJ8jqRWeKFkFUppcJrSumOc3nrBK37P4KRG1bBiF0wOUgrs2g5T20KEMt
 sXhpIqxrUmpyREe9tpakcrEFmfvWTZ4D630kaJOYnvvDOPicBALjkdLXn7PePg1EQCCK
 I7+5kjb3f5XcWmBitZtoRXXbepeu9UalsPHKDioK1NzCSaTXNxSAPmaeMqxZ81dBNbsq
 xQUPmMsxmrx7LdxnEdly5oYENQqkgrk3JTP2G8P4BQXnQVdcJImg6Xv/w+i1s+0XH89w
 zG2A==
X-Gm-Message-State: AOAM531b5Mgw7U9CrODu79NF34OiMH012uA3C1dW1pJcSFBKGGZLSWdr
 FCSxRigBvB0XLfacM/ftAN69DN6/xdG425aYFQkpIg==
X-Google-Smtp-Source: ABdhPJyMZuWL+CCeZIqQWqg/RiahdrvQ8SCiVP/B4EwHgyJoeXa1tCMmS59sHA3zE1RwwWN0mnFkZj+JMSwmHPiUj3g=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr809414oiz.32.1646345200874; Thu, 03 Mar
 2022 14:06:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:40 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:06:40 -0800
Message-ID: <CAE-0n50sRHDaBdKADrqXMR1Dc7s=Stj_eY3Go=VPTTHRHtiUPQ@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant@quicinc.com, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-03 01:40:01)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
