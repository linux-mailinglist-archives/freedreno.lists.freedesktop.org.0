Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BAA7CD643
	for <lists+freedreno@lfdr.de>; Wed, 18 Oct 2023 10:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C777410E3C1;
	Wed, 18 Oct 2023 08:20:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55ED10E3C4
 for <freedreno@lists.freedesktop.org>; Wed, 18 Oct 2023 08:20:19 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d9a4c0d89f7so7676343276.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Oct 2023 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697617218; x=1698222018; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x3vk9WdgsgALGZ8oIqyx1M2Q98eDsGMriT18jqbbO68=;
 b=uYhXXoWLfZHfDsBxmjHqpnYmfnmp/Ef6/Iw7W6oPL9jvG8sf1gnYX288NGY3z4f/Ya
 dxtV4BBhlfS+rksSauNfjDTwBdhbbgg7aM9iUWxMGQkGSG14RhNyJ4kdoqe0v7oTllAi
 jjRjbIw/p9UY3urUShPpw8fvzOUk8dwWFLqXtnw1HSeHN5TOarBZ2CRZXSM4iMR9/j9p
 gPSWbAxSPHe/B8tG9bb5LPTbtrMQk3v/FquVL7NSHJRKCWkJd0cwIDcNk2rGjJS+BLSU
 4Rixse4Jh9pH2vzhq5h80oxh8K633FzKe1L98XRvuN2vVNqVsi9NFsW7nsJOSWEPevQJ
 PucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697617218; x=1698222018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3vk9WdgsgALGZ8oIqyx1M2Q98eDsGMriT18jqbbO68=;
 b=BDJ3LMCXe/2BdZ1DTD2hDBapuzBb5kfKEfOBIn+JV5d2cni5kR8AgsBuFDfj3lQCRe
 u/gcfM/F8G84GgMdfjAXcvWUu0ercWFKMb//OW8mGm3gb7coLO8N7jJIh1OBQFzWWJLU
 uJEB0gfZUfR0AhI/mCaK4UaX5OyeqggN6aCjHbvm/qx4LPcndQB4tWU7KAdfQz2FdvQn
 FPkoYh2uSYb88RzAHNxFmiJTRgpL5DRR1Syjij4A/KoAhELqGeDTDFfr4eRwPQPDq0Fs
 So5Ik0Qbmso3jxGu6YBYWGVm4PTJRJdWid31EhCYMNt6nGkghvGSKo7i6ZPqxFz6ln8S
 9ZPA==
X-Gm-Message-State: AOJu0YzgzSQFqEvl3UtJIs3dNRmm9a5/lyegZnAYH4YHY6kU26ytq0Lr
 Ub0ItYE56XQrB+qoeQRzHToIAlAD4GvQep/KbmWTiQ==
X-Google-Smtp-Source: AGHT+IHggL2ml69cTNJWS6QIps9q5qyFOKcfc/dxJ4/BM2XmWD+4v6A6o1A5nTOANs51qAxT9nbcCCKDJ7tLeD7rao8=
X-Received: by 2002:a25:aab3:0:b0:d9a:e397:3b4 with SMTP id
 t48-20020a25aab3000000b00d9ae39703b4mr4208649ybi.46.1697617218711; Wed, 18
 Oct 2023 01:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231017021805.1083350-9-mailingradian@gmail.com>
 <20231017021805.1083350-14-mailingradian@gmail.com>
In-Reply-To: <20231017021805.1083350-14-mailingradian@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Oct 2023 11:20:07 +0300
Message-ID: <CAA8EJppTrH0DG_i+hUeagsXodt88TG6vD3W-y9gKmxevWZbJig@mail.gmail.com>
To: Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 5/6] drm/msm/dpu: Add hw revision 4.1
 (SDM670)
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
Cc: Ryan McCann <quic_rmccann@quicinc.com>, dri-devel@lists.freedesktop.org,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, David Airlie <airlied@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 17 Oct 2023 at 05:18, Richard Acayan <mailingradian@gmail.com> wrote:
>
> The Snapdragon 670 uses similar clocks (with one frequency added) to the
> Snapdragon 845 but reports DPU revision 4.1. Add support for this DPU
> with configuration from the Pixel 3a downstream kernel.
>
> Since revision 4.0 is SDM845, reuse some configuration from its catalog
> entry.
>
> Link: https://android.googlesource.com/kernel/msm/+/368478b0ae76566927a2769a2bf24dfe7f38bb78/arch/arm64/boot/dts/qcom/sdm670-sde.dtsi
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_4_1_sdm670.h    | 104 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 107 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h

-- 
With best wishes
Dmitry
