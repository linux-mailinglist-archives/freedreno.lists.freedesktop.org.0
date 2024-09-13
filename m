Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7EF977EB7
	for <lists+freedreno@lfdr.de>; Fri, 13 Sep 2024 13:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B8D10ECE7;
	Fri, 13 Sep 2024 11:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MWfKmwQc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7910ECE6
 for <freedreno@lists.freedesktop.org>; Fri, 13 Sep 2024 11:44:18 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6d3f017f80eso6726757b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 13 Sep 2024 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726227857; x=1726832657; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bpGVAz7F68gq4K0wsGbVi84hQs0Zw4wJBgelJinUR+M=;
 b=MWfKmwQc713gyERz+JxWiB4F/xJS4Ab1t3Gz0UAk/hq2cvUI5ZX6CpbnEqMzog/aFH
 jF0BmULfv5M36z9N1tA4+y5VU1iecrsqswT/8Lme3zvjcB1CEBueElm9LYBplUa7vai6
 XTvPnRz84brJKCrjE3Ui4opjZe0ibAkbqOw20OHRpuYu3p9mAVXSqeDV1JQUqLLnltWU
 AYkUGfNWT47Kf4P8dRYViRNiBTrIKJaFDS0LW1/hmHMapK6vrw2LHrdbuDzbkUDJ21NO
 eYybhAw0qurDEgLg4Ry/FJR/qqlUyLEwPMhhrWTOnlOgC8VnozbdWLLYXuZjxn+1IfwV
 EJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726227857; x=1726832657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpGVAz7F68gq4K0wsGbVi84hQs0Zw4wJBgelJinUR+M=;
 b=BZ3WLwVinRamFjjo2pmBWY/tt4RAYaXXEuGLlCXaZ54rM+PT1Ai/xaIGv4fOrBDmaN
 OvvqrZM16XXqtBNSHe3hSR0b6O/tjXALa2WMxlegca/1GRxoW6KkhjGRctMcgK95EC5J
 GFNWmzjA/KaW+9QysdfECXEaw1dh5NOFaAw3NJtC8N9Uu3o/l09SzXm5oy/4DbnMws6p
 iDfWLZF9PIjznVbg8ofeQFHdU7cRJJkRcvm813J0oYC+GTjwEvC9walwXEZQH/0gTbPt
 nuC3v8iri/Gt6Mvxg/4IfXx4zXi15P7ntP65Eri1rz4RwRA8wcfe6dIZ4f4LtFRSkGsh
 zH6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGe+2A+sQCFbH1Qu7VuzFk+yB/u7p74jtDIc9ZJ3cUIvVodh0M29un+hQXiEhpRNcf4dFGGfHJXtk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzevo0sPQfWjxhyu417tZm7du4G5Z7ooetxybfQMaokpitK5oRt
 47/TrtUpk+tPl/ZzZ/By8PnIna4Sgj6Pneldc0KcXRR6KCEB9jOSBEXYAdTGHDJczlV7P3fyU/g
 7IMMdlV0G36WkQaFZKc4Up6M62KNEa4CpsLZWLA==
X-Google-Smtp-Source: AGHT+IE+HCTz9/Hpne7uiESMruAIZ8sOYY9ablamvHhKXDnIFQMaJZtzXwjRu+Y8yXtv+wftvk256sWwlMRwxMdIsno=
X-Received: by 2002:a05:690c:3708:b0:62f:aaaa:187a with SMTP id
 00721157ae682-6dbcc26265bmr21823667b3.14.1726227857290; Fri, 13 Sep 2024
 04:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-6-quic_mukhopad@quicinc.com>
In-Reply-To: <20240913103755.7290-6-quic_mukhopad@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Sep 2024 14:44:06 +0300
Message-ID: <CAA8EJpqyr0b4zUZ3h+bTASru74fm1U9LGJkpqcQhEChH2EexXQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, konrad.dybcio@linaro.org, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_riteshk@quicinc.com, 
 quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 13 Sept 2024 at 13:38, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
> The Qualcomm SA8775P platform comes with a DisplayPort controller
> with a different base offset than the previous SoCs,
> add support for this in the DisplayPort driver.
>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e1228fb093ee..e4954fd99eb0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -118,6 +118,12 @@ struct msm_dp_desc {
>         bool wide_bus_supported;
>  };
>
> +static const struct msm_dp_desc sa8775p_dp_descs[] = {
> +       { .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },

Please wait for the discussion to end before posting new iterations.
In this case Bjorn pointed out that this is not the full
configuration. Please add a comment, describing that there is a second
MDSS, which isn't declared here as it wasn't validated.

> +       {}
> +};
> +
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
>         { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
>         {}
> @@ -162,6 +168,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
>  };
>
>  static const struct of_device_id dp_dt_match[] = {
> +       { .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
>         { .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
>         { .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
