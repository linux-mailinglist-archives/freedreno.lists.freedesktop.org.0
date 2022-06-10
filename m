Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D382546E9E
	for <lists+freedreno@lfdr.de>; Fri, 10 Jun 2022 22:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0C9113EE2;
	Fri, 10 Jun 2022 20:46:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC67113EE2
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 20:46:36 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r206so621183oib.8
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=WXP/dnK0YDlK5/E1i9cz7pX4wz3nrSJNyTUfLHkhr9I=;
 b=ZJj1KqgR1rdW1l/uVn+xdn9Uy5h5YJC3oGspYfLYmJCRSQeLZEWnQpZdwnMnSyrtoo
 8GPARFoFuqYRU69ZPicw7P8yJiycawGkEBlmAzh5nxQCxcta+6eTUuJCHwqUjjHaLALT
 6bZi2BmlRX6cZTvVBfVuh1+9L384gU+pRXglw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=WXP/dnK0YDlK5/E1i9cz7pX4wz3nrSJNyTUfLHkhr9I=;
 b=DhbtxKvALU5+ncd5xNMI0Cyuoa4eqgbfFXwoWI+urKqWT7MJrADQaF3K7H22PDNL9F
 R8QxMqhYm2iF0P6rNKgocmA1yt3yNHCf6hlCPLC2HG78bcY5JFQmHGxX4MQXJ1xucEPG
 eYDn9UOH+Jivr6hSViRczntofsn//1JPTKbd5U1vWwJ7IFT/4jMyKIzhWNH9e8U13TRl
 oxo9mycbL2RORE59WMhnoYSrBXyaN0Np2lL7eU8KOj3D6tcmBt56K1k4aL5eGU6Lm73z
 9yJV1Yp61z+0iG/wL6o4KorYbfn8l0L7fJhMwfSHvAa0bIZjUEl2MSM5ltHlwUHUXGoQ
 ixyQ==
X-Gm-Message-State: AOAM530SVhZoDe/T1MQ6X6N0PQgFMMLt06s+dX5cJ9cxOvkehA2YqVVZ
 xNtCPX+fjqPdJwF3PrIi3/AZBDA9zr4wyA0NxU+TZg==
X-Google-Smtp-Source: ABdhPJz6T8iyP5MXE+PWGWDiJ+4fCVtVAbI+1HHpHDGwLRZ4/RlvOsKQRvifEGJuMz7pt9TYFPJ0sL5BhGArjtPw9lY=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr891625oib.63.1654893995898; Fri, 10 Jun
 2022 13:46:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:46:35 -0700
MIME-Version: 1.0
In-Reply-To: <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 13:46:35 -0700
Message-ID: <CAE-0n51vKmQ683TTnYm8VxSquqYqL2_3=Ku750r--0GV4JcW8Q@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 06/14] drm/msm/hdmi: drop unused GPIO
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
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-09 05:23:42)
> The HDMI driver has code to configure extra GPIOs, which predates
> pinctrl support. Nowadays all platforms should use pinctrl instead.
> Neither of upstreamed Qualcomm platforms uses these properties, so it's
> safe to drop them.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

One question

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7267167d5ef1..6d79f1b910a5 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -233,6 +233,20 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>                 hdmi->pwr_clks[i] = clk;
>         }
>
> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
> +       /* This will catch e.g. -EPROBE_DEFER */
> +       if (IS_ERR(hdmi->hpd_gpiod)) {
> +               ret = PTR_ERR(hdmi->hpd_gpiod);
> +               DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);

Did you want to print an error with eprobe defer in it?

> +               goto fail;
> +       }
> +
> +       if (!hdmi->hpd_gpiod)
> +               DBG("failed to get HPD gpio");
> +
> +       if (hdmi->hpd_gpiod)
> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
> +
>         pm_runtime_enable(&pdev->dev);
>
>         hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
