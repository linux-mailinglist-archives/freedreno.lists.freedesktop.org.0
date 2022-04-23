Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164B50C609
	for <lists+freedreno@lfdr.de>; Sat, 23 Apr 2022 03:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5FB10E4A0;
	Sat, 23 Apr 2022 01:38:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99F910E283
 for <freedreno@lists.freedesktop.org>; Sat, 23 Apr 2022 01:38:47 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso10432829fac.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 18:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=98Q4KjRvjXM0WQPHZUCc5YLZNElnBXI0Q4eC5MfmUig=;
 b=k9a6JGU17lPps5sbFfsmrztGSV/zL0+DC4LCy8hfnFFRNlK3hMnkZdQlhPTQtnmjRY
 3wjBJTvJ5Vsx0dJpwdSNsAuJUz7h22PH0sQ+beTiWIJvsz+z/1ycgNfkuiMzJGyBtvbg
 cJVAUi1g0etBvKVT4kVNTt1YZMGIDFwFBrcyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=98Q4KjRvjXM0WQPHZUCc5YLZNElnBXI0Q4eC5MfmUig=;
 b=JieOU5nX1Tk9HSMw7lQPVtOIRH1BlG01LiwJvf61lgUrhEmi40oclrl7iBs2wvJEFQ
 MupqCgujLuZ7obscvUMg7Sq9k9z8O614a+seLAMBw3qoOzME2+0vG9slwcYguLEwk7Ab
 jDxnSq7UgeQRhpJBe4hEd8T5iDbwiY3QRBUdoztC/YsDnMHYE4TaLCXwvyU28cq48UeE
 Mw+fzzppef9Y4J5bSV6exztFTelcqD7f81TJnFIeQg0wju7MWCzor2rVL7sMQJlH/GcF
 Pc4YAsap11nVN/Hd4W91J0KNwZ272d3IehZMdZjNq/grcBTjElwnvUxN/mvzhmlFJHZG
 3Htg==
X-Gm-Message-State: AOAM532BM5m5z5N4Je0UB4r04eker6thvM91+xNFxB98tq0BFXfkot6S
 SFKLMGnDLv14H+iBJrSgjAMMhApgjAPVK1SUQLPFwA==
X-Google-Smtp-Source: ABdhPJwlNqj63PkZquQxnFkGieqNdLLQiY/83YWsqgq1LyL+nK1ybanQly0mL7jbdoUfgkPKLIFUeSjxb0+Oi7jnSBA=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr1868942oad.193.1650677927041; Fri, 22
 Apr 2022 18:38:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 18:38:46 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 18:38:46 -0700
Message-ID: <CAE-0n520s1XdUO5k2xxX16AsJc8pCjV8yXeR-0f5BC7A5+f-Vw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 3/4] drm/msm/dp: wait for hpd high before
 aux transaction
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 quic_khsieh@quicinc.com, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-04-22 02:11:05)
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or perform any aux transactions. The sink
> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> it performs any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
