Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827956AFC0
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 03:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52A811248B;
	Fri,  8 Jul 2022 01:29:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7587710FEAF
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 01:29:51 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id s188so25188689oib.6
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 18:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=HQoQSqm1Y6gc3vLd2/YcryN+qPwBTmG72+1Cc+N5QmA=;
 b=CykAEtsvYnPfrFIuJwuOCf0sw8z7xciHsnHSMcRh16QnXk6QlIvfrYCuLdkrEmDw8Y
 xUg/8KmL2U/g8kmyvsdHQy7ZmsMN3fBtiainjMMGzfllqj0dlPHpKGRfFA4CTnWyv2mx
 SaD57uEHfP6TCBWZoutJutR3hP34XDXxaOhfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=HQoQSqm1Y6gc3vLd2/YcryN+qPwBTmG72+1Cc+N5QmA=;
 b=if2wrnJ/ttUtQwmHqJ51LtTOyg57BK2hN3EhtVGz2VV+M3Wh6BdmuuTpvhGdXh0uzk
 i63EBZWS3NiBPaMrazphNa44jpLonw6S0CzGociUyMaVFb01zr1s8RX55fNjCNTndj99
 mlBYU5vWgL9EgLXY8ePBu/KLBb9s/hfPLmgMk833PP8g5SAA+GTH1vobvFGt1fSmOgly
 3c7DLXG8oiu+wh+nXq6jKALiJbAwaz1LG+ghwtf53J7Ay2zZBD3apfEO2LZb9vaxDQ5R
 /7WyetbL3R9JIiUeUTzvJcfZEo+SGFgX1Vc+DW+iVXHXS6BNidsSxvo0DRn4BNbrz0MK
 IBNw==
X-Gm-Message-State: AJIora9KbQaVuR3vBCWYe8KpWV4ZBaLFSiouLH+8qGlqp6u6mHDPv8Bi
 miDoyyA9inIOZ3ETiIqljJdv4JekY8/FxKysuiPzcA==
X-Google-Smtp-Source: AGRyM1uJ8/E8SerdAnJl3f3McgySgrfAOxikx5UkGEHyUZlQA3GOjpCjdWqPyZoanxplGHhTQrvxDsHhBt2MrfSEudI=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr457469oil.193.1657243730587; Thu, 07 Jul
 2022 18:28:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:28:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:28:50 -0700
Message-ID: <CAE-0n53zV2OjXxjJ_AwCDcAZvOY+BU0-xipxQkup3muHMRCPXA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/9] dt-bindings: msm/dp: drop extra p1
 region
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-07 14:31:56)
> The p1 region was probably added by mistake, none of the DTS files
> provides one (and the driver source code also doesn't use one). Drop it
> now.

Yes, looks like the driver doesn't use it.

>
> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 94bc6e1b6451..d6bbe58ef9e8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -29,7 +29,6 @@ properties:
>        - description: aux register block
>        - description: link register block
>        - description: p0 register block
> -      - description: p1 register block

The p1 registers exist on sc7180. They start where the example starts,
at 0xae91400.
