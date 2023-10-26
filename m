Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD37D8934
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 21:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFE810E887;
	Thu, 26 Oct 2023 19:53:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEFE10E885
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 19:53:03 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50802148be9so1604403e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698349982; x=1698954782; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnrGc+MzCjrgVDL/dcvxuUl3durnLyp4dr8xtm7UBTA=;
 b=lYFTUpQC2pWhhszd+l37lbdq9tjStwt57u01HeKNioVNo/fSK8ykLTM9AKhEuMKpWx
 HnBxGPPhygk1v4jUzhVGrrAtk0vCOeljEoc1zmXBlSQF0NXTbfwaJqNdT+yi0j3ASRfD
 a6wXLGpkYVS4xWTvGgIlngc6TZiTpAtdiMHxZlm6xqt8eRNFTMrgsy3i7Xedi9VUatNX
 kih3/gNZQDMCr0xCO+L9iE1ePZCvMGjaUz0tPNHfwQcCk/MPmDwrJRQr71gmUwun2upR
 Wc19EhRRCeLV3NMxOOc1/H+bwyWU8xhGRNxZQJrvuK2ux+RN5TuixSS+qKym6whnzs07
 CJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698349982; x=1698954782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnrGc+MzCjrgVDL/dcvxuUl3durnLyp4dr8xtm7UBTA=;
 b=NouXzs/yUXqyrCyukGUdHu51gktcJ1+Un+syLutPp9EKafnu7TSR8mBIWLpGAkwD58
 7QIYMg1AqbAziRYtI8Fw3UdTKRMHNNAFDuelT0i19/LH6XsjMCKwCBfgKGG5WKGByIhF
 0XnGAYFbImQ0hY3WcTZHkN+rZbeoRcCXMRY1OGIkOoevFw5lMi4Ecq0f/ZD90mGCOlqi
 eE0GQvSS7m7blM3DEP0WQW2kcBLVYd7P4FwWfsqgNMcCu1CoVT76jubnOuQBE2qRS/Jw
 oftrtOT/in00J+9nwrBLECzsjsm7ZOhKvq2K6woRllP2CR1p0lT1C//2iyOSyq0ekfDI
 PIow==
X-Gm-Message-State: AOJu0YzDWFoGWJ68e3tS5leeFFAPfR07FnDSlSvOiUD3diFoYOzPvjcT
 qLYU/4nBRaiKevyE5xabhkF8vw==
X-Google-Smtp-Source: AGHT+IE2IYNRl5Jz1ahBXmr4SHz+c1HwqT15gHYTCXM43ENMJnQYeuP9qsh+NCTXet9qpBh9BbsraA==
X-Received: by 2002:ac2:522c:0:b0:507:9dfd:f846 with SMTP id
 i12-20020ac2522c000000b005079dfdf846mr221429lfl.69.1698349981732; 
 Thu, 26 Oct 2023 12:53:01 -0700 (PDT)
Received: from [172.30.204.123] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 a24-20020a056512201800b0050096cc3ba1sm3104356lfb.255.2023.10.26.12.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 12:53:01 -0700 (PDT)
Message-ID: <3bb1ed4b-9add-47ec-bf40-a6ac9b63e971@linaro.org>
Date: Thu, 26 Oct 2023 21:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-12-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 11/15] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
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
> In preparation of reworking the HDMI mode setting, switch pre_enable and
> post_disable callbacks to their atomic variants.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
This looks good, but I'm far from knowledgeable in terms of drm, so:

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
