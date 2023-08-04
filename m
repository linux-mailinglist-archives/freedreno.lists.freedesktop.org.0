Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 797A577049B
	for <lists+freedreno@lfdr.de>; Fri,  4 Aug 2023 17:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98B10E0C5;
	Fri,  4 Aug 2023 15:28:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD9910E0C5
 for <freedreno@lists.freedesktop.org>; Fri,  4 Aug 2023 15:28:26 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d066d72eb12so3256786276.1
 for <freedreno@lists.freedesktop.org>; Fri, 04 Aug 2023 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691162905; x=1691767705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bOp+t06WK94f00hVoOjlTqLRBmqA68qFwjlm/n5u6Ec=;
 b=xHyAU5gFLrQk/gFvvaEuvE4iL524vBoq3VFKmFGmMrJmlrLhZ8ekaq6F3/eh661EnK
 UJx8eo2HkhJY/2v3qR0pPpqKEkGXXLOzA/IvPPkd+5jaEPwY1Ngv3Ljw4B/mGDWp6aJK
 U2OEf6+L1JpngBNlD6LdMhd5wf8Rx7GSYyBh3eQtosM8yz2CH69AJQohmY3pnrKAv2zn
 Yu6NCNB4LW4fzH5xJj4Kkt3EPcv8LFnL16A+0GbnMWkHwa6PHFgSRbJlFmYNrQTwnFCw
 fQwlAwv2JxvwaL/Gi26pgvLI04zes8zfaEXA0T6hfuDa/bxieF4/dpfgGKWORaWxaDyO
 bvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691162905; x=1691767705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bOp+t06WK94f00hVoOjlTqLRBmqA68qFwjlm/n5u6Ec=;
 b=EzddqpNMHEBaG2OgnKahqDMHnAMm5iw9uCje7kdBB3HFf3MuXrhH3eBkVPpqXUWxPl
 NOgqjh4qDD2BIZRPx1yap1OCFeFF6VkVQ4/YL1QKDGY0pozeWUwy1lstOcaAOChwREoP
 YqVSo2/K/sWk9XQfaYazd9gwWKXQz7QMbyvW6QzFaM+szcvSVXNzIPobQZrr/7CU9X3w
 BLzKEqh7bfjbDw71jMNBgRrGyBM2gDSGi8WmAncp5N4n3rDg/xWOF7v9HcIMkLnBIfzN
 mGexyoTJlRaLCY26zrGasW6lKWUBzQwyyKG0KpRA7NpxRGww1vXYP3tnHdaORKk18ZyT
 10tw==
X-Gm-Message-State: AOJu0Yzj+MbuQ2ATWbvMYSgOGLjKWMtotZh36AtP2zMIi4RDA7Oh6B1h
 xwEA4kpouPuLLKIEWL83SyenuXISGPtmVXqz1lwJ/Mbm8W4aIoNAjhg=
X-Google-Smtp-Source: AGHT+IHqkYFEA1xwnINMzjY1othogdYg+XLYUdXpv/bsW9GIOBmficGrOej0iBqP7HOWy9w0haZ7t5epondlOjOTEac=
X-Received: by 2002:a25:fc5:0:b0:cee:639a:be94 with SMTP id
 188-20020a250fc5000000b00cee639abe94mr78778ybp.0.1691162905601; Fri, 04 Aug
 2023 08:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-14-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-14-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 18:28:14 +0300
Message-ID: <CAA8EJpq-Z7vNJjQML6waeHOAvQ_1EtU0Zx5-9f_q9j-KyOq4Tg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 13/13] drm/msm/adreno: Switch to chip-id
 for identifying GPU
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Liu Ying <victor.liu@nxp.com>, Mukesh Ojha <quic_mojha@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Since the revision becomes an opaque identifier with future GPUs, move
> away from treating different ranges of bits as having a given meaning.
> This means that we need to explicitly list different patch revisions in
> the device table.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c    |   2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  14 ++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 137 +++++++++++----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  14 +--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  49 ++++----
>  7 files changed, 115 insertions(+), 105 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
