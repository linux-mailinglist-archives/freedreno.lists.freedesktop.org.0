Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CA2673AE9
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 14:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A253110E949;
	Thu, 19 Jan 2023 13:58:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E4C10E949
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 13:58:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u19so5839549ejm.8
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 05:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v5VA13rKavxidD6QZf4qicQ0tLUJkUNd8HIS3LC6dxo=;
 b=PWCZl2VTRdVabv7tAsmmEjHi0KAPXIZzgyYn/fBfSjQVqBLbc2losYTOZ5hrPcVMFG
 nRHEZ5l43KQS0NdYKK9rU/yW/4TnDdnHnPS0jCi5Aa+4nImiaEWqr8oqRUzQelJzcRaE
 pZCegyUTU1/GhoYWmISS0X2bn/SvZXZGKuuU2AkSCazjPVvGyQ+wnk4J60XuG771DZ+K
 53Iv+YPXIYOTYeldMvtlqr6/8NBhKVe3jrJ5plgg1qu2YnXk+tS7Zpji2Xia0cIsaoyT
 ArrfMwolKEatHRJzQIRhIAwIxISp4b9lrbwoy56Odo9JJlNCxi/JOMOEZY4oEzaEkdL0
 maHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5VA13rKavxidD6QZf4qicQ0tLUJkUNd8HIS3LC6dxo=;
 b=sGyE6vri80Lu0Hn9SKG5WzdoehyCNRHXFOLttVE46PK4Rxhyx3NsHFN5dYoXy9njd/
 UMBu+W7LC/15k4fM9Py7KIabSp2Du18ua79Eg1haSjY6MSsTqPWf8/eRHQr5RPjX0d5v
 SqzHR7dRA+e9W7QkYQoA2vOYIcXaaAk65WAlIStkx25TUg61iC1URCWHzxktF3BH6Hlo
 D5XsBJ9GQUg4HScmiAKRkK1XhGPiGVUfLxAHOOtgwN1ULmI3+grwn1/p1iqiTJ0n1hO0
 kzfaCpTLOj3u0xJ1f0zx2jGrjKn1zx27UtAoguIaA6PHw7S/oDOeUSuYMQTfVMHHJMEz
 YdEQ==
X-Gm-Message-State: AFqh2koaRhwuSZhIunwZcd5lX6ZXVtBtVHpkoWPclIwSfXIlNOH+IhbM
 4nPVy5T279QCY3XZMqDRJ/iCBw==
X-Google-Smtp-Source: AMrXdXtYefbql8K3mRe8ERJ+/0jQZceqnzFob0etHYSasfOZFhWUpP9pkwJrvofHlN7vpD7L+M0zWw==
X-Received: by 2002:a17:906:5d1:b0:861:7a02:1046 with SMTP id
 t17-20020a17090605d100b008617a021046mr10824609ejt.37.1674136724343; 
 Thu, 19 Jan 2023 05:58:44 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
 by smtp.gmail.com with ESMTPSA id
 rf26-20020a1709076a1a00b00871a4ab4736sm5047319ejc.97.2023.01.19.05.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:58:43 -0800 (PST)
Message-ID: <851c2209-f9ad-3f70-972c-ab5920dcad88@linaro.org>
Date: Thu, 19 Jan 2023 14:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
 <20230119132219.2479775-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119132219.2479775-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/6] drm/msm/hdmi: switch hdmi_pll_8960 to
 use parent_data
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 19.01.2023 14:22, Dmitry Baryshkov wrote:
> Replace parent_names usage with parent_data. Note, that this makes the
> PLL default to board's `pxo_board' clock rather than just `pxo' clock,
> as we are on a way to deprecate the global cxo/pxo clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> index be4b0b67e797..c3e7ff45e52a 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
> @@ -406,14 +406,14 @@ static const struct clk_ops hdmi_pll_ops = {
>  	.set_rate = hdmi_pll_set_rate,
>  };
>  
> -static const char * const hdmi_pll_parents[] = {
> -	"pxo",
> +static const struct clk_parent_data hdmi_pll_parents[] = {
> +	{ .fw_name = "pxo", .name = "pxo_board" },
>  };
>  
>  static struct clk_init_data pll_init = {
>  	.name = "hdmi_pll",
>  	.ops = &hdmi_pll_ops,
> -	.parent_names = hdmi_pll_parents,
> +	.parent_data = hdmi_pll_parents,
>  	.num_parents = ARRAY_SIZE(hdmi_pll_parents),
>  	.flags = CLK_IGNORE_UNUSED,
>  };
