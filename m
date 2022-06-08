Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B278E543E0C
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 22:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5DC11A178;
	Wed,  8 Jun 2022 20:59:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4911A178
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 20:59:42 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w16so19751384oie.5
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=FcmDs4vqa+TasYfpZVJLUBpBUyUSt1C9HSlbOciM/mM=;
 b=YOMVdz3SS4pfTUc9aTrCX3WuwDW/bMFrATGKllus5yfo9SvZzofwCdlpHpiVN2Gns1
 d5AZNsNbRhYDQS0Desv3WuqN0QQ7dyGM9dNZLwc9yMWJqwcHPW4heAwNTOStgVTvxTZY
 UfX9r8aXugrnDZJlQ4ycpUXv10eFgNnA5EuHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=FcmDs4vqa+TasYfpZVJLUBpBUyUSt1C9HSlbOciM/mM=;
 b=vqgUqLrcj7XyoAXInSELiltf5pRj5L8XNH8QHDdEt6iY5pMCsnT5tgH/hZ0aMHP0sj
 OL9CuAMlThPlgmG9jfr+AsOXqgZYBDVjIDGaMjQHalOnEnJpNn9jAZpu+Ce+QY9WzuDk
 23WvpZOMA6X3ZwQ1+Xg4UrRgHrLTnWUM0X8wnStTy/kr6TlHC0a1Twf49SuLqK8yfDiP
 5xOgCyDnTi+8VFxHET9hiTZjwv8ck96OTXHMnLeDhW3WnK61gPdmdQVVQFDGo5Wd68mC
 PXlVfTREx0hLSHN7F4PqqzYp37hzLo2+A2+R04bM0oVvIasTKVihSI1yG/9IK/L6LDJN
 szrQ==
X-Gm-Message-State: AOAM530R6C7dk9YpIKnKx++2DzT20vvVhmYD4wdeBG7wRCGHJMtmW2Gh
 aT4MXSi7LkSDGiq5vBiLaX4ptIhSOsAtJrzECtFaMA==
X-Google-Smtp-Source: ABdhPJxnlj9sN3+K7oKRZ4gWu7RbfsNuNQkj4EkKq1yNdOgmwVZ5t/rmtKGAs68dcNiueV47wbdHzEDCVycwsnvzh9U=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3564449oib.63.1654721981740; Wed, 08
 Jun 2022 13:59:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:59:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:59:41 -0700
Message-ID: <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 06/12] drm/msm/hdmi: drop unused GPIO
 support
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:17)
> @@ -543,41 +529,16 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>         hdmi_cfg->mmio_name     = "core_physical";
>         hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
>
> -       for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
[...]
> -               if (gpiod)
> -                       gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
> -               hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
> -               hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
> -       }
> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
> +       /* This will catch e.g. -PROBE_DEFER */

EPROBE_DEFER?

> +       if (IS_ERR(hdmi->hpd_gpiod))
> +               return PTR_ERR(hdmi->hpd_gpiod);
> +
> +       if (!hdmi->hpd_gpiod)
> +               DBG("failed to get HPD gpio");

Does DBG() add newlines?

> +
> +       if (hdmi->hpd_gpiod)
> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>
>         dev->platform_data = hdmi_cfg;
>
