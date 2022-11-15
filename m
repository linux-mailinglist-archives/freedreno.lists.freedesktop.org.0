Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CF8629E55
	for <lists+freedreno@lfdr.de>; Tue, 15 Nov 2022 17:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B83410E419;
	Tue, 15 Nov 2022 16:01:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0210E161
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 16:01:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x2so22553214edd.2
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 08:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCH6PtmHj3XKQVwXY2Gm1n1n5KTgNrZ2aoxjacIPkLA=;
 b=XSZ1UsKd72WGVsU13AkxPx13kvV7eBMN2rk9mYv5/1BlvJuWdPfmvCjHqGY1YHuX1S
 ZKcO4QYOE4Wc2+/sm0oCJqKm0mbgDpEta1QZXmLqmoik9/WEh1cA5d8rjRXkfeZwUrS2
 t1agO5hRMm5K5WuuenC90gkUkRgs3BSOw1BPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCH6PtmHj3XKQVwXY2Gm1n1n5KTgNrZ2aoxjacIPkLA=;
 b=1w7RxCKXKn0du78/e8Bw8iZGizb5QSBi03KR7w9qWFT/PYMKdpX8UjGcHVqP4MG3sn
 77DAJnCsf1sdVVUH35gaXlvC6N22ZwnngxSLmVfgGqpCrD2GSbSGTrouHy83qeKfxdUt
 IgRrQ6qNel9K8DN3+21voIAYmfuv/GldA3GsfWswQ85NZbAPT5MNIeOC4Pfja+A+t1SF
 +z0u7Ta2WEJupalkYasZeiasDqHtsIInn39PtJJ7046TyNnZzwJByw3N8PlU/LeoXv5t
 ToCXyhKoBkviLExBnwSza5VU110gJ0YBEz9+sDkEa1U4x48HKDZIxm0KLsYBmdeSNVFe
 n43g==
X-Gm-Message-State: ANoB5pkvAU3l7Vk6mC1UjZaXoE5SH+E633acJCAyCYGBmaSqofZOd5ZR
 IOteka1EPFA/We0K3ndII8VzsMggPWDyOFnQ
X-Google-Smtp-Source: AA0mqf61BPNHX7T80zm8EyvZulsq/HdNOrSxVS14prMCPfmDo6NSQHBIcoeoF6F9NcRlxJAppJoehg==
X-Received: by 2002:a05:6402:3983:b0:467:69e3:c25b with SMTP id
 fk3-20020a056402398300b0046769e3c25bmr14296514edb.3.1668528090132; 
 Tue, 15 Nov 2022 08:01:30 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b00779cde476e4sm5656304ejc.62.2022.11.15.08.01.28
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 08:01:29 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id j15so25080170wrq.3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Nov 2022 08:01:28 -0800 (PST)
X-Received: by 2002:adf:f145:0:b0:236:5270:735e with SMTP id
 y5-20020adff145000000b002365270735emr10938918wro.659.1668528084437; Tue, 15
 Nov 2022 08:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20221115155535.1615278-1-robdclark@gmail.com>
In-Reply-To: <20221115155535.1615278-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Nov 2022 08:01:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
Message-ID: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Enable clamp_to_idle for 7c3
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Chia-I Wu <olvaffe@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 15, 2022 at 7:55 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This was overlooked.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
