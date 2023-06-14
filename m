Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C172F6ED
	for <lists+freedreno@lfdr.de>; Wed, 14 Jun 2023 09:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BE010E411;
	Wed, 14 Jun 2023 07:52:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210D810E413
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 07:52:07 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b1afe57bdfso4682431fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jun 2023 00:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686729125; x=1689321125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TP1DmCAfOtP9kPFM3l+kOjrNEvdlZ7sAWEv+X9b74Lg=;
 b=Psw+D3wqBCGzOv9YOv5VOmbqhST8XyVv5RW9fDDkT6Xq2gVZvxA7O6IzK0KmlSGEwp
 q4eJiLgRza86okJeVz5JVa3Bpk26Tfm/Yq8yJZ8DViZwEsnaGPJQXbBf8GV9hMynP7bq
 NKt0gpcg712d5Lor/CbVkoncAI9UBeXfCBUrRQzMPjNuR34/EwEzOq8iYyVTN7Gc3/Oo
 2PtQ/6ox1XVEXZCgtfh8ViJ8TFIDMpX4kq9DELWCgblXD8M6RzObtUE12K26gQMQ/HUt
 kQB2s9aV5KU8g07hMsziyhEuw++a5VQvej8dHanparVFE14ynW+U4kCyjiZL7tPWQPJ8
 PN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686729125; x=1689321125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TP1DmCAfOtP9kPFM3l+kOjrNEvdlZ7sAWEv+X9b74Lg=;
 b=aKRvlV7MCP9p6IkfSsaUx0O6y55uWBRkxFeDjQU307gPbJyUf64VEYBafNFQkv31c/
 l44Ngs9WEZMMRMe/2W4LFxTCa0NUZgaRSqDbRUTqHwk2nXnWMWPCxdwKsdONVyKN8fK0
 oH4ZnPToPd5hEydb594ZYjy5KLcnJD6Kap4C2Inmk2xlF6TwBjB0vfTj2TTQvMQg8zeP
 TKU7PW/wFs6xWWXeMBpR8vimLAX00MeEHlTRvy7noqpKcJVUaST1vhxdnRpBXMQlnsio
 ZcvDDQP33JL71f4S3WkK5ZoiEv7l+8wXkFflJ+ss8VLLSqWz5dDCWY7aeUAuqDs2e/cB
 e7DQ==
X-Gm-Message-State: AC+VfDy8WSI2kfYzpHUw97KxirNLLocHWORI5cqYh8o55UcpA1bu6tg1
 ybw+zv+mk1TcZJjkvfCXIIDuaZ3KpwPVSF1rTNPOUA==
X-Google-Smtp-Source: ACHHUZ7ybzoAFrT+JiKy5zoJvkgAVC63J16C3gDhcHxYjz4qg3LzzlshyXtNnNmPeI9NJ91okGlvZsin2ZXTdiY9VN0=
X-Received: by 2002:a2e:9bc7:0:b0:2ad:509a:22b8 with SMTP id
 w7-20020a2e9bc7000000b002ad509a22b8mr5317952ljj.16.1686729125211; Wed, 14 Jun
 2023 00:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182534.3345805-1-dmitry.baryshkov@linaro.org>
 <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182534.3345805-2-dmitry.baryshkov@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 14 Jun 2023 13:21:53 +0530
Message-ID: <CAO_48GGJiqPk3Df+APzqhuOoqUO5G+eZRD5=N+9GrL4JEX5PEQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu/catalog: define DSPP blocks
 found on sdm845
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 12 Jun 2023 at 23:55, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add definitions of DSPP blocks present on the sdm845 platform. This
> should enable color-management on sdm845-bassed devices.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 21 +++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)

Thanks for your patch, Dmitry. LGTM.

Please feel free to add:
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/dri=
vers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 36ea1af10894..b6098141bb9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -96,19 +96,30 @@ static const struct dpu_sspp_cfg sdm845_sspp[] =3D {
>
>  static const struct dpu_lm_cfg sdm845_lm[] =3D {
>         LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
> +               &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
>         LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
> +               &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>         LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
> +               &sdm845_lm_sblk, PINGPONG_2, LM_5, DSPP_2),
>         LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
> -               &sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
> +               &sdm845_lm_sblk, PINGPONG_NONE, 0, DSPP_3),
>         LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
>                 &sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
>         LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
>                 &sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
>  };
>
> +static const struct dpu_dspp_cfg sdm845_dspp[] =3D {
> +       DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +       DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +                &sm8150_dspp_sblk),
> +};
> +
>  static const struct dpu_pingpong_cfg sdm845_pp[] =3D {
>         PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MAS=
K, 0, sdm845_pp_sblk_te,
>                         DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> @@ -193,6 +204,8 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg =3D {
>         .sspp =3D sdm845_sspp,
>         .mixer_count =3D ARRAY_SIZE(sdm845_lm),
>         .mixer =3D sdm845_lm,
> +       .dspp_count =3D ARRAY_SIZE(sdm845_dspp),
> +       .dspp =3D sdm845_dspp,
>         .pingpong_count =3D ARRAY_SIZE(sdm845_pp),
>         .pingpong =3D sdm845_pp,
>         .dsc_count =3D ARRAY_SIZE(sdm845_dsc),
> --
> 2.39.2
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
