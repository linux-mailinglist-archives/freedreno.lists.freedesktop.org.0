Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6D7FBB22
	for <lists+freedreno@lfdr.de>; Tue, 28 Nov 2023 14:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFB510E519;
	Tue, 28 Nov 2023 13:16:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAB310E51D
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 13:16:18 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50305c5c4so70946361fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 Nov 2023 05:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701177376; x=1701782176; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmeGSvtEsOAwFPC0jalyYEqEza/s+5wNIdTIQtIdcwI=;
 b=hip7YpO9BHOFUcv2oRCGEH9GBaT7QCcvz7w1afCDbvbGCQkIWxZRm79hi+QTvTDcF7
 Ahmbs6+rkrJbXoPTgSVKGXzi2bQdB03y9ts8lXEjA+D/LKw20kUiKC5p/Fyo8DCvT8FP
 1JS3T93KTXC6Cro1MaBFjWF13+t6lKr20tQKVmBE6zVdfcZwWai5AxCQb4Y288gu0oud
 px5W6ZrCh4QfOhex88h43ABEOFCho+WyFgBAnQ1IY0MRh+nIzqfuUUSo/0WmbvnklMT3
 Igh0xYqC+PW3WOUVaUB5MCrfZhBddSs7DQyNNqCgmdSgwh4m6LI05qpeyY0ibPpbm2J7
 2NKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177376; x=1701782176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmeGSvtEsOAwFPC0jalyYEqEza/s+5wNIdTIQtIdcwI=;
 b=DuSWDAhoQzByK3rEqITIyYz8HNZidgIEGZPJsAVsHxVq6935XgAj8d5xv3pYFC3Xmh
 633s8fE2UzjcwTI+63DIRxiN0dvUamlgkoe3RBnr9QuiojlRsJARm/MO1LMAdNp/dzCA
 /GWO5uQ/JS5zVsAkmqY1uE1pNktg54/1EEKJqzo5yS2+5DPYHA3+kRcuBEFEMUR3ex+w
 nfyH7iobvucLOlszEVVCass6bvjoVjRKaNMwSXZbwEP2LkuA7Ce28wfPmMI7AgR0GCjN
 +CfIzEZrAhNC0yG/qjipXBWoYY1yxIA8AV8ujbjHAMM3iArHtj1JH6zNaw+nDQ7A38ge
 oOmA==
X-Gm-Message-State: AOJu0YzhFmcFRB1SvldRvZzKbP9sQDN77mqz/xB+f2Utn7TVQnS8LAVz
 t+jazlNRI/1HUawoQliFRC0Jlw==
X-Google-Smtp-Source: AGHT+IFskJyn7Zq5NG/6PRdOGtYuywm3exL/CEYWZRl+u7wYVqyx+UY7EtVtNQLM/KOV4FpstpD10A==
X-Received: by 2002:a2e:958e:0:b0:2c9:b9f8:c51e with SMTP id
 w14-20020a2e958e000000b002c9b9f8c51emr194960ljh.22.1701177376551; 
 Tue, 28 Nov 2023 05:16:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a2e9547000000b002b657f10b78sm1707226ljh.58.2023.11.28.05.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:16:16 -0800 (PST)
Message-ID: <0ab17fbe-1247-4f79-9a48-50cb185154ee@linaro.org>
Date: Tue, 28 Nov 2023 15:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org
References: <20231125-topic-rb1_feat-v2-0-979b28f35e4a@linaro.org>
 <20231125-topic-rb1_feat-v2-10-979b28f35e4a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v2-10-979b28f35e4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 10/12] arm64: dts: qcom: qrb2210-rb1: Set
 up HDMI
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/11/2023 17:28, Konrad Dybcio wrote:
> Add the required nodes to support display output via the HDMI port.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 86 ++++++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

