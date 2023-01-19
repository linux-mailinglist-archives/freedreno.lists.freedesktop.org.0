Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316876735A2
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 11:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BF310E903;
	Thu, 19 Jan 2023 10:35:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A310310E903
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 10:35:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z5so1395391wrt.6
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 02:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VtMyXO+XFAd7bhjLH/6eN7IyGN6nezPLZZSqRmEiMMs=;
 b=Zq5fEPrYoJ5p66SaptrWOmIBuVV3Ru3K6GuVs5q+LWxwE4Odxsdf+D0Olxhm9ERWlU
 rE+ArNSWDYZkQT0zjlN+gS0exZ5D4BAj7rJgAJ1jcIv5FMMea2jp070lyySIE8ZniMwp
 8fryby50Vd5FIzLrYDQhJygsbYXNs4E22MQWOV8/a0g1vcpVlfJ7zSBNq1QJHb1i5gG8
 oTbr9WNcxQpeTNpw7MfJma5R3QXMguN1ArLvuLY3NIn4jd7v92J3AA3BQljhVhYHqabF
 1QjIzRyAjoZogl/RuCvc2iyWofZIb/VjsViHg71g5MpXAKulKsbFEDPp9am8+c3CJR4v
 tdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VtMyXO+XFAd7bhjLH/6eN7IyGN6nezPLZZSqRmEiMMs=;
 b=rLYIivChrGJh19zpLt201vuNArBAunI8NXf2hgi3lORhT37xMtg0vdtGDRHgfO9TWP
 x9jA3tVkvnIwPciiEF8jv16obyDcoIisPlUgNRwmHTGji8am0GbbVj5ldzV2cH2Q7dX4
 tWsruW3g0Jyo3UUOwp9jcGqqC1iuNzpj10rsG8T0P3z81mR9pgDwhrD+j+KfLt+FtVZB
 hHwnTYqPWw3EZnwBY3ORe/M/wGgBjLLLVPmgiB91W6OhgTAB9zWTW7mc3/dxPgIUcPqG
 B0YL9jMrqc36Gd+mC6aieX72fwUkExO/z6VfXq3WNIOiSrjxF+lo9FZH0No7846PNYtC
 wYUw==
X-Gm-Message-State: AFqh2kqHXEj93SBs6s3MUOnfRGGKDAMKl8g2NGV6frCbR1Ew9wCe6pu+
 NMkrpxpR/M/JyEtfEMFQnxBggQ==
X-Google-Smtp-Source: AMrXdXvx+FBmmoMdPtes6WLfL4U/PKZM2tRc6m6sgE2QM3WyiD511MetmxVKIvnYStyWu5TeGl5PJQ==
X-Received: by 2002:a5d:5224:0:b0:2ba:a771:5812 with SMTP id
 i4-20020a5d5224000000b002baa7715812mr8496539wra.24.1674124537156; 
 Thu, 19 Jan 2023 02:35:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002be099f78c0sm9198986wri.69.2023.01.19.02.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:35:36 -0800 (PST)
Message-ID: <aee03688-54b6-ed9f-e32c-b46e31d72198@linaro.org>
Date: Thu, 19 Jan 2023 11:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Mark Yacoub <markyacoub@chromium.org>, quic_khsieh@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-10-markyacoub@google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118193015.911074-10-markyacoub@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 09/10] arm64: dts: qcom: sc7180: Add
 support for HDCP in dp-controller
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
Cc: quic_sbillaka@quicinc.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com, hbh25y@gmail.com,
 ville.syrjala@linux.intel.com, marex@denx.de, ashutosh.dixit@intel.com,
 sean@poorly.run, abhinavk@codeaurora.org, javierm@redhat.com,
 arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com, agross@kernel.org,
 quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com, lyude@redhat.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, quic_abhinavk@quicinc.com,
 jani.nikula@linux.intel.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, maxime@cerno.tech, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, andersson@kernel.org, dianders@chromium.org,
 swati2.sharma@intel.com, manasi.d.navare@intel.com, robdclark@gmail.com,
 tzimmermann@suse.de, bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/01/2023 20:30, Mark Yacoub wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This patch adds the register ranges required for HDCP key injection and

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

This applies to all your patches. Fix it everywhere.

> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller. Now that these are supported, change the
> compatible string to "dp-hdcp".

What does it mean? Where do you do it?

> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-10-sean@poorly.run #v5

Drop the links.

> 
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
> 
> ---

Changelog after --- .

>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Best regards,
Krzysztof

