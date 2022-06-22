Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E3555585
	for <lists+freedreno@lfdr.de>; Wed, 22 Jun 2022 22:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C331510E2F2;
	Wed, 22 Jun 2022 20:54:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F017010E2F2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 20:54:03 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 v33-20020a4a9764000000b0035f814bb06eso3542230ooi.11
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=zLM3H6dXb+4yal/kJHLEaxquP6RiiCYcAQJiPFIPgC8=;
 b=HskBGcQ2b9PGCBZ6Tnzgt6AnYSaE04gY5FShwZziCicLLASoVTQ/m5/Nx62jqEvxzq
 FaAqhHz0/i4OzvdA7rYGg/GbwDArNnQaPgeHYJP9iHp4LndZjDAOtSXD/H/u8Diu6s2v
 RRkvk/2yXmGKDKXqZnaanEF3T74mHT9aLGlKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=zLM3H6dXb+4yal/kJHLEaxquP6RiiCYcAQJiPFIPgC8=;
 b=sCg4ZQ7OaD3uIzKCtDn9bPozHfdBxORGDYJJU/uMvm9U42+foYnSPEkpGXEw6/Vq4P
 I3ODNhU7vuQIb1rVzQkvT3Q8hX4U+E0qj8TyKcy1n25ks2pFFQawHuk/hLYS0dfaH/3o
 YbpROdUgcFaVtXDJjkwLiauxJAsfpJ94qFCGJUk/CQCH53SYP27QbErH0IHkdIJjJsMb
 yE4H+RAOGJrzBB57hUQFxYCGTXLvBip+GQqksPGv9NelUzQfXOQFKbU30TFpfjblK2Ar
 WkBPBirjS7gmLl3PVjzJMEUjzlWplXUyFhaztQKa6NCbDIJ7uQs6NAouXrV4kwlqB4Ks
 NEfw==
X-Gm-Message-State: AJIora/9cnPet2VeWxBHwmAedShNpsp88n1pQe3KUXuGNXcCt/ndqf4N
 WpO/C+PxD3/9sWwdKj7B9FliiDkPsrgafauGE114xA==
X-Google-Smtp-Source: AGRyM1vqwuYKRd2OLI2EjFJb+t6z5KjjkxkIrqC3zFBPKs8L9JJgfehG5mxRD8VQ6NVJjmHBWycT3gs/lPSd5dKK+JM=
X-Received: by 2002:a4a:ca95:0:b0:41c:e2c:ab2d with SMTP id
 x21-20020a4aca95000000b0041c0e2cab2dmr2199697ooq.1.1655931243137; Wed, 22 Jun
 2022 13:54:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jun 2022 16:54:02 -0400
MIME-Version: 1.0
In-Reply-To: <1655830891-19025-2-git-send-email-quic_khsieh@quicinc.com>
References: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
 <1655830891-19025-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 22 Jun 2022 16:54:02 -0400
Message-ID: <CAE-0n52xHB4THaBztNY4THc8+vDGzD0YF-5_T9Baaj-Xdu4zGA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v15 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-21 10:01:29)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
