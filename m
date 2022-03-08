Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9D94D229D
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 21:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392C10E33D;
	Tue,  8 Mar 2022 20:31:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B662510E33D
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 20:31:11 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id ay7so491703oib.8
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 12:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ggKE+QQN96ACgccKsgFkOnubBkvwOfbXHtYWYxkQBiY=;
 b=ChyVvEiI6i2Y5+AJDxTMK0DvaXspW10L04xc7T3dBzWFVLrvr/QoeFenREIvCdo6a6
 9R7dWKbI7LjPm/hsNp7oZBDMlDQvVHw6DBtblOF/PkcJZIipiktXOCmSy3AcX323Ulwe
 tVpUezHz9kUATYgbAc2FC4LycF9VnfQYUOreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ggKE+QQN96ACgccKsgFkOnubBkvwOfbXHtYWYxkQBiY=;
 b=d3gb6rKfaWkpQrAXe0j/459RJEkuwxTkE6EAdxDCJ00WxsubLZsqWicN/GpaTb3rsB
 lo3ZbGAaHP4gMRwqqFynhxu8kQ/Gklj7JDdcrrdzaLqi3/+onaNLdCnGfM7CxDqmiBt8
 6lTaFgeR0jgwGjhbz8VMyKAmHYgrTemt4PgVMvwH30bSbuZ4xEWHKcz5sA9pLaU5y9ht
 Gb5eXaF7SB/nZA0vYjPG8vZXNI9SAqacE86B7B1mk3EaY2seph0pGsqkzsHga7BM7zJZ
 GOstx7pZALjldFicmdSozUVuFTFI1RbdzaT4aY8kbpJHMOpK63913QCiK0fWq9XYy1uv
 ZyZg==
X-Gm-Message-State: AOAM531OTN/bYmPXf6IODBEg4u1L8iLrUX1HbmB3dzmA8WOgltSpoVE7
 iHVq0mCTK6CttxkjbOqjxpkkvRErwUB0OyfspUKiig==
X-Google-Smtp-Source: ABdhPJw4rTppu+6vf/ZU341j6fzv5vxD9Y57pMhosx4Tq2+tN5qUwZzja6HMzrdn+PktqJlByzAZ+pahasDpswzJwa0=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3860939oib.63.1646771471006; Tue, 08
 Mar 2022 12:31:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:31:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:31:10 -0800
Message-ID: <CAE-0n509i4o2vWp_Ukms3Uswqpk73JiCN3_Q3DC8qSVbp4P8ZQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/5] drm/msm: split the main platform
 driver
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-03 19:21:04)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 857eefbb8649..c89de88ed2d1 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -255,3 +258,170 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
[...]
> +
> +static int mdss_probe(struct platform_device *pdev)
> +{
> +       struct msm_mdss *mdss;
> +       struct msm_drm_private *priv;
> +       int mdp_ver = get_mdp_ver(pdev);
> +       struct device *mdp_dev;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);

Is this set here so that msm_mdss_init() can use it? Can we pass 'priv'
as an argument to that function if so?

> +
> +       mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +       if (IS_ERR(mdss)) {
> +               ret = PTR_ERR(mdss);
> +               platform_set_drvdata(pdev, NULL);

Is this platform_set_drvdata to NULL really necessary? It would be nice
to skip it so the mental load of this probe is lower.

> +
> +               return ret;
> +       }
> +
