Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF62623373
	for <lists+freedreno@lfdr.de>; Wed,  9 Nov 2022 20:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C8810E626;
	Wed,  9 Nov 2022 19:27:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E112710E627
 for <freedreno@lists.freedesktop.org>; Wed,  9 Nov 2022 19:27:48 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id a29so8894356lfj.9
 for <freedreno@lists.freedesktop.org>; Wed, 09 Nov 2022 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SXJn3wRJvG74Ahsr/X+Onmc/VKFhlVPUovnUVOo53U4=;
 b=YbYvLSxSpYE+jt7vwxj7OVhLmXgAPOA/TY5Je8XqU9owlGQFKjDO3t/JmRNDnjxxLV
 H5L3GQJwuG/EOjwoT7lkMxIDqwPg3uQfnzHV+XfFQ5QPMbqmRZqO20kMCA+VmSNyCkvn
 BmspsC9tMAaWus3aLITiTU9yP/TCJ/qw7Zc4lAkmC/1cUHPCcaNMzdjtdJruAY10tpRm
 7Mz9g0NSrpqQejpQ0br+TUli0qY9eZ8z5/VwK2eu8HFqEWF9xgBKcvGrQD+yRMCcA4OX
 GhL+biyiE3/t5Y4wxA7OPX8wq/VCIwxtslhHCZgWu5spdi+iAB99DhVIyy57uQt47BR3
 dtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXJn3wRJvG74Ahsr/X+Onmc/VKFhlVPUovnUVOo53U4=;
 b=O5DAi63pMTvbXPua2sHd01f8yiX+J8cNDOluaX41EOE9Kj9JAkdpmz60a2PCQQr58t
 b1S6S5DbSnBt3YO8guKeVWo7UxedDNgl/dsEErdFBI/4BeAh0cRHq7ACpdF9RlPRyNAz
 DGUIbMMO6n/QspMX5ZHo79FpuuToHA8ZeE85EhydA0YsxZ017y94mcXkvLtBFdRxqSMm
 UDkZXHLv28p5iT7sUyXVrzChFhCZzHFI55deld3js1786TAxJ8WssMWybstPfEmCQ1OE
 uucseD3RQ+Gr4Cb7AIL2eTM3ukiC5RIuoIhXcaDXCMadQh+IqIYM317pvMEf4X6lVib5
 hs1w==
X-Gm-Message-State: ACrzQf3Beib4DYnHCVYIVy2jl8Q2qTmpzpA8Kmdwr+ZzfK2xkuxDUjkH
 dbqwY1q/m+pUZ2jTDcuvQazZTg==
X-Google-Smtp-Source: AMsMyM4EbNcHKhibXcvKZHiCPuO2vkJu1vdpocAjRZub4zhkTfio9MoqToCwPRo7wk7zZeYvd0WJJQ==
X-Received: by 2002:a05:6512:12c9:b0:4a2:8760:47f1 with SMTP id
 p9-20020a05651212c900b004a2876047f1mr20715550lfg.24.1668022067060; 
 Wed, 09 Nov 2022 11:27:47 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a196917000000b004979df1c1fasm2378780lfc.61.2022.11.09.11.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 11:27:46 -0800 (PST)
Message-ID: <776f0e3b-932f-d4fe-d949-9001866d0093@linaro.org>
Date: Wed, 9 Nov 2022 22:27:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1668018895-29023-1-git-send-email-quic_khsieh@quicinc.com>
 <1668018895-29023-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668018895-29023-2-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] arm64: dts: qcom: Add
 link-frequencies property to specify the max link rate allowed
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/11/2022 21:34, Kuogee Hsieh wrote:
> This patch add link-frequencies property to allow each platform to specify its
> DP max link rate.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 93e39fc..7e5d755 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -441,6 +441,7 @@ ap_i2c_tpm: &i2c14 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&dp_hot_plug_det>;
>   	data-lanes = <0 1>;
> +        link-frequencies = <810000>;

The link frequency is a property of the link - in other words a graph 
connection. Please don't put random propreties into DT nodes where they 
are not to be used.


>   };
>   
>   &mdss_mdp {

-- 
With best wishes
Dmitry

