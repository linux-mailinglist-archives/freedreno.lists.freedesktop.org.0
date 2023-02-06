Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A0268BAA1
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 11:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8FF10E36A;
	Mon,  6 Feb 2023 10:45:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B53710E36A
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 10:45:00 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l14so1247857eds.4
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m5Y0mNXjAeDacVk2A8snpL6epbayz6NzAhHHcuooMxs=;
 b=TZxxzIdpHF5oOjul60rFqB7O49OucJoTkJZvTtKapn/Mba7W1n5oHdAxKvrFjjltbE
 5Hj8eaT5OjE1e0BYl5/xsuGmA6Pe28TvdGMg3AQt23WGnlipsmZ2Rj26+CX/jnWBGEbQ
 nC7h81O86DYSCCeam32hs9nwH1T8iYixFT9EOhfOThtUydgI0gBDnLfzm1pjgznRooT+
 Ivb0JUYJdoGmmiv4n0aiBsTLaatQ597KvHvBUSF0ppM5jAblMbx3xsYmk/H7td8yR5s3
 13pbomY2LBbwbvitUJDerDFHkuVQOMhlkecqe3fos6XH1DQ6te8MeWp4bopV/3Hv5Qa7
 4Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m5Y0mNXjAeDacVk2A8snpL6epbayz6NzAhHHcuooMxs=;
 b=qwwQ0C6vJvrD3pe/ZJ8BQEwa/ZIiY8QgR0Gjd0seo7SoKfNgt8VM1/HhnwI4kZo9K8
 jECi8kVNFO89ziO3lUNnL936q81YtbHcmNjNqdOvuTSekr61zsL1XOaGIsqpBNo2b1Sm
 yaDSBMsQNzbZQXc6fSH2tTUWtCEMKcVDolTooSBR0HmlxQZYDHnLXlh7LGuaw0MyzNOW
 QpcXwgSARLP/tC4nodgz2yp08OfqoeMWwGv5qUDSn4qJxysqZPWV/m2Zs4ntbFVOi7/O
 Q6GgPUt+gipcMKkM6MGcrrkyfIlYICU1ZIcucjStNA83doYzkp0o3znY/E+8+Q9TE7v3
 JOTQ==
X-Gm-Message-State: AO0yUKXXH+eehe1bLILkj+dcPpZIz8hXixV/sovaUdAsrbgdlCfDYQJb
 SiescJ4TRPKIpOlRE4BqcP2/ZQ==
X-Google-Smtp-Source: AK7set8NRH9yQ/CFflkdpBvM3kM+7gdpF2OPGo09zPNM+wrZ2EyV/GNdylfSysaa0+sQwTY1yeyGwA==
X-Received: by 2002:a05:6402:4508:b0:49f:bf08:b60c with SMTP id
 ez8-20020a056402450800b0049fbf08b60cmr18145115edb.26.1675680298615; 
 Mon, 06 Feb 2023 02:44:58 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
 by smtp.gmail.com with ESMTPSA id
 ew10-20020a056402538a00b0048ecd372fc9sm4907004edb.2.2023.02.06.02.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:44:58 -0800 (PST)
Message-ID: <a38a7ba4-a336-3ad2-7dcd-4eb2195eb0ef@linaro.org>
Date: Mon, 6 Feb 2023 11:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
 <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/8] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 6.02.2023 01:27, Dmitry Baryshkov wrote:
> Add another power saving state used on SM8350.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
Wrong patch once more?

Konrad
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 4a30d10e6b7d..1bf8e87ecd7e 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -211,6 +211,7 @@
>  #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
>  #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
> +#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
>  #define RPMH_REGULATOR_LEVEL_SVS	128
>  #define RPMH_REGULATOR_LEVEL_SVS_L0	144
>  #define RPMH_REGULATOR_LEVEL_SVS_L1	192
