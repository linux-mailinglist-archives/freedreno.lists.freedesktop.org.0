Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B315A0039
	for <lists+freedreno@lfdr.de>; Wed, 24 Aug 2022 19:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC88B7D66;
	Wed, 24 Aug 2022 17:18:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0AABD44F
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 17:17:49 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 m21-20020a9d6ad5000000b00638df677850so12233155otq.5
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=MHYuEVNrNq6xOFLpayXIejomNu0GT0DBxEs7vGrd158=;
 b=WZmQ7PLNtEHmn6SJrYb0tXJV3lUfaM74pbLSdSKR9LMnaK5kGCvh1f3QY7J38pSoIB
 ik74LCQK95MUwF5xTdiHJ3JJ/wd36IqnmQneCLEzyFZ4ghGmFUX4vvXUG+dSM9XM77Nv
 lk/NSNsGdkxOFaxjdiv4zfitg8B6AUUzfSsrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=MHYuEVNrNq6xOFLpayXIejomNu0GT0DBxEs7vGrd158=;
 b=oeZLSyCyG550ww3valzU0qP3u5JPb/30Kdnouel4rZZGBoeyJgyLn/zKXUrwomBFtg
 M/fZz7291ypZ3bM83CepP/LXNwRbk/QVbjyEcO5f/fWxHlVa1EsxDe0sQ+Y4B0lFBe9S
 NRd4qUVpHRdf9SMLQ9QesRM+mOVicAzJ0wzcjBVveO8Ds4iwKp9TdtVJM1mcCYBILm/1
 bYr/dgzZG3pmDauOkgvKr7cK8Jc8YdWdkjisAGDdTV2gZBfFssBckAnxVxKMkiU/OGsn
 9YLzUKaEKNht/h1degh9f7ycZfZu28KWpvf0SzgMA6v/A11PcC3DrkHLjRWYasKE425E
 qr/A==
X-Gm-Message-State: ACgBeo1qfzxUtmF6UnvmpQXj0pJIXN9aVapteOSUKJaxkUivyTCV+/E3
 BzVT3KtSXLHrSgumGFQbhmPHr363IYMlLD3eImjGoQ==
X-Google-Smtp-Source: AA6agR4zBshr+gUc3WgavtY1TB1LNAO6aNOk9NTWdc2ol+fbKgwzW7gL98pe4oEy1a7xXcIHJjx4KwfdSoBCPBzli14=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr11204441otk.73.1661361468554; Wed, 24
 Aug 2022 10:17:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Aug 2022 12:17:47 -0500
MIME-Version: 1.0
In-Reply-To: <1661360356-21948-1-git-send-email-quic_khsieh@quicinc.com>
References: <1661360356-21948-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 24 Aug 2022 12:17:47 -0500
Message-ID: <CAE-0n52Mqv-qqb4n_Q4iO-reSncNikWd-2xNVG7pgwvx2ThTHw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-08-24 09:59:16)
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Fixes: 937f941ca06f  "drm/msm/dp: Use qmp phy for DP PLL and PHY"

Should be

Fixes: 937f941ca06f ("drm/msm/dp: Use qmp phy for DP PLL and PHY")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Good catch! Thanks for fixing it.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
