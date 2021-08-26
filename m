Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977CF3F82EA
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 09:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F476E52D;
	Thu, 26 Aug 2021 07:14:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9048A6E52D
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 07:14:12 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id y128so3237122oie.4
 for <freedreno@lists.freedesktop.org>; Thu, 26 Aug 2021 00:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aRiLbWEP9NQgwwctmdG3N2zfgTjntvnVENFb+awS0zA=;
 b=F81Cr3R6yT7asoMk0pyICvtOXoQZAXvI1ZnDNCPSezR35pdJ3glHU/05ASNiivAux1
 fSfqjB1WU7WW801D5dDdGncQYjxSGvFnL/wsbjCe2P3mYZLuDRXxDNkfrGdnRoesZ4pm
 DIf81ahimaKl/WhY/sF0MPtxSm6wmliMthhJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aRiLbWEP9NQgwwctmdG3N2zfgTjntvnVENFb+awS0zA=;
 b=JxXNuqrZKuNh0EvB0ZIznMT00tf8ZX5SM5auPNUv/+5hwGGvUyAm4X9+KSvQuR083w
 ud+WjtRzbMONEAbVfA/isogZE1iBikEVz7fB0yyNL40YlW51OznZYSzqGXCITgOIJcJg
 fB5s4Bb8o4aVYCmWmWubtSCJP48BXElaXBqyYbWSXK2lfL8eMpNMEyFk+nekclejqleg
 9SjbCWTTcjEuGh7zAzeVsC3OjBBUM3yF+mbBS/VR+KJVHwHq6K0CDgY6XwKh/iRnH9vF
 wTJ3aEHwJzMznoex6siqSN7AwVp+vUc72mfEAj6wKwag78Qfl0iMeBte27Vg4C3uG5oB
 X3lw==
X-Gm-Message-State: AOAM533ypy6MR1o7h6LazfKccUg0AVJBs7DP6LJJF8/dJjfZg0/jJ5Vm
 PXudO5e1IfjmxmTmJV4Ln1PdIaWsKwDiZBgOeBylmQ==
X-Google-Smtp-Source: ABdhPJzUDekyoWqTfrkclEr8+8sWlzJ7PWjVoXwVhqtZb33xoA6jHZ+GqQ45EOn0Awx+UlXeZahflBl7bsDJeh8AC6Y=
X-Received: by 2002:a05:6808:181a:: with SMTP id
 bh26mr10217298oib.166.1629962051961; 
 Thu, 26 Aug 2021 00:14:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:14:11 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-6-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 07:14:11 +0000
Message-ID: <CAE-0n50FhJgE-Z3DvdhfTZxRbwCx50TT2An_i=Xorf=OBE0MYQ@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 5/5] drm/msm/dp: Add sc8180x DP
 controllers
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

Quoting Bjorn Andersson (2021-08-25 16:42:33)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
