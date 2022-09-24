Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6535E8AE7
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD2710E5A0;
	Sat, 24 Sep 2022 09:32:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3276110E5AA
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:31:57 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bu25so1805332lfb.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=StTGIEPHvyWjTm61ptad+5eZwzfDx31aYpdqLou0RSI=;
 b=OpmrwFMtPqHOExAFK26eiVFA9C52DBx68ieceF1eEK1xjFpg5wcsP+7+C7oCol/q2y
 NNSK084FuIGvhqKmMJf4/82dU1Tv2Ya4HLspjf559rJFPs/vLyBUMC1UiZ0cGgFyZRPk
 K5cZePwFEyM7ZqVnnXnNMh8duYAyeOJT95jnkNzozM9s5x7R9iV+HhiKm2QwWjEnCwCa
 oOimtcioOA4rLK2XEC8gUUMbosKKKvSr6TQL0RJEii8xoDIVsJABrC/xi2hc7X4HUj9g
 p8x9oKXmfF/oQEeyyvmfxQRvChaMXQG8a/J0KQut7wQQxL5YFlz2IqjADfug4m5+Rm/C
 xqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=StTGIEPHvyWjTm61ptad+5eZwzfDx31aYpdqLou0RSI=;
 b=P/dpnJx6MGDReW+zZn9xglRJizXcWxDIZC9CTreo5sH2fqaxX/uS2VJEWqqITuNPTA
 MGNykv+Q+lcRZYSrqYXOAX4TPQdfD6/JKZau4L1FBAr7vDaPjttXstXzG4qSlNcI03DI
 854EK/6jcTwvT2E584z8StLKX10D9ybAQZNTij+idEg0YCOoOf5w91VuU234v3zkQfa/
 ZmFGGcVe5M05ew1QyFtLO+0GsYoqkeoAfug6XtVL/zcqbTjUkuaxqkhO525Ldrix09D+
 DgHLuKYRVB254fZrj4gON2xf559KnXCEIVxPEnOCvpr1YICVaEzH94CCkmODVMqkAbJK
 UQqQ==
X-Gm-Message-State: ACrzQf3UFOjVwySjN88/ts3/4AhGwafQVDk63ya+J7NWjFi8vwxIW8YD
 u2OTOrg0cY5wp1nsyCIDEU9zzw==
X-Google-Smtp-Source: AMsMyM4H1hokrlUrFp2OPCor5AjrlT/e+7tCFw6G2FgZ5G2iEb7wmyfhyHcTyBNOH2OoJEKtVk5c1w==
X-Received: by 2002:a19:dc4c:0:b0:49b:ec86:fb96 with SMTP id
 f12-20020a19dc4c000000b0049bec86fb96mr4763785lfj.440.1664011915573; 
 Sat, 24 Sep 2022 02:31:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s12-20020a056512214c00b004974def0b75sm1835092lfr.173.2022.09.24.02.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:31:55 -0700 (PDT)
Message-ID: <7450f6ea-c940-4f6c-762e-3738b8a9d771@linaro.org>
Date: Sat, 24 Sep 2022 11:31:54 +0200
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
 <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 7/9] arm64: dts: qcom: sdm660: change DSI
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

