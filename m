Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584B05BB9A9
	for <lists+freedreno@lfdr.de>; Sat, 17 Sep 2022 19:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFF210E44E;
	Sat, 17 Sep 2022 17:03:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D498210E44E
 for <freedreno@lists.freedesktop.org>; Sat, 17 Sep 2022 17:03:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j16so13312490lfg.1
 for <freedreno@lists.freedesktop.org>; Sat, 17 Sep 2022 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CNlP4WjQ5gD2dVZdm851YFALcjCKHtccpYUpR8J49Z4=;
 b=DfnUDIDLdqg6CeGSnomPiIyWPl9FGL/z455mP7Ly354UMsEwXqUKDKNMZTgG8qHPNL
 iYgOdL6YvessQlDBOFRxqA4bb52EMcOfI7IjvDpiKNGcCgell5vLizFbrqkTxA6LAmpN
 qunDNkWcVGUT239u2rrhYWET0wfCLC6hpQfu40QpY05Jn2N8W5oMsUNDpd172nBVbxQQ
 sSZBNH6QGp/r4D11puhNqSYCnilEK3vW7hgZdg5B8+snXYHDuq86Oa2l4r+0idQ5uRVt
 c0HOzShWNXIGDjGn1duIXbU1UpvEFx1ELV3bpMNem8ZLM0VCr/KoCLahPTxP8BA7nqmX
 mXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CNlP4WjQ5gD2dVZdm851YFALcjCKHtccpYUpR8J49Z4=;
 b=YIlcxvGcmxbFy0PkI0HOQzD8hBLiupcu9Qn4WB5bCJKTFGEqoAyRDNyAo4bq37xorK
 vQublKUCjwwulwma/s0oHqEokuaU0yZ739cMBle1ayqG5Q3m30LPzZN3VHOojrTb0U/E
 dAniR+Tv69ID1jUnASIzgR1yGGR9sO9YHAbg7DkQXOHZgOzZ/PlqsDcbzYWriaoNew8e
 6lxVMwM72KupZrbAKwbfoWuUA2kwlNUgp+Hi0iBCXKj7p7AeZaYBR40uuGgGScglXrEv
 qt1GjNarhjjuychQWG8OP+62iA6NtP2kv5hKxU+r995XH2nEjn3l13ffKfbz88wyi7/A
 LsgQ==
X-Gm-Message-State: ACrzQf3DOITwBFlO2NkdlaH8MR8pI+K1UHPBsCHrdsmFtj4o29z55tCv
 NPut8uvVN3AgCMKzrFG404GjBg==
X-Google-Smtp-Source: AMsMyM6yCCGGK54OXLJ5OP/agtg//cmMTA3Jc3j8bIg9aGqi9wiv0UUto5VjD5mRdOjt7u8CLVTYig==
X-Received: by 2002:a05:6512:230f:b0:499:dcd:2fd2 with SMTP id
 o15-20020a056512230f00b004990dcd2fd2mr3715968lfu.677.1663434209040; 
 Sat, 17 Sep 2022 10:03:29 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 z1-20020a05651c11c100b0026c3975f488sm951701ljo.26.2022.09.17.10.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 10:03:28 -0700 (PDT)
Message-ID: <1641e41c-08c7-859b-644a-28d966fb00f3@linaro.org>
Date: Sat, 17 Sep 2022 18:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
 <20220916200028.25009-2-quic_bjorande@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916200028.25009-2-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/7] dt-bindings: msm/dp: Add SDM845 and
 SC8280XP compatibles
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 16/09/2022 21:00, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

No need for quicinc SoB (unless you also take ownership).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>\


Best regards,
Krzysztof
