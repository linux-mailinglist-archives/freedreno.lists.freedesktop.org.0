Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA716CC675
	for <lists+freedreno@lfdr.de>; Tue, 28 Mar 2023 17:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D1110E944;
	Tue, 28 Mar 2023 15:35:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAC010E934
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:35:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q16so16337523lfe.10
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3N8h1DChvaLnm2TUkq7RCFOUn72LEkPBuvQVgji2prc=;
 b=MWTvY67pF8MEgiGs0jD2F1Vba+LhJPWz/XGiFuofZNJLlEA3NardYys19LQAJ2Nutk
 m0Fo1FrI6Hi+fJuGrEHQ+pTH1mPbkH11n2Poeu7kSgO6C1LbRjccfRcMXT61KZUorXQe
 AmuQnfQHrzT2QoYg91RCtwoqwkCgFVd3st/0qc28pr8D04tbsuDjbWUFdABzBDZFoJ0p
 k4x21jaRhb7KwdYmVywi5vlO/jlQgqOGHQiJzsSwCkOYO10V3g1/BRKivvz0L52A7gM1
 zJSYmHOo+yIicNDz6RQFY1UmNKvO71ygggA9+Aj8sGVBFeyY6guMH8GWq3Ba3KTpnHi2
 E6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3N8h1DChvaLnm2TUkq7RCFOUn72LEkPBuvQVgji2prc=;
 b=ufaL2/kL//6XbRKeQRlvQLN88o2Qj+LroskavUOxozwJtuP4yOE8WxpMhGtq97OSIz
 LhtMmVx1SsJVI6vJJHKbVCM+Dkg8CsaABAGPOlU8r2smlpOg+Fye2tcM443TqM3NH2e4
 bPVKM+qOn6Zhq52he6n7VmE2RwZab6EAIPAPZg54o2TFv4i5z4E6qptw8M4ByBOemaFm
 mRODmE5lDZc1DpIZbdfTxXN/diSFCNaa7i/eNDlw9+K/QYlqbZGo+9h6TzDhdiJkJPp5
 KZNXVtw+6DzTZKGkvOFe+DxUC6QIPYq2vxxVPfvb4Se9PXz5cshtojTGSznUeBUmg4Fh
 5XJg==
X-Gm-Message-State: AAQBX9dpBV0ttqgHDMIfcI4GJoftUMze0eLKFujiT5tZ0pnA4Bn5sBaM
 hhJZEhbwKlzI0OdNrRcopfhlZA==
X-Google-Smtp-Source: AKy350aVn3vQwYsmxvtq+7/O1t34Z5xIpUuSNYCnORBUR752Ec2avam/4Q48gjVlzD+IBjLDYgwZ7w==
X-Received: by 2002:ac2:51a1:0:b0:4df:830d:4a3a with SMTP id
 f1-20020ac251a1000000b004df830d4a3amr5009867lfk.23.1680017711678; 
 Tue, 28 Mar 2023 08:35:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m10-20020ac2428a000000b004b6f00832cesm5086017lfh.166.2023.03.28.08.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:35:11 -0700 (PDT)
Message-ID: <2b0506b7-1a3a-b45a-8514-42066231d2ea@linaro.org>
Date: Tue, 28 Mar 2023 18:35:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-6-e987eb79d03f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-6-e987eb79d03f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 06/14] drm/msm/a6xx: Remove both GBIF and
 RBBM GBIF halt on hw init
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 14/03/2023 17:28, Konrad Dybcio wrote:
> Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
> need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
> done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
> ones we have to do it *somewhere*. Unhalting both side by side sounds
> like a good plan and it won't cause any issues if it's unnecessary.
> 
> Also, add a memory barrier to ensure it's gone through.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

