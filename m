Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9495538BD
	for <lists+freedreno@lfdr.de>; Tue, 21 Jun 2022 19:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB5410F019;
	Tue, 21 Jun 2022 17:18:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB0E10F019
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 17:18:14 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id x75so10602994qkb.12
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jun 2022 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwgcxcNcyUJ2NZcZ15e/v3/JFQqPvu5+AV1dXV2vsco=;
 b=TRn64fJDhOElfdcTPwyz6sItOyqoiDKFp52IyHdMNOTBQcCEhFotFhbieaj7qSREL8
 3kGY1lhmsXg3/711w7p4yz2xDmezK97ZjDhH25hVdCPA/4g4FUTMDfgN2vSWX/ZhArl0
 nNZETnIyH2zeO4mPe268fsAerKKK5cWu6jwDZJaN4Y1VTofp0cWGYy7YtPNfrcyKxeX1
 y2CUij5/SY1Qv53A/TY/LJpo4tbrvweyd9Evb7XGjxNlMjDc/es/LordtDmcKhzYuguh
 xSlzNflRpZl8OppZX6apzOLrVnhL2PUvipQoqWarhBbf7mk012ZXQ8zb+/Kj8HpdvrbZ
 41Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwgcxcNcyUJ2NZcZ15e/v3/JFQqPvu5+AV1dXV2vsco=;
 b=8Kmv5Z5/wRsG9FKnphSDePMMhzWDjZOiQfTChwVE1WmYYn3eW314zoX/83aQxrBm1t
 V3t8ri667bNeV/5mS91P6icu15MZoX/82Gf3dPZyiaQgT5xffiQKUlbCnNANZvSPktj7
 FLJl+Oiwu57TtJpd/nPwR75hp6nGYUozG+A6Jd13cnM5XXw9tfJUgegjlisKAdEzsddR
 FUkpPS2OMJwRMXkTBQZjF/9w+1/DKril5J3J7WDMoCRPaw0T2ktNQet3Ph9ceYD46COR
 SqBF6xzu7W6hjP1xX73LrN4qbyqkDY3LpyrTvWvYVMnwjPEvQhAAkaSn7YUJkJWfBJgx
 uq+g==
X-Gm-Message-State: AJIora8UF5zYCQvJeDorQcAPaaPuiXop6+1goT3ql9008P7JCE1Z3ugr
 4OytpIKLMhahMp1zu76wIxi5TSCpWXzRNvR+Sz8VKA==
X-Google-Smtp-Source: AGRyM1smc0gwmosrHI+DQL1uoC4Ig2j2XwTOLwa6CjLVbxx4AvthhD2XSWSsKcJldKX7/++f3DvVCyYjrta4Yu1yNpk=
X-Received: by 2002:a05:620a:4156:b0:6a6:f8d2:6d9e with SMTP id
 k22-20020a05620a415600b006a6f8d26d9emr21165057qko.30.1655831893778; Tue, 21
 Jun 2022 10:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
 <1655830891-19025-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1655830891-19025-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 20:18:02 +0300
Message-ID: <CAA8EJppZSuEOAh_K-wqQtC4Zx-W5ig02Oe7ZukJnF_Z=6pEDfA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v15 2/3] phy: qcom-qmp: add
 regulator_set_load to dp phy
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 at 20:02, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 ++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 10 deletions(-)
>

-- 
With best wishes
Dmitry
