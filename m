Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3F8597F0A
	for <lists+freedreno@lfdr.de>; Thu, 18 Aug 2022 09:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D789B9056;
	Thu, 18 Aug 2022 07:11:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35553BE438
 for <freedreno@lists.freedesktop.org>; Thu, 18 Aug 2022 07:11:02 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x25so868228ljm.5
 for <freedreno@lists.freedesktop.org>; Thu, 18 Aug 2022 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+rnA565YBjndtqaMdwo66Drww20U6UhPrTonHQT5gKQ=;
 b=k7IXjunIwYEqdOAr12PHz8M3c70nfnrK4zYNyRbDjrl4cjPdJwC/1+zd+C/71kN91U
 P4107Thv7DbJeCMl6MCDRLubbTrDSCxdCGrwK/HTf3X21UMogZKHzHkxckmOBfnuvg7p
 /DZHD8gTTDiq1cE3t03skfD0IoC2A9Qr4jxQfBaoJ80nXtgcHIuD5i7F3+cibP7Qpsly
 gZvWE88j4LYy6XbnA2y2r6o/2+OBM591cVUMJ9DFejQJGFvvsym4qwpsm1T0cKFJ9pXX
 gr7kZS2qgr0bPGgT98bRh0nUNIO4lpGp5Lkf740fAK4530zHzb1udBJBcKTFeURBAgbD
 dJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+rnA565YBjndtqaMdwo66Drww20U6UhPrTonHQT5gKQ=;
 b=AakJQarbAhwXp3KPqyNIsRgEvxYxskHgpD+n7uKY19jV0XwAhlZ0xreYrPIEOWdPMB
 3cnkLt7+n0/8O/dUpV8q/g0hq7xAeJDpV9oJqmgcXUFLv//uplVeHxE5uMnJTMC3KcYk
 mgsA2lWjC+RK4LN73GM8UXg++pHTNRkBcYRp4+VczRr5TdsFQbo5lWenaBqcca/K+ym0
 eTMHvaK+gPz5U6CpsJ6Rv8YZHdxhjRyazMvZt3vpyFK6bM49/HTKnMqxhEpdOonvjIIa
 F0z5ji5maX9r3BRpc4IueX0MD1BgKaqLvFlwk9rAgBnMff+4GPhUknQXoPxFoAJS/eql
 ATZw==
X-Gm-Message-State: ACgBeo2+xgE6V50GYxSH959m4eqFluz0KITmmkvOhsxOnaQPSQ5H1T+0
 /RCtp9vqfK4DA6q6X4Q3VuVNKA==
X-Google-Smtp-Source: AA6agR6HbPKco3uxBpRnoMRc6bHUrXBG7FyHXnKraydyohUNOberY+aa72vSYtFtTnHqXJoCZh5BmQ==
X-Received: by 2002:a2e:9e43:0:b0:25d:d8e9:7b15 with SMTP id
 g3-20020a2e9e43000000b0025dd8e97b15mr492873ljk.234.1660806660498; 
 Thu, 18 Aug 2022 00:11:00 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5?
 (d15l54z9nf469l8226z-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a2e8701000000b0025e2c6b15e6sm105103lji.72.2022.08.18.00.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 00:11:00 -0700 (PDT)
Message-ID: <20e5bf2c-9ac0-1c99-b0c8-f2aa50d8a739@linaro.org>
Date: Thu, 18 Aug 2022 10:10:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220817202609.v2.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817202609.v2.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 4/5] clk: qcom: gpucc-sc7280: Add cx
 collapse reset support
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 17/08/2022 17:57, Akhil P Oommen wrote:
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
> 
>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..d4bc791 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>  	.fast_io = true,
>  };
>  
> +struct qcom_reset_ops cx_gdsc_reset = {

static const

Best regards,
Krzysztof
