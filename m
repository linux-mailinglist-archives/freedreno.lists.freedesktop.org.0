Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA276DCB8B
	for <lists+freedreno@lfdr.de>; Mon, 10 Apr 2023 21:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3243910E25B;
	Mon, 10 Apr 2023 19:28:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34DC10E25B
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 19:28:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id e20so6031060lji.6
 for <freedreno@lists.freedesktop.org>; Mon, 10 Apr 2023 12:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681154913;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=cV7iHlDSCkwR3Z86lazv55Ruacc6OCgU/OMjDSnBLGA=;
 b=lmMtmMZYSPau5HIiRuvkaPYnLQadTiUc8bYELRlQYBN/6UsWZoNLmz+hsApbhEmaNJ
 rt3P9DWoya5zNZhEg8f6onN7v7cpTwYGWY/7VQk4RL9aVM9T1w6FMR642KNDTrR/DjZz
 IYjZnIcz4cf+6qeXWblu/JVVdkd2sfUWA6wks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681154913;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cV7iHlDSCkwR3Z86lazv55Ruacc6OCgU/OMjDSnBLGA=;
 b=OpD+WvSIIDXr7fYAiE6UCev0/oEBH42yMLW6BscDmwMr6wGmPGhAzLQZALbqf6H42T
 8WiaTtrkCi4SpPibWaXQetwkNXSv6+9eNGbuRXlg9bSl6LCquaaLFhFjdF8UBsNIkFPX
 TZXRc+UnKu2e7yWDb8of4mRko2XaSbPoPNMj9QoOZ10sZCk5dKsgo5MQhFb/TChzOF2I
 wbCbicmtSEJmlHfNOMFb5hiWdIetZ5p531hRrQhT9FQnsdcHaM1u0WOswsRdEbVol6bv
 qkiuFzjG5a6tFPbgEmChoGS+Evy/fPZuytx+g6PE4i7ocCLDSZSi+YHG+EelazAPLgzW
 14mQ==
X-Gm-Message-State: AAQBX9dQORvOWDv4oRz0BqyI5HuUirw5OVbnjZCGm0GtOUIWGNET8ThL
 /hsS81XFKKfyBJOZLZr8Z3UllzAz0KAs2PRQZZJLVw==
X-Google-Smtp-Source: AKy350alTOxLOMLHu6EdCkF/pTKW48gCDfBI3KpxJaXbdN8LaZEHWn9jGZb5m808HwS5cTn3lAVhtWfPsMYChQpj/0k=
X-Received: by 2002:a2e:9842:0:b0:2a7:828c:591b with SMTP id
 e2-20020a2e9842000000b002a7828c591bmr702366ljj.10.1681154913050; Mon, 10 Apr
 2023 12:28:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Apr 2023 12:28:32 -0700
MIME-Version: 1.0
In-Reply-To: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
References: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 10 Apr 2023 12:28:32 -0700
Message-ID: <CAE-0n51mkvb0nmF19NTXeLegzJJU=53ywUOqEP0skMtU3Oh3xA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH] drm/msm/a5xx: really check for A510 in
 a5xx_gpu_init
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Adam Skladowski <a39.skl@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-04-08 18:13:29)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") added special handling for a510 (this SKU doesn't seem to support
> preemption, so the driver should clamp nr_rings to 1). However the
> gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
> thus the condition is always false. Check config->rev instead.
>
> Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
> Reported-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Maybe as a followup you can put a WARN_ON_ONCE() inside a new function
that gets gpu->revn and warns if the value is 0?
