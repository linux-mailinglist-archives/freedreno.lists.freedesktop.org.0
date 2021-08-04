Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00703E05DE
	for <lists+freedreno@lfdr.de>; Wed,  4 Aug 2021 18:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B81B6E3F7;
	Wed,  4 Aug 2021 16:24:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F1B6E3F7
 for <freedreno@lists.freedesktop.org>; Wed,  4 Aug 2021 16:24:56 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u25so3483514oiv.5
 for <freedreno@lists.freedesktop.org>; Wed, 04 Aug 2021 09:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hgobEeM549v3zw1Gmve9JpAQ6H4sOP2Sx9OWJYBVYX4=;
 b=anVyLESysacJzwQ9+bl8peh0mfxOGxp8tzDGJwCIQfTVHYAWhZdOshbtCAe0T7L8cj
 +oZAG/8jqr97zNrCaKibn6s6BLuZxkc8vrDXOqiGfdMTXV/xIgWGMQOtmx/HSnrUNbPp
 iC17s7ipmRXIEigvVtb0StgZ3jwxYNUY6V80M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hgobEeM549v3zw1Gmve9JpAQ6H4sOP2Sx9OWJYBVYX4=;
 b=PPCpr/OPORiUZP5dgFK5bi9EWMZE9lcSF7OBTiGPQfcrjhZ4d1zmNWmV+ciTQNTqa0
 sCjLCVXz+cqQmkENUungEVwJDxcWDKKGAXGBo3odgjJqC2MXStZPC1ak5HoBQ5fZ8MHM
 RNu4qJJS7RLhxfBvUjW7UNVROZoJ2bMZBNfudxZuZleKvncLF13sATWO7TFYXVVdKsAH
 vIiqS/zfUHRIQxQOcT+c/7r2f5N5hEQ1Qq6VwO7bJ6Nq8Ebh9dK8kzStphrmh6Xwjocm
 TDe6vItAvAxalkNhDjY3LWyZXUZxZstiirlk2HchdzZXPbYL7e2Z8ofmvTcIkLx8U5FR
 FpuQ==
X-Gm-Message-State: AOAM533n+t1srcqrolXf7nd0U/8IUId3I2jQUWItwh5BNnPe9N1ZWmUG
 tZKebajpPrq4hPraSAbPMffFv1GLPYL8IyXE/EyFiA==
X-Google-Smtp-Source: ABdhPJxlsg2rjRmyZhJBp9eeXaZq9jGdzuh3fTxcauW/EXtGxVWy7yicyaA3pE5e2q1lh0t+yzqD8/qJzhMNPveVnf8=
X-Received: by 2002:a05:6808:619:: with SMTP id
 y25mr3529630oih.166.1628094295336; 
 Wed, 04 Aug 2021 09:24:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Aug 2021 09:24:54 -0700
MIME-Version: 1.0
In-Reply-To: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
References: <1628092261-32346-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 4 Aug 2021 09:24:54 -0700
Message-ID: <CAE-0n52e3FuhhiNqRTbDmaTM5TuLTgOsSYJab7uA1=N00uf16w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: update is_connected status
 base on sink count at dp_pm_resume()
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

Quoting Kuogee Hsieh (2021-08-04 08:51:01)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>
> Changes in v2:
> -- remove dp_get_sink_count() cand call drm_dp_read_sink_count()
>
> Changes in v3:
> -- delete status local variable from dp_pm_resume()
>
> Changes in v4:
> -- delete un necessary comment at dp_pm_resume()
>
> Fixes: d9aa6571b28ba ("drm/msm/dp: check sink_count before update is_connected status")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
