Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCBB18BEB1
	for <lists+freedreno@lfdr.de>; Thu, 19 Mar 2020 18:48:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906086EA45;
	Thu, 19 Mar 2020 17:48:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7967F89EB4
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 17:48:12 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id j10so1793683pfi.12
 for <freedreno@lists.freedesktop.org>; Thu, 19 Mar 2020 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=iWUSd6tNelA3B2gV8L14dd3S0Goj3iWlFgAqgwk5kPw=;
 b=T5wSGnt2PrWmaej5pxTQjA5iZ75Iq5B8ryc8SsC0GZUqDnlwetsWMpCtffoLmhaty7
 MEpRGQOi8ly0/vnWHX7gn8Je3y5VDnIUpNcgALh6uSrWPV9q0Ly1fiQ5RC4Xi02iZE6W
 JyMt029uRbZPrTBbpHeGtn40yI63DT1zUUIhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=iWUSd6tNelA3B2gV8L14dd3S0Goj3iWlFgAqgwk5kPw=;
 b=juH6eDQ0EDeFrTeL2/dx6lRPg/4U318pFbHltTA9Bklv1Rsl9OH0uz18NI+Lq2JUxk
 Hdsn4jn6RMHcfmRWQlOVf1xcxaKSrD7KqIU1vrjtsVFRe1O6P8mDgVTD788Dx6RPHauf
 5Us5vTcBUvMYga107ZK3GhlQj38qjdj9XfmrlK1tgHtKZ+9gPtdrKZbvH2wv+YUjiTBn
 Lz+AcyS1dUdQQ/cMfTM/ER5gWfAAeSzS+B/NooEWdn6YivZbQRriA2aGIaoZ439Au7Py
 EOxcyFGAY/lQgBeU6c69dlYW3XfZcGuvLG5+2v8dxB8wheS1kMg5TKT/DUfzoWd2v+fH
 RfOQ==
X-Gm-Message-State: ANhLgQ0ayGGlxPRP4b1rqFk9sccMDu9LHaYnrluBXhv/JqwaDAOZETkk
 c0hA5GaL94x2ccaxDXmCkaKQcw==
X-Google-Smtp-Source: ADFU+vut6Lso223EbxYK+y4BZyU7C3AfV3mD375ioWsMfGKfgEhQlPlHMn0XJNEJoyfTIpfVnP8PYA==
X-Received: by 2002:a63:c811:: with SMTP id z17mr4386751pgg.41.1584640092091; 
 Thu, 19 Mar 2020 10:48:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id h11sm2990799pfq.56.2020.03.19.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:48:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1584356562-13181-1-git-send-email-mkrishn@codeaurora.org>
References: <1584356562-13181-1-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Thu, 19 Mar 2020 10:48:10 -0700
Message-ID: <158464009041.152100.18425074316530931981@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [v2] arm64: dts: sc7180: modify assigned clocks for
 sc7180 target
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 kalyan_t@codeaurora.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Subject could be "sc7180: update DPU assigned clocks"

Quoting Krishna Manikandan (2020-03-16 04:02:42)
> Add DISP_CC_MDSS_ROT_CLK and DISP_CC_MDSS_AHB_CLK
> in the assigned clocks list for sc7180 target.

Why?

> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Does this need a Fixes: tag?

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101..e3b60f1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1544,8 +1544,12 @@
>                                 clock-names = "iface", "rot", "lut", "core",
>                                               "vsync";
>                                 assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
> -                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +                                                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
> +                                                 <&dispcc DISP_CC_MDSS_AHB_CLK>;
>                                 assigned-clock-rates = <300000000>,
> +                                                      <19200000>,
> +                                                      <19200000>,
>                                                        <19200000>;
>  
>                                 interrupt-parent = <&mdss>;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
