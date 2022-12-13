Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8990564B871
	for <lists+freedreno@lfdr.de>; Tue, 13 Dec 2022 16:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538110E335;
	Tue, 13 Dec 2022 15:31:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E64C10E337
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 15:30:58 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r26so18205319edc.10
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YNJl4dW3INoFLSur18KGvAEZEys7Zg7HXl7mE/l9WMc=;
 b=cAdyHfnfTDl6Q1NGQlVuUwFnzVmOszYJerLagpzhCTJsBpIZzvJpbcry6wj/DZ8C9b
 T9PXTL/orC/c9TALqWuJtqWUmDhBkUsA8tOl3F3l7VFJ0DdeeepXJiUhgllK03T8m01h
 Vkjo0Sj5XyI7TYIDUEcxxq+unpUGpbk9fqbwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YNJl4dW3INoFLSur18KGvAEZEys7Zg7HXl7mE/l9WMc=;
 b=gB8PTzXsPbUYRABa2m7SjY+EOa7JpKakoM8ZpN+RXBC/8Mts6lW9TpuNap502fmx/K
 OUZO3QwTxsaJGcyq+xs2vrRRexaattPVauK20SLjxnOrmkTNswPWS1ZG+bhknwNu8jOe
 svY1ouaWAtEtgdBtCE0Mio5eNBQfnpLhUNMzUR9O5bXdDFqrCaI4nMuQ+wdRuh6tmsyF
 WHaC3k9nYjzxg6ElX2EFUsLYBRRxakfGrxHx2pcNEofafT7PaVni06SvpvRqQnqWHOrl
 48xkUH+LKo/TE+B32b+en3ryVEWN0K1bFfG8WkWeJaIA9shRmaMhdGOn0206MSabt8St
 72sg==
X-Gm-Message-State: ANoB5pk6kIfRPzbtPhOTaLv+FH1Ekv4a0OU8bSskIA9hn5BjKp3jQDU4
 bLXHbIJlHj2ngyDnt4sziRxpXL/Z9EvUpUv1Eks=
X-Google-Smtp-Source: AA0mqf68yyMthH4jQlSSbWJdpN+OcDEMWGFDHOhemFy0s1TjtUcKbZfI9BogYOB92GLX7b7zdcSzrQ==
X-Received: by 2002:a05:6402:5290:b0:45c:834b:eb4a with SMTP id
 en16-20020a056402529000b0045c834beb4amr21055280edb.21.1670945456849; 
 Tue, 13 Dec 2022 07:30:56 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 dc20-20020a170906c7d400b007c0f90a9cc5sm4694205ejb.105.2022.12.13.07.30.56
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 07:30:56 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso8303696wmo.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 07:30:56 -0800 (PST)
X-Received: by 2002:a7b:ce10:0:b0:3cf:5731:53db with SMTP id
 m16-20020a7bce10000000b003cf573153dbmr220771wmc.85.1670945032985; Tue, 13 Dec
 2022 07:23:52 -0800 (PST)
MIME-Version: 1.0
References: <20221213002423.259039-1-konrad.dybcio@linaro.org>
 <20221213002423.259039-5-konrad.dybcio@linaro.org>
In-Reply-To: <20221213002423.259039-5-konrad.dybcio@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Dec 2022 07:23:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
Message-ID: <CAD=FV=U+prbiaQfWRcqp17oRgxFV=JvmweNFoK0+xYcnfoJr=A@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/a6xx: Add support for A650
 speed binning
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 12, 2022 at 4:24 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add support for matching QFPROM fuse values to get the correct speed bin
> on A650 (SM8250) GPUs.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2c1630f0c04c..f139ec57c32d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1887,6 +1887,20 @@ static u32 a640_get_speed_bin(u32 fuse)
>         return UINT_MAX;
>  }
>
> +static u32 a650_get_speed_bin(u32 fuse)
> +{
> +       if (fuse == 0)
> +               return 0;
> +       else if (fuse == 1)
> +               return 1;
> +       else if (fuse == 2)
> +               return 2;
> +       else if (fuse == 3)
> +               return 3;
> +
> +       return UINT_MAX;

Unlike some of the other functions, you don't need any complexity. Just do:

if (fuse <= 3)
  return fuse;

return UINT_MAX;


I'd also suggest that perhaps "UINT_MAX" isn't exactly the right
return value for when we have an unrecognized fuse. The return type
for the function is "u32" which is a fixed size type. UINT_MAX,
however, is a type that is automatically sized by the compiler. Though
it's unlikely, theoretically a compiler could be configured such that
"unsigned int" was something other than 32 bits. Ideally either the
return type would be changed to "unsigned int" or you'd return
0xffffffff as the sentinel value.

-Doug
