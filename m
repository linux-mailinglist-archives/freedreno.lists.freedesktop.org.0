Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D35C5E8AD4
	for <lists+freedreno@lfdr.de>; Sat, 24 Sep 2022 11:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5375D10E5A0;
	Sat, 24 Sep 2022 09:30:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12EE10E59D
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 09:30:39 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so3690309lfo.7
 for <freedreno@lists.freedesktop.org>; Sat, 24 Sep 2022 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=XZ1V4ejxRvmjCcZUTxWLHU12whSdot5qtCzG6oCYK6lVY1sbvj3TqsS7MmDuj3M/8q
 3mF7YzORN893U9RMGOufMBgrwH3MAF9+ZBAMZaO1moTwyN3ChbdwRDeG66XDJEUjZGto
 0AF7g9mDbsnKceV7OtfpiOQ/aEDh5OuikwbkSi3Z47ga65fmbUnFLwWA0SYYxMkQThBI
 qNH2+Q8cX5psWunN+vWGyocL9pasWSehkiaZygVhfqC1uWvO9Kuap8aqEdhTosJGiuLv
 +zjktXpKqf89QVPX0kuq4GtlvHNuRGcah9Xs+u6kHqeBcz4dvOIn2xkAEO/4OPcBFaKp
 AhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IBvwqmIkee/mEk1eD5GIAynGE3bP9mLepq0/KSN1Z5Y=;
 b=4HHaI9XJtXs8pXFWmqW0jG0d+SzIyCCJ+Rirb1Ldntnk1k28c5SNML2BtJmK/Bne36
 FGo61Z2eZy/sSa/9QdCRySV0DqZOGECpP4iJlljBsOnPrSRvdZNlD9FlAyFymzB/3smw
 gJ2MqZ2qnsLusNUGbX+a8IvFpJfuFsiPlHWOcaIpewdgO3t1xEGXfv4mb9uOkQ6AFzd/
 RScy9zgl+RDuYRjoIvnIvn1UNejw2GvUsl4d1yPctSCySzuC+e+IIjnTTSeNm3VRGVIS
 lEzy/ibM2LsAzHM3bjGvcaypYmUF1VGWcTBeRt4AJXGgjua8X9+iw25JlkQJxvbGk+xV
 gY5Q==
X-Gm-Message-State: ACrzQf0PXHtVzcp4Nt7sD3DJm4+SKDVu7MjlgcJpEMv6mo8wcmUjRcP8
 /Eh4FYllkW0Gg60XhuJeklgo/w==
X-Google-Smtp-Source: AMsMyM4eY6Bb3ZQLBJIB0SXUbmPPatP5oPnH7NvZJ+Ska+7Q2v6jFE1iNDM12lNRUivZONcelFXghg==
X-Received: by 2002:a05:6512:2a8f:b0:49a:db9f:d498 with SMTP id
 dt15-20020a0565122a8f00b0049adb9fd498mr5158098lfb.435.1664011838085; 
 Sat, 24 Sep 2022 02:30:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 t3-20020ac25483000000b0049a5a59aa68sm1840353lfk.10.2022.09.24.02.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:30:37 -0700 (PDT)
Message-ID: <40cd341c-da16-7de1-bcb4-58d1d568ec43@linaro.org>
Date: Sat, 24 Sep 2022 11:30:36 +0200
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
 <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/9] ARM: dts: qcom-msm8974: change DSI PHY
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

