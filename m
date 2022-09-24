Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B35E8ADB
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EFE10E5AA;
	Sat, 24 Sep 2022 09:31:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DAE10E5AE
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:31:10 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id p5so2407524ljc.13
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=HRrquF7xs7xgcw/8B/gql2k+TdXBkKOu9Qn7Hq2unV7hHHizaze7vZCxGcehxu/9j9
 LnDyfKy5MzZjkgKA+c6JAqGeVUoNW2yWXIhktKvs28rBTt5AQGSrkgP2ybauDYhjrIXU
 WvCwi9oqcGrynIcTmrMcnr567WLQcBWI2qJ3AllfyFGbFf+zNhBQfX54+Mk3ino0fRne
 dmeBcZB062RT8GiHu8nCgwVtNeYiFsbxnrtCd7EjJAykmK4U1OlbpoOJ7Rte03RtRWTW
 egfmKUh0Va2A9Bs2VdBXwlAH5UVoPUEeuVlR0Pe2Mgt7UTPIm25jsyNiUl5hPobJqMrm
 4Vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=XnqZL5Q4MnMeTeC4KT8t69kQx8LxGiI5GuEx3wT83AZfNcBRC7HCD5h6oMZmsaIzos
 5HO2g+kiEhbmSS3ERdtizdqZhlrhykAmimRvL4/J5txZ0Y51lzXCgqhLcthODf18hXqC
 G5PWQKmK7cWZAkzxsjKSOEhiE2Taw2NqqxW+t1Sfyf5Zf0sKUdl7heb4I8ZFO8jkMwmd
 izJTzep2h6HhXTL2xdzVOFYF5uvAs+GvB6bsxQ4g7dVnAMZO7YHYSOxg15krhcAfKswu
 gEtSGH6rpmHU/fFI5Oh2F5zrbMLHWu2xPKRcWdhLkjBdoGhQtesRZEhkKP1Y2mMWu9VM
 Ngkg==
X-Gm-Message-State: ACrzQf1a3MFX3phbcUp/FxmU3oH7E0WEt/7Tcynf9yFmfCmZw9ClxOBx
 tfQgJIW4G5JeidaoqSYfxhFG0w==
X-Google-Smtp-Source: AMsMyM6B98VKzqVLkza19fLx0QpQ9eR3cZuWrb/sLV56gFw9m3BEMjXoPphPzSZcEsmPcbECFasK8A==
X-Received: by 2002:a2e:9106:0:b0:26b:fd8f:49e3 with SMTP id
 m6-20020a2e9106000000b0026bfd8f49e3mr4487983ljg.531.1664011868948; 
 Sat, 24 Sep 2022 02:31:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h2-20020ac250c2000000b00497aa190523sm1833117lfm.248.2022.09.24.02.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:31:08 -0700 (PDT)
Message-ID: <dc7605f5-17d6-f4d2-68c2-cf109c9dad9b@linaro.org>
Date: Sat, 24 Sep 2022 11:31:07 +0200
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
 <20220924090108.166934-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/9] arm64: dts: qcom: msm8996: change DSI
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

