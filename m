Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF47D89EB
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 22:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739D910E8AF;
	Thu, 26 Oct 2023 20:59:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47E610E8AE
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 20:59:17 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so935789f8f.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698353956; x=1698958756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eJ45MedtW52f9J0KjPN0wsG1dfwZ1/8Loy/GooxEfbE=;
 b=FzMF9LRGTw6NYUF/CKX4/baMfzJ5sNitzTwcULLzEyDfhbfYA4qrZonx9HAV67iyJe
 fqW/l1EHV/hQC9dXHe50gJ8Ydif4A062q+IuvxgHMMjga8eczwPYKCtp/w5ZQ+Bk5ZjE
 uvU0OSenwIEY4wKC1jYenuWnXqlPdpZ6+g67r4oh1FaYgNE6/VQcoeB0GPjCzLR+SgUP
 9Z2T4nYBXlZ97yDFf/eKSDXrcWAV8+AfRdX0QQgzJWyAtxiReY7xrPf3V4aBhAAPA41M
 L9Ty1ZXovne5Hb+E1yAYLSrJewOFEmGq/R7oZHcLLyXm3ASyA+/mxUsmBzTuLw7vgw4R
 CHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698353956; x=1698958756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJ45MedtW52f9J0KjPN0wsG1dfwZ1/8Loy/GooxEfbE=;
 b=KVSlVL6gbxFi+f4ryyfnxaLM0q5So9ChYGckpgKjHVPaF3UvdKZmqi7R/q2I+oQHox
 WhcOAGoxZFnIR1Ij+lEoGLE70NyaublXZfGqG2lPzD31nnZ5KofMLHnICvHg+B1Ce4ht
 CajpF2KSsqLo8fHUM6LSmRgMl0xB/Ub7xqYHnedvT0zST8W2OmbL7ZOQStAElepIBqsk
 bBm3IQjQEFpHE3FmueBO/ebKU7znUs4KT7aClN/1J1PxRuIq/KXhbM8iurQTfi5+9fIJ
 NoQKyd1K1CnogIifY8P7kGeI031392dIuQq39Hsrd49umxAWUkw6GMV/KtmdUuG0hoLT
 LPnQ==
X-Gm-Message-State: AOJu0Yy2uSpkGoQCzwCdBMgFJh5S6ceVvpgwjK1JZ9HjXrlbobq/gTky
 akrsNIRG2JMK20DZcrpzOgepAg==
X-Google-Smtp-Source: AGHT+IG1m2LzUjFEXtZczRmxlxINkHg+Jq1D1mGg5ZDH5g7+z7SoUtG5Oaey8r/7wyn/lWQrriixAQ==
X-Received: by 2002:a5d:62cd:0:b0:32c:c35c:2eea with SMTP id
 o13-20020a5d62cd000000b0032cc35c2eeamr519578wrv.6.1698353956213; 
 Thu, 26 Oct 2023 13:59:16 -0700 (PDT)
Received: from [172.30.205.55] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfe9cc000000b0032dba85ea1bsm235247wrn.75.2023.10.26.13.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 13:59:15 -0700 (PDT)
Message-ID: <753148f5-d68c-49fc-b1ef-0f65eefe6e4c@linaro.org>
Date: Thu, 26 Oct 2023 22:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-15-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230928111630.1217419-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 14/15] drm/msm/hdmi: switch to generic
 PHY subsystem
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
> Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> drivers allows better code sharing with the rest of the PHY system.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Looks like this will require some atomicity with the phy changes

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
