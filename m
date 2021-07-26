Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4A3D6A64
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 01:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F7A6EA34;
	Mon, 26 Jul 2021 23:52:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36AD6EAE2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 23:52:26 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 o17-20020a4a64110000b0290263e1ba7ff9so2651848ooc.2
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dRaHtjS0KrTz4yuMDHKsz+U68MHHTci+vBVq7wMAHKw=;
 b=AvHO4vlBdmphRLFE1VF1DCJfbyTvm/5I94Unc/gLh+OhuuKt7bnc/QMo5D0l+5vdX9
 HUBVtcsSCB3rh6Cs96P+4lu5ABM/EN3WeQJZGQg1nTOIArK4SQhBFK4KnHQdjpIboXlf
 dfDSdYpePU+/obZDzB4Fx2hhqJi48U6l8l04Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dRaHtjS0KrTz4yuMDHKsz+U68MHHTci+vBVq7wMAHKw=;
 b=PMjoFBZmzQdIGXED1NrccdNpukaqO52kkD7qN3/dIR2NBDpx6zUR2m+fPpPLjWavX8
 XxRxi2KR2fwvsYSW+eeXLsSv83xeGQ1Dffod6C6fT1SAWzWP2gBQDYQMiTYFQd+wIWDn
 m0trEo/coJgStqawIVTC47UxOs58pBKlyDCWOsh9ut689njKXmwy8WrjCsTa0vjaZUeS
 P7hBOo03kthk90Rekcii/uNyC83RpKtMV91F5e5lM7WFgfAF7mQeWfdL2nSuuwnJONR6
 010jc8Z58M4x/K/2nUq4ndYxg/vxxowFgQ19evJ3ZenM6rDWG5E6BLovJ6x6hD4Th8IS
 +biQ==
X-Gm-Message-State: AOAM531Ez/5qYO9fmdWST9GBDVnmaW0YuW7MB4aRq8skUuVZHfA4pWuN
 W8DK+1WwgPt8Y15wcV364qjbE8Ykt2oamCUEjbY5gw==
X-Google-Smtp-Source: ABdhPJxSyAGaBm1flEDwyQLTJt1JWFzQAyotby+cedJ15X8enDG0o3MaedDkJEWuJ2piJSo1jaW+PEA+CtzX3wp4PZQ=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr12012017oom.92.1627343546057; 
 Mon, 26 Jul 2021 16:52:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:52:25 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-6-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-6-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 26 Jul 2021 19:52:25 -0400
Message-ID: <CAE-0n53J6dqB7X7LoKd4VYVgA-ujbV1shFWdYZvLZZ+q3Tjpmw@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 4/5] dt-bindings: msm/dp: Add SC8180x
 compatibles
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
Cc: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-24 21:24:35)
> The Qualcomm SC8180x has 2 DP controllers and 1 eDP controller, add
> compatibles for these to the msm/dp binding.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
