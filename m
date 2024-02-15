Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D0855CF7
	for <lists+freedreno@lfdr.de>; Thu, 15 Feb 2024 09:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12CB610E046;
	Thu, 15 Feb 2024 08:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K9+ZUGr5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2FF10E104
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 08:55:46 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso1234734276.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Feb 2024 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707987346; x=1708592146; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A6CQ+IRO32lNLtjlKEcSjvtD+crehBuMoEtTj27QIp4=;
 b=K9+ZUGr5NRAuUO8uoJRHayDi3AXqJxS/p16RnHoa9CLZngtqE881skyPFIeCPGa4k9
 +YG0ZLoJQbHbC9bx1GiXaxnXwlX/jxGpQqIwqq7oZ59xgR62xYVmbXMd5CXIahC6CjP0
 FHbOqnBdd4xdArnorI2s63TAwtzNLThzoODYIg/30KrQOWUXPnNzCdNNc1EN7HsvBKO7
 8qCU4tK4KD5mzx2MjHERXySrtNZFZi+0NVsY7My2DhJFiay7RmZOsn44eNTE6x93YDXq
 GHpaeC9ZxjLax+S/haUxyO9XJfpO5hSaIatwCVx/Wqc144hQ2UV8e3RMxohNAk5BT1Ic
 Md6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707987346; x=1708592146;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A6CQ+IRO32lNLtjlKEcSjvtD+crehBuMoEtTj27QIp4=;
 b=U+wx5hq3WTOZL++tp/E6pSUlkHkp97RAxortrMm10S8VEk3eonRyokgqdJDD5Gficw
 lnUJSVSU/6ekeSO2pK/sND5s3TYn6uruEvifSywkhIWtUloDB7KwjnNezz0d1a+w3hOs
 XoEw39rr2ZybrhRfNh6ab+lQVOvlTqcvTxp7xxHME9vQsxNfR7zACVfHgyG86F36jjQX
 qzoIvp5QJLinP807MXRMj1l+/XfGG5+wFpziNw0HY6tuCmZwDwBgOblxMgKvMmPOWWkO
 vPQp1gx9EeXWPNnjAnVMMbnz0GVlIDTLogAd1PASvZtqsoLLfnY30xHGgcfPE/SyKK9G
 +ncQ==
X-Gm-Message-State: AOJu0Yz5r0eM6XRvrp1SaxDNRfnaU9SqLuXntOtn9aHzG1z2CuIdoCUY
 4smF8kOIbUTg3gtWh33gKH31ppH4Ps94fuH0GPmewKt28MvNtSnfzx27XaPSDZJo8YftyREvO3p
 CrfgJrLGl0gw36dDOHlG793obDOMmOrMLlwvn1w==
X-Google-Smtp-Source: AGHT+IE4lbTZKhBywpPpsira5YbX/aKUOSR2Y7bKcNEGDTo00brA9daDt/YyPAL9VY6ak8GFW08RebDPlLnamXNKJ9Q=
X-Received: by 2002:a25:3c87:0:b0:dcb:b072:82d8 with SMTP id
 j129-20020a253c87000000b00dcbb07282d8mr3327167yba.15.1707987345897; Thu, 15
 Feb 2024 00:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-18-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 15 Feb 2024 10:55:36 +0200
Message-ID: <CAA8EJppidULwO=PG7t9iZbSeK3v_=W_92s9sVyJ5Do0W9ja3Sg@mail.gmail.com>
Subject: Re: [PATCH v3 17/19] drm/msm/dpu: modify timing engine programming
 for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder timing engine setup programming in the case of video
> mode for YUV420 over DP to accommodate CDM.
>
> Changes in v3:
>         - Move drm_display_mode's hskew division to another patch
>         - Minor cleanup
>
> Changes in v2:
>         - Move timing engine programming to this patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
