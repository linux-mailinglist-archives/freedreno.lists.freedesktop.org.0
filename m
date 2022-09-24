Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E185E8AE3
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF62210E5AF;
	Sat, 24 Sep 2022 09:31:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33710E5B0
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:31:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id z25so3733002lfr.2
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5rscM5XvwmdOxNPQZNzAl1dOmorwIbTtRyq4vefSzdw=;
 b=I3AXROfcmn/zW+lyqq6w9e4NE06ugN5ta6kw5Egi/4FmWZhRw2eXUCNhvji1qW9OlM
 4RmWMYhNR1k8xR1lC5LDSpX8ufC/IRbVWjiM1YnuP0tR76YmcspCDvUYxEDXwMOmQ7Tf
 UsyLtgJ6+4BxtqZ3cCHUoc+cNd3jtBwnriOiSSXOsdffHjMSgvIaE92NvIs9UYCo3bkx
 1BQJnMhQpPx/vwKkQ6WJpJS550uhzZd6iSxqpGWG5wIMD8QG01NVNbRSgN9uEuGKJcKu
 OcheYCC/A1mSdiN1AxztvLckKQpEG97jnKtLHzbFgpourCCbt3D5Ue1RJjmlVX/PMxw7
 IjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5rscM5XvwmdOxNPQZNzAl1dOmorwIbTtRyq4vefSzdw=;
 b=Q4HUwr31d5nvNzstqHFT/S7yAimGaWMXg1ytwAJfDPjyGmvvg3DhdlygB36FjT0fyE
 poKfAG7rt1Pn7+Hao4EHEFvJnxYdDPK1d7cSeLcMaCH/uNEEaj9homnPY8Y7qwlSOaPw
 IXWigfsza96h8k5DfiqHwCJQpFwYQqztBDeibEYQRwfd12YuGlZE+hHUB9g9Ps//7BZQ
 c/nztRxOwUpHt90Jfm1oLz+UUTcWIf6sTC0aIdgaOQkVS9U/FhP5oVUmNc5UNSGvb/eM
 04HKzFR+dgb3+F6ViUuAOxqUED68LZ4EQT0tvS5QfboFQIP+RUJUfbvm+ZrJ4zphqVoI
 q8WA==
X-Gm-Message-State: ACrzQf3ixD4ZzKphrTst8VkfupfHkoGZ1ZR1km0I38LadfCKzfS5IAPO
 Mrz2ibnnpAHyOxpc86QB10nbng==
X-Google-Smtp-Source: AMsMyM4EC6wd5/bWnZTp6EeunB8JP70YVzB6TjbOfM1WCR3eV2z1G7Yauc1c1cLEz2Zz6asjx+JFIQ==
X-Received: by 2002:a05:6512:1191:b0:49f:220:b7d with SMTP id
 g17-20020a056512119100b0049f02200b7dmr4397551lfr.244.1664011899570; 
 Sat, 24 Sep 2022 02:31:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a27-20020ac25e7b000000b004a03d5c2140sm948248lfr.136.2022.09.24.02.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:31:39 -0700 (PDT)
Message-ID: <1e7a38e7-0202-7a2a-6a41-4d4312fb76a9@linaro.org>
Date: Sat, 24 Sep 2022 11:31:38 +0200
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
 <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/9] arm64: dts: qcom: sdm630: change DSI
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

On 24/09/2022 11:01, Dmitry Baryshkov wrote:
> Change DSI PHY node names from custom 'dsi-phy' to the generic 'phy'.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

