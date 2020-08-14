Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D73244D59
	for <lists+freedreno@lfdr.de>; Fri, 14 Aug 2020 19:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8026EA46;
	Fri, 14 Aug 2020 17:12:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746116EA46
 for <freedreno@lists.freedesktop.org>; Fri, 14 Aug 2020 17:12:14 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i19so5181100lfj.8
 for <freedreno@lists.freedesktop.org>; Fri, 14 Aug 2020 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oTnqLQcun1oAd2jUgg7+f/faki/0xT/2c6vC8h9xpbw=;
 b=N3zwz4kQcVvMDiCWrRIXQz2rRp6Dmu6TWX489BnbDLouEXbPNNxetAQAHQn7vcfPdu
 D9dcGIwxDz5vTquvaVCKu8GwUZ6SxBY5udXv80hJnLBc4vR2jd3e4cGFahp67Xp6XZWE
 mxNwn2EuMvR6D0c6CP82qtNyRQrf2d8koRH03SsRhkmFhZqZWBxAlMQtIJMenvRsPp79
 9bea1KRn3PBOL0pvZXzkH2XhjfiP90TOPxtXA0XCDKHhIlzkJ+CPggG27aaCShGiNEC1
 RnhRYAG3Nx4KQ15TPkWH5lpOwxRJoFnFcRUEEF0+RctAWC1tIcMCmdR4DKvdpiyvkLPf
 VQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oTnqLQcun1oAd2jUgg7+f/faki/0xT/2c6vC8h9xpbw=;
 b=COImVr8dPzW5V+FOtkSb8N/JWNX2Vfit+MQe9qPNaAEO7HJuOswsUPM0iEyOfo3ObP
 gaaBN2Zc0Cde04xff13ZmwkWF1jKI/bvMBc849Ccj2cfoRC51MO95sMnatp3H70ZkAi0
 SDlFjCpjX8ArGGrc1v8tXcsoqxvGIqW4IctAsCXFFWvXVoZJo5VMTrmOxnLoodD+9557
 iBUzOodr9OK8j8+QixVFwTW3wZpE/R7k0Co6xWLsMLrnGodS0vpddCnt8WDU4ueP+9jc
 U1A8EihdM6ZkBNQB1Lk4kLCDeN3xtCrbqsxVtdmiddc47trxL3Krf9ANMDvvGEZLLlS5
 OT2A==
X-Gm-Message-State: AOAM531j8vTtDaH2y3Vw3OpAXLAQvCnmmsnddxcKZDmXBLIGySOgRwVi
 c0HEdjiB7zPV6aa4gcgGifcL6w==
X-Google-Smtp-Source: ABdhPJwthnbVLKpJB0/hPo/55RCT2z4Bd1DEwwzsboqMb6G7MLrh7IK+1wUoKkMpH/2PdYyI/Fnvuw==
X-Received: by 2002:ac2:5468:: with SMTP id e8mr1656731lfn.83.1597425132894;
 Fri, 14 Aug 2020 10:12:12 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.200])
 by smtp.gmail.com with ESMTPSA id q10sm1874788ljh.110.2020.08.14.10.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 10:12:12 -0700 (PDT)
To: Tanmay Shah <tanmay@codeaurora.org>, swboyd@chromium.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-3-tanmay@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <324d61b6-fc26-03ea-f8af-ff74a9767da2@linaro.org>
Date: Fri, 14 Aug 2020 20:12:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812044223.19279-3-tanmay@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v10 2/5] drm/msm/dp: add displayPort driver
 support
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, daniel@ffwll.ch,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello,

On 12/08/2020 07:42, Tanmay Shah wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>

[skipped]

> +		} else if ((dp_parser_check_prefix("ctrl", clk_name) ||
> +			   dp_parser_check_prefix("stream", clk_name))  &&
> +			   ctrl_clk_index < ctrl_clk_count) {
> +			struct dss_clk *clk =
> +				&ctrl_power->clk_config[ctrl_clk_index];
> +			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
> +			ctrl_clk_index++;
> +
> +			if (!strncmp(clk_name, "ctrl_link",
> +					strlen("ctrl_link")) ||
> +					!strncmp(clk_name, "stream_pixel",
> +					strlen("ctrl_pixel")))

This should be "stream_pixel", I believe. I don't like macros, but most 
probably it would help here. Also function/brace alignment could be 
better (sorry, it really hides the issue here).


> +				clk->type = DSS_CLK_PCLK;
> +			else
> +				clk->type = DSS_CLK_AHB;
> +		}
> +	}


-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
