Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B95E8ACF
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8513310E58C;
	Sat, 24 Sep 2022 09:30:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFD510E58F
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:30:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d42so3788084lfv.0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=JHz8l9cm+bQv28WXN2iLgm2nfh+TgnHT2wrwFZAaLYOH8AMypMTaxRT0USxJTx1qDA
 bJfSDoTaDjOHSTWcn5Y1O8wcW9rQKY/z3rWXoSwu57TC6f1D8VufW1No/pbOi1maYn/x
 OIdgiKcelqSvLWPulhtcoJ918GphiUdq00ZYQI1fTWMUTlZDWkawjgcMBMORLLOhWJIy
 KfwRW45BsTklk7ViAptHFYlYxcONcaLqrB3d7k1sLXl93aezZaKW3DlE+s6RwdurdLKa
 lQMjBM6JWU4UxWcrRiE1d7HPUIPqe8s7vqXqdTzngaDBZ5B8XPOuZnpveKz8lt9DsbwS
 6zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=3hw8a9sB6gQ6JsBfKKShri4KLQKx7Vqu+ZSHDRZLrW68DeeVMpzrmG8n5FMJr+BkjP
 xZiksA88nP+uYOl2yWNrqhycYnVjPPCQsVHgnabGabZZv+YC5n7JCUSH4C7W7Kqsih3G
 CuHrL6bQFkHZHNzeX276gOUMLCsxzv2uuzcG6L1rasJF3AjJy3ZbSUUm7Gf1/L+n6va4
 vBnFTGfOIeixVgjiV3KLpXfNbDeXYlMvQ90W8GgzN5Ig58JlYpnWssytSk1dugvZhWMz
 S0/7fnIdP4jd+H1QWCWAE1LpUJ/hd45YeJVdYXH+7Zku8vzkJUQK7RokaYiL0fN5AY13
 9CPw==
X-Gm-Message-State: ACrzQf2EqFR0OmSEPIyvw/4rEpOSHFeD/WTeCQcmYW24uHaskzI4c12J
 Ml4KLCc/KRmnvgDFYPBjEhHvog==
X-Google-Smtp-Source: AMsMyM7tno1mmU/0I88pwXzxJ33cLgdA28PKnkVMEER96O0p5HvrATY6IyuhN0owxHY5wG0k0wZDsg==
X-Received: by 2002:a05:6512:a85:b0:49a:c6f2:7aa4 with SMTP id
 m5-20020a0565120a8500b0049ac6f27aa4mr4924787lfu.59.1664011817676; 
 Sat, 24 Sep 2022 02:30:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056512370c00b0048a8c907fe9sm1837767lfr.167.2022.09.24.02.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:30:17 -0700 (PDT)
Message-ID: <416f5408-b9cd-f7c8-67d4-7b835ea48976@linaro.org>
Date: Sat, 24 Sep 2022 11:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/9] ARM: dts: qcom-apq8064: change DSI PHY
 node name to generic one
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

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

