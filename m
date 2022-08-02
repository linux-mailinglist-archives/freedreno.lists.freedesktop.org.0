Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2477587779
	for <lists+freedreno@lfdr.de>; Tue,  2 Aug 2022 09:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C546112AC7D;
	Tue,  2 Aug 2022 07:06:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E102A614
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 07:06:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id r14so14693137ljp.2
 for <freedreno@lists.freedesktop.org>; Tue, 02 Aug 2022 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=YyBYmLXFn5IFerrIXB88rk828Nzxi3yZBlN5vWZi/gM=;
 b=cqShYtc7B4W7+q0vK7VkTMRnsYgBNGzLw6e2P8pZuRkHXrMnlMerLmoE/2weJs4sSA
 ocXKFpxuWtWtb1fhSYbnxLu9yBchBRsggPdcY+GsiMqQxQzl00PcrID3nMwsn5j9ljUn
 Q2q45sZ0s6MZWe2aMQmOCqU3abPyz7zyeyliIBvgJZlj/OJ2VmjEBuPNg2NKYSZqJV2f
 Ba5lIM6m2qZ7Q8GEkOJJ7xmwxGbFeEGtWqzPlCAIjZVbwXph3xyaIznRTbSr/mrwh18N
 idKySTQiWRH+Y6UU3DZwyzzDiy5UABGQzp8uHK8B+9SG0ZaLpx4iZXISVU0aDf2GPW/L
 sVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=YyBYmLXFn5IFerrIXB88rk828Nzxi3yZBlN5vWZi/gM=;
 b=AntxJTzWriXvy27NEkrCdgrrxJAP7xwr/I2gVooMLPueQv/i3YG4e5e/kccES6gt2B
 JU5UNqsrRS3yqGF8utdHXD7VNUtIW/pUhKl/JhB73z9vxupHbnXy2ZixqPiKsY2hkxub
 lcvp2+JWrtJRVuJ5t+mOHYbwnB/5CevR4pqji7y8ec5z/ozr4N6bXk2seTZxl7KPxKGo
 /RnOchuS417+qyfJeOk4qHCfoG2mNJNJ1vFFtLsZc2gL4i8pps8I7Drhh84kJM6y3vsC
 sYjzsBHBRjhLTYfOpYdkkTOi+RlJILgMm/Wj3Swd9xqgop9yg0SBe7jKkCQoxxPC0lyr
 kCSA==
X-Gm-Message-State: AJIora9MW1D7pGqq0u6BbkglSZ3cPZ2HYHEbiOK/CvdOagRaewT6qqLe
 fTeXuh2ouV5v1ptgWwAT13E+yg==
X-Google-Smtp-Source: AGRyM1vyFzsFMTCPRJxtHWx7y5a7FMF92v+tAByHTMxUB/MOjUpdCznNzN7CY7oLLyxTnSAivEK0hg==
X-Received: by 2002:a2e:bd0a:0:b0:25d:d2a3:7366 with SMTP id
 n10-20020a2ebd0a000000b0025dd2a37366mr6103917ljq.35.1659423993628; 
 Tue, 02 Aug 2022 00:06:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05651236c100b0048afa5daaf3sm629717lfs.123.2022.08.02.00.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:06:33 -0700 (PDT)
Message-ID: <43d19449-cf06-2302-b536-4ade5f79c5fd@linaro.org>
Date: Tue, 2 Aug 2022 10:06:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730144713.2.I4b69f984a97535179acd9637426a1331f84f6646@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220730144713.2.I4b69f984a97535179acd9637426a1331f84f6646@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/5] clk: qcom: Allow custom reset ops
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
 Andy Gross <agross@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/07/2022 12:17, Akhil P Oommen wrote:
> Add support to allow soc specific clk drivers to specify a custom reset
> operation. A consumer-driver of the reset framework can call
> "reset_control_reset()" api to trigger this.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>   drivers/clk/qcom/reset.c | 6 ++++++
>   drivers/clk/qcom/reset.h | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
> index 819d194..4782bf1 100644
> --- a/drivers/clk/qcom/reset.c
> +++ b/drivers/clk/qcom/reset.c
> @@ -13,6 +13,12 @@
>   
>   static int qcom_reset(struct reset_controller_dev *rcdev, unsigned long id)
>   {
> +	struct qcom_reset_controller *rst = to_qcom_reset_controller(rcdev);
> +	const struct qcom_reset_map *map = &rst->reset_map[id];
> +
> +	if (map->op)
> +		return map->op(map);

This looks like a hack. For example, assert() and deassert() would still 
follow the usual pattern of updating the bits. Please at least make them 
return -EOPNOTSUP if map->op is defined.

A slightly better solution would be to make qcom_reset implementation 
optional (and depending on desc->num_resets being greater than 0). Then 
you can register your own reset controller implementation from the gpucc 
driver.


> +
>   	rcdev->ops->assert(rcdev, id);
>   	udelay(1);
>   	rcdev->ops->deassert(rcdev, id);
> diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
> index 2a08b5e..295deeb 100644
> --- a/drivers/clk/qcom/reset.h
> +++ b/drivers/clk/qcom/reset.h
> @@ -11,6 +11,8 @@
>   struct qcom_reset_map {
>   	unsigned int reg;
>   	u8 bit;
> +	int (*op)(const struct qcom_reset_map *map);
> +	void *priv;
>   };
>   
>   struct regmap;


-- 
With best wishes
Dmitry
