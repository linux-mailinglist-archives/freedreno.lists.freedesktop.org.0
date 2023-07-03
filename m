Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0655A745B36
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 13:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4E510E060;
	Mon,  3 Jul 2023 11:35:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CACA10E0E0
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 11:35:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so6929887e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 04:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688384149; x=1690976149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fR6gW6QqPVhQF4uZh4Ai5jdCPhHvwhrUtKxoyIWDUPQ=;
 b=rHY1DLerRbOhYNNVRe96k8xQpd4pnTJaDLPbKTZXdOKpBuUPCnHMaTGSNfp2vFtENE
 H5Lb2yeylWzK0tBrDgScWRb4bfh2lrfSYdatkGYmNxYtSsnF6rXebe7ABGUwJosyx964
 lMS7tRPEH7717OamE00LZeeg8xWiSRKjbV4+VzAuAB+5DR+muIWcWAiGuMbO5z/DTrPk
 Ptems8E/nkk7JuCSlvfKZoNrqWg5+5Xvq9+79/gLlP+yqFbti5P5G6A0u9UYt0ts2zs/
 dFh/XafzcXrtXkDSKDBR3XZ/sgpHcnP1sAGpkOUifYfvR/qm48wgZFV4ez05mZxTG4Rh
 x9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688384149; x=1690976149;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fR6gW6QqPVhQF4uZh4Ai5jdCPhHvwhrUtKxoyIWDUPQ=;
 b=GJif2UM/yw9Ap+bcNLadUCfHuBY7OypuP/lWj8mnfdMd7K63ZkHPC59Kw9duBt9/Vk
 LUxR3z1z6E9n6lAgoQ+kDJbkrnhQHRhnepvZgp8LC79Z/OGZb/CzjbyoH5SFDBpuWCmL
 N9g4JMyPGfvQnM2poOsle1EmTW5FIO9yTyRBZRso3zSedywugpaxGT3CNuceYEtNF5Ki
 BZ/NiaeD2MgcxV5FxII8gFUPzVW0Zk5oLzklJCf8vFZjSjnaVbT+/UCUnmJnD1oOamWJ
 Es0RLSxt7LVugkU0QqpNAMR97bKyxzDcaEO8LwQQrfor5MheE7d7hhwTksnQWKkhVMuq
 6Y3w==
X-Gm-Message-State: ABy/qLYSDoksGDaMYsGn60wQBhPmhe5nQPAO7aeoMfHlP7F3jLcgE4FK
 mtDVAhEHrvDLIb/fqWpuRY98ag==
X-Google-Smtp-Source: APBJJlFYyFRmaxnd3ulQxmEgzLYB26UKCRVr7Zjj1tFIlXUhU4KJAPhpjOqh5tgH/FdV8SX0qj+xSQ==
X-Received: by 2002:a05:6512:308a:b0:4fb:89bb:bcc4 with SMTP id
 z10-20020a056512308a00b004fb89bbbcc4mr7744687lfd.51.1688384149094; 
 Mon, 03 Jul 2023 04:35:49 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 q28-20020ac246fc000000b004fb96436ac7sm2623973lfo.250.2023.07.03.04.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 04:35:48 -0700 (PDT)
Message-ID: <43f16d47-3318-7a9f-ac87-8e595435b6c3@linaro.org>
Date: Mon, 3 Jul 2023 13:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
 <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 08/15] drm/msm/hdmi: move the alt_iface
 clock to the hpd list
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25.06.2023 13:42, Dmitry Baryshkov wrote:
> According to the vendor kernel [1] , the alt_iface clock should be
> enabled together with the rest of HPD clocks, to make HPD to work
> properly.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 3132105a2a43..0fc3df43aa70 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
>  };
>  
>  static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
> -static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
> -static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
> -static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
> +static const char *pwr_clk_names_8x74[] = {"extp"};
> +static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
> +static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
>  
>  static const struct hdmi_platform_config hdmi_tx_8974_config = {
>  		HDMI_CFG(pwr_reg, 8x74),
