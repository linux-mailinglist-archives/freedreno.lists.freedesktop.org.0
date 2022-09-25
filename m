Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8A5E9597
	for <lists+freedreno@lfdr.de>; Sun, 25 Sep 2022 21:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D537B10E391;
	Sun, 25 Sep 2022 19:00:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ECC10E391
 for <freedreno@lists.freedesktop.org>; Sun, 25 Sep 2022 19:00:02 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 x23-20020a056830409700b00655c6dace73so3220519ott.11
 for <freedreno@lists.freedesktop.org>; Sun, 25 Sep 2022 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mzMhROLxf+WaccHSzDfGVv0qOJyuzTRDH4FxujffiSw=;
 b=buBXjaypg8d2m5kTlrDDnoXKhyG9WYxeRHGgN3/uAzcTwY01kYhPyRCy8a/K0HY+Pi
 3PG5jH8dDHv36BV+kVAofFBb7RzmvkmG9Kz9E8Z7B5df7tkE9VoLpONa6V8lg15oepNc
 aeusETyYgf0p06VAFC2c7QfxySLw0nt8LLT08+rKyPm2gA2z7EHveeRrnQWeNIdnPPjs
 PirIUgHaHTXUFVPEdaYPr0kEOLfv2kPwFOjD+9ujt6Ea34KyFRiQB6NiKvbehEsehCDs
 Fte53eMRT9r8Gaf4RiQU7neSJ+V2w8QuP7Nj+nvrA5iKEqr0qAXJ9JkTYkS2EGonUbKp
 mwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mzMhROLxf+WaccHSzDfGVv0qOJyuzTRDH4FxujffiSw=;
 b=ABD1O/nCzVpE9rgan/TS/NcIWknkcr6U8TdgWCG4rDyDf4QXOBMy0FJnYBfMg86bGC
 9NkQqct5RzIMRIKPXEUFHvQCKtnfn4HZ6G0Wp0ODAAlHER0ZVJBfGAaz31TBRHfrbvOn
 5+itrDNB7MMsDEskQTQ4A537DITBk0+7sqc893Iu85S5bYBUWFScHp7pXW9UOHJWs6EK
 60f+lc2IuoDwma5qb3p0U2iwGTpoKLa2iT5i0arBOqUlKgWIIpIBtnVvvFUyMi588cKM
 LNVTv2O/B57Q5umbe+qsyNiolQAV455DnOji0QkyVzh4rjAEhVpTJqJ1fPy/lU8bNrS/
 I1XA==
X-Gm-Message-State: ACrzQf2qRmWKc0iym3G844jXeGRNMAG+QUHYU4C/8vwc/oJzHHlVEKV1
 wnMHCwFqw/Oi+2GsyTigoJoMSA==
X-Google-Smtp-Source: AMsMyM7uavezll4kcgYxy0EtKqXPcx09063LOwTeKRkyZkDHv9oU5Y63E+3CJuQyu08noJJXhPPk4w==
X-Received: by 2002:a9d:30d1:0:b0:654:1288:7cb2 with SMTP id
 r17-20020a9d30d1000000b0065412887cb2mr8515467otg.43.1664132401718; 
 Sun, 25 Sep 2022 12:00:01 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com.
 [173.173.107.246]) by smtp.gmail.com with ESMTPSA id
 e5-20020a056870c0c500b001275f056133sm7843619oad.51.2022.09.25.12.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 12:00:01 -0700 (PDT)
Message-ID: <82da45fc-f673-a7a0-5c55-fe8a0a1a6142@kali.org>
Date: Sun, 25 Sep 2022 13:59:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-9-dmitry.baryshkov@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220924090108.166934-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 8/9] arm64: dts: qcom: sdm845: change DSI
 PHY node name to generic one
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 9/24/22 4:01 AM, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index f0e286715d1b..df6427ba2284 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4537,7 +4537,7 @@ dsi0_out: endpoint {
>   				};
>   			};
>   
> -			dsi0_phy: dsi-phy@ae94400 {
> +			dsi0_phy: phy@ae94400 {
>   				compatible = "qcom,dsi-phy-10nm";
>   				reg = <0 0x0ae94400 0 0x200>,
>   				      <0 0x0ae94600 0 0x280>,
> @@ -4609,7 +4609,7 @@ dsi1_out: endpoint {
>   				};
>   			};
>   
> -			dsi1_phy: dsi-phy@ae96400 {
> +			dsi1_phy: phy@ae96400 {
>   				compatible = "qcom,dsi-phy-10nm";
>   				reg = <0 0x0ae96400 0 0x200>,
>   				      <0 0x0ae96600 0 0x280>,

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

