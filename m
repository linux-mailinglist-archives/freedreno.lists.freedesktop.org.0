Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B183D19DE
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 00:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA9A6EB4D;
	Wed, 21 Jul 2021 22:41:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9086EB4A
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 22:41:30 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 o72-20020a9d224e0000b02904bb9756274cso3571191ota.6
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8tFkveikWGKHyoMJpaY3v9EmW9OHfpk/4+Rv8pSLhaw=;
 b=VSje6LWppRrx41vMaJH8+az7aeUTBbPPEmHq2CfO0WLP1LmVI48yuoLFKY8ummLolh
 MTW6XiUtEh6dc7mP5cTDNdk5DzLc+hmxu142zujZynzE6jYN8aqkm+kNKx7ZCMj/vZux
 SU20wbkOWK9sYoGRkbWnhwHYHDJIoGo5qgOkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8tFkveikWGKHyoMJpaY3v9EmW9OHfpk/4+Rv8pSLhaw=;
 b=r0MACEJ3YJFcgQScEPgiX21Aps4a/jKtVwOUplH6CNnT/OSa0QOjAmfzOMAyYkoiGX
 YmV6WnNSdMVPB+pf4gXvWhABMFwySC3NryDU8lo1DDi0g3woJFlNbE39aPzYUGWtbHF3
 vFVpE1tZG1+SbTEqtUlaAf6nqXcWhJV2i0Ik1dQU8u9S93iOPt1OhgUVSGx4ehbV0F6+
 q/Nl03Ol99z4PpQt3WTm6iFF2zxmc8kgHOgnSDMUUkk/GDYgtFs5fcaZWpt9NHUjhnkh
 nb6N5Vqwuz660HBSOdBYuweE/xKBVFA+H6hcP+LuPeVf4DsNSHTaFbHgBHcUFjIjxOp7
 mPRg==
X-Gm-Message-State: AOAM533zDB1BLST+hOQaICfP2vfKBtqPoCK89eL1cshD7mX8LxD8vQk+
 zHy4Fb99SsRBGhFzqi/jlzUNXDo16p1iI7D4oR2F/Q==
X-Google-Smtp-Source: ABdhPJwwtgsrtyqzBuj1DRjgsHKLLxHFhAJV/T2ZW12VgttzYji/bsI5Wgec8BIoUSxqV9yPHYFOb7uz+/+23sbio8Y=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr27568157otl.233.1626907290064; 
 Wed, 21 Jul 2021 15:41:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 22:41:29 +0000
MIME-Version: 1.0
In-Reply-To: <1624365748-24224-4-git-send-email-rajeevny@codeaurora.org>
References: <1624365748-24224-1-git-send-email-rajeevny@codeaurora.org>
 <1624365748-24224-4-git-send-email-rajeevny@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 22:41:29 +0000
Message-ID: <CAE-0n501_+htzvSp6pgMxxUaWMeZ7qLSKN1fXNWbNX1kwyYgTg@mail.gmail.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Subject: Re: [Freedreno] [v2 3/3] drm/msm/dsi: Add DSI support for SC7280
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
Cc: robh@kernel.org, jonathan@marek.ca, mkrishn@codeaurora.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 robh+dt@kernel.org, kalyan_t@codeaurora.org, dmitry.baryshkov@linaro.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rajeev Nandan (2021-06-22 05:42:28)
> Add support for v2.5.0 DSI block in the SC7280 SoC.
>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
