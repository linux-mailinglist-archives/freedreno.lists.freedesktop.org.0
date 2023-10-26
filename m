Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCE7D893D
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 21:54:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FF710E885;
	Thu, 26 Oct 2023 19:54:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0957D10E88A
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 19:54:34 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-507ad511315so1961756e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698350072; x=1698954872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y+yKfel6jVKQdcczBrQhnxnhE7v6YeHb+nTnhUYvp60=;
 b=sa90ghVU023QmryscWAGSxppe+6gzJUiV2V2amhQ049a/ipWZhbE2krwaKe4iMF5yd
 QT4pYpwQwmP7WjXJsgE4KnvePwuj0D8EZmNhf9AdUJfGalOi4M5WbpzOryulMpZtzyGI
 szYDu57ALVqo6oHXOTRIPgMXG0x3BRkRwgucuVt8Rem/IVW+SrCy5vHnu2PEfo4Zd1V3
 6+EvWwR/stqHh/ViwOWanK7Q63PHx/PhgmGmU+XuvUbl8Mt09MYGbEaUlJJ9cOHgBM9D
 +rDTpZ61y7dg2uqmqRT7ymMwt/EpLvDmssFIBdqcVfDCQhOeSPPsDVpLr6vyWARUC7Y3
 i3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698350072; x=1698954872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y+yKfel6jVKQdcczBrQhnxnhE7v6YeHb+nTnhUYvp60=;
 b=FVYipT2AbvTd9z+qrRUcgqSZdrL5JYmjVVS4MqhYIpcIzZbmrSEJuP6Hb40oS5il/E
 wD8cJZk03fPfmuY3riL+8vH0ayQ1Z29m7XYyTl+lXYF2CblFSLlvcz13/0vXP3ov9gBp
 w8329Ooa96brbLcv57vzY7jCWpcOwO+Z568P86ARsK8ObmKUs5pRah7EAsXTdeCe3o8u
 UhXZRujEMjZlgcN+ud/TVPSTfwUM0GcAPajvOCtgnlEcE+O9IID54VtLq5hcBeY0HQns
 E1CAm05cheGrg+F3T06ASq4VujsxFZntglYxmttnfYCFHl4CO/6GaPP0+I8uhYyY4Y3J
 a+xw==
X-Gm-Message-State: AOJu0YxNrmMZKcczcUzmOZZN6wJUVF0eXsMwCR96pRLKVu9jBrC1AAti
 53GAbbu5ft0hxUgEIh0xGH6B1A==
X-Google-Smtp-Source: AGHT+IFmVIu10aBZHdYkJPouHgCG0LXa+bllX/aAIu/roVR3fko0wfX0k3pHKnLEbA6KJxQWbLFmfA==
X-Received: by 2002:a05:6512:1282:b0:505:6ede:20a9 with SMTP id
 u2-20020a056512128200b005056ede20a9mr331484lfs.65.1698350072248; 
 Thu, 26 Oct 2023 12:54:32 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 a24-20020a056512201800b0050096cc3ba1sm3104356lfb.255.2023.10.26.12.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 12:54:31 -0700 (PDT)
Message-ID: <36d6379b-66e6-4781-b08d-ef90f6e47828@linaro.org>
Date: Thu, 26 Oct 2023 21:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-14-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-14-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 13/15] drm/msm/hdmi: pair
 msm_hdmi_phy_powerup with msm_hdmi_phy_powerdown
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



On 9/28/23 13:16, Dmitry Baryshkov wrote:
> In preparation to converting MSM HDMI driver to use PHY framework, which
> requires phy_power_on() calls to be paired with phy_power_off(), add a
> conditional call to msm_hdmi_phy_powerdown() before the call to
> msm_hdmi_phy_powerup().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Is this a conversion artifact that will be undone, or does the
framework actually expect that refcounting may not be enough and
phy resetting will have to take place?

Konrad
