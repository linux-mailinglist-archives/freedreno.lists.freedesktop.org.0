Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C44305E3
	for <lists+freedreno@lfdr.de>; Sun, 17 Oct 2021 03:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44A86E90F;
	Sun, 17 Oct 2021 01:31:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94626E56D
 for <freedreno@lists.freedesktop.org>; Sun, 17 Oct 2021 01:31:54 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 e59-20020a9d01c1000000b00552c91a99f7so296631ote.6
 for <freedreno@lists.freedesktop.org>; Sat, 16 Oct 2021 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Mf0Mwk4Nvj9HUEe3bQ6ZCswhorXqyTpELHryvN43LX0=;
 b=ktf+x61/yH16k3GIVUn9Uco046qC1qV6GoQrHIzfWAt5dEvcyFOVtXj5zvIJHepK1u
 Sg1WH8QkUmDWekxPMe/PsUq59SULVXtWX3eR5H0oM9F3SOGMRG0tLQi8L8GUt3MTWL+p
 v67sCkR29toFeJxP+Xsq2HjrMpOz5ZQIWJ+0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Mf0Mwk4Nvj9HUEe3bQ6ZCswhorXqyTpELHryvN43LX0=;
 b=0chNlbBB7Fl95gS8pqhiDNXzUYImuU4+b48o7ZO7GoMd5q+xsoWqZsveDrXqQEUPPO
 38jVcAxXjJ5pIrCoAG6CbN2+WTAjH5wbjBT0McCi8mfsDCbq1Kt6Zt5uuSdRkWk2LuwF
 A7ON/giyz17Ze8ExKgfw3/O8CLDuGb1ptmSbyzOX8gfFAD+GeA7IN06Nl+oyMAd4puI7
 lhIwFHGgtlU/L1WoK5Z3UAEqVdDQGFmVRRnxULY+ofRv5RaGihxXOcfbwlML3YGinurW
 898VFKAQUTtPHCa05BOIWX0gj7Kmr2aw4JTIWvQiYsu7tJ/BMjrFBvRK1XKq55s5QOsO
 VhgQ==
X-Gm-Message-State: AOAM530AMvVxoB+l8Ydwq4Dlzziy+qkofEPwhPoxp0AyICFYqVYMSq0X
 mQb440HzZKWVANnSeYGlBRfP0FSRnCQYMPzIDbI+Gw==
X-Google-Smtp-Source: ABdhPJzzZYs3G7Cs5Kx0YRYBhZZYkqRuo62R0Tx74imA+M7M9wHiZ5oWBZcO2tUw6r5JwbttYUQ1DUTJaey7RPOEM34=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id
 f14mr14737706ote.159.1634434314051; 
 Sat, 16 Oct 2021 18:31:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Oct 2021 20:31:53 -0500
MIME-Version: 1.0
In-Reply-To: <20211016221843.2167329-8-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-8-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 16 Oct 2021 20:31:53 -0500
Message-ID: <CAE-0n515j1xqZqQUky2eom_Jq9E7rHOHPastZ7Xp2zGbv0ypCQ@mail.gmail.com>
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
Subject: Re: [Freedreno] [PATCH v5 7/7] drm/msm/dp: Add sc8180x DP
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

Quoting Bjorn Andersson (2021-10-16 15:18:43)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Link: https://lore.kernel.org/linux-arm-msm/20210725042436.3967173-7-bjorn.andersson@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
