Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0DD6A097A
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 14:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B4D10E4C9;
	Thu, 23 Feb 2023 13:06:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD52510E4C9
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 13:06:35 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-53852143afcso42946837b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 05:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l976B99XbUna08WmeRhXUm4UkQfISnSwvYYzr2+N86c=;
 b=qCFX28+RmwbMs9tpeR19tdUmhwjV+3IV4aF4Gydv6qUmejZ3SQkwml0zKgGQqTA5xf
 X87HDDK8AjUvFyv20SDTeZykRVX6IHWtD50HEih7dCcq5NnMleFAr+IBxzoP0o+CR+q5
 8tSUkIN9QpxSaGMo6trcYpUNBPxbBzI4Yqltz+Wb+a0YGnm+W3kPkf3Wssh6QAsX1Vum
 c8AFxcbjdk+HNUEYWbU/Epcwpq0GliRbp7PS7iqSwwWRclarjnxBsKhQU9+MyKI+gtI4
 HMD9W+g8dl1VxiDvITDL+L2EwaNSFADD1Cq8iaV1qBArlRlnem9lsC/LuL5RaWe9kKTj
 F6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l976B99XbUna08WmeRhXUm4UkQfISnSwvYYzr2+N86c=;
 b=YZQbRu3HB031S5bKw8UiMeIGpetb4JruesALgtaqDgkSdWvtCU4WsYdLKwHbM7ijgZ
 D/HJq1gdOdSCNHVpCbL8dfodpKz1XCgNZzRJvBTzznGRHeDLoL/gppRzzPpNPgjmsWbc
 4zo6C+vCwfCCHXXOe7snoAqqDhiYeJbzLVZIOt0PqYMWsPwMj0OF8mPdNakkFV22WmAv
 jud9qPFEt2X//ZFEmulzkMYHW2y80gMZSPo98sOp6AACvq6KaEpsZ+DpvE0X9p/ElrzH
 pvkwvMqSdxBx8VPC3SlD37IPcdH4DkohAjECSPd/BTTwsL7+frERqFrBNyHuThZPt5rW
 Qbng==
X-Gm-Message-State: AO0yUKXWk0PdwfuBzdOS/fotfqSaF+qgxvQaJToTC/6Ww1HbSBdbkShw
 ySvv5hTcMLtTpVYWIkrmyQt1/WdAm5mdilQnhOL1zA==
X-Google-Smtp-Source: AK7set/2vMOCqRHFpmTtAlE31OFzB2vTZ54A1Ly7Gmtm4/ZMrRWyA2L4L3oNl/nq0kGy+urTZ86JLF9PtiPqWxqc8CU=
X-Received: by 2002:a05:6902:138d:b0:a09:314f:9f09 with SMTP id
 x13-20020a056902138d00b00a09314f9f09mr2255202ybu.6.1677157594719; Thu, 23 Feb
 2023 05:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 15:06:24 +0200
Message-ID: <CAA8EJppi45K0hQ=1fZvf+Mps+4uEkXmLFeqdmyk-yk31CNvUsw@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 10/15] drm/msm/a6xx: Fix A680 highest
 bank bit value
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 14:07, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> According to the vendor sources, it's equal to 16, which makes hbb_lo
> equal to 3.

I think we might be stricken with the ddr kind difference here, but I
would not bet on it.

>
> Fixes: 840d10b64dad ("drm: msm: Add 680 gpu to the adreno gpu list")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b5017c56fa1b..2c4afecdd213 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -885,12 +885,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>                 hbb_lo = 2;
>         }
>
> -       if (adreno_is_a640_family(adreno_gpu)) {
> +       if (adreno_is_a640(adreno_gpu)) {
>                 amsbc = 1;
>                 /* HBB = 15 */
>                 hbb_lo = 2;
>         }
>
> +       if (adreno_is_a680(adreno_gpu)) {
> +               amsbc = 1;
> +               /* HBB = 16 */
> +               hbb_lo = 3;
> +       }
> +
>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>                 amsbc = 1;
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
