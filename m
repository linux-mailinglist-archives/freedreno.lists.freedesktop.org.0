Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9564651F
	for <lists+freedreno@lfdr.de>; Thu,  8 Dec 2022 00:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF1D10E42E;
	Wed,  7 Dec 2022 23:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A76810E42E
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 23:30:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f20so9461996lja.4
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 15:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cCy2Oynps+usLlSqo5MKgBsH0XBjtXporBPmYeMsTLw=;
 b=LnK3kJU0TS633BxPFn1ZNY1SWTM4AuFmGvDxnA8qwVFmdCTj3MEdmPUKHbESast9XQ
 MKIiRy+cthbV8CcyjLhGzbAPiHFvlem7yorV+z+u9ILLkxAWA8Ah4ZcAh9Mv9Mg/sPir
 7WfUOepVnRXp0s0IiRZq4Z/ZucGERD4vRj5yDeY+Bg42Am+ks1I0vrJywvRXgk/WZmXk
 pVN5XmKYoZgwCVn3GCohyxtKqcJz6okakxCmV7cZqcFau+0ertQwejroFEzjmPUMvLW9
 j2A/F7dbkD7MlzcPRsa3yoMlOOpLh+MdrAd+K1RynWGr+9nBbQ3Y1BWss6tUdoplMzSA
 UUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cCy2Oynps+usLlSqo5MKgBsH0XBjtXporBPmYeMsTLw=;
 b=ih3KeyGPiBNmPpaY+qHs01FOXX/yLBXZvBDQFbk4LoyXlwa4saMbOCWTc3aum08B0F
 1tMVGWJUSUcAdmNRxGBNiUCm2qLthKBaVCvZqJ5LBdg07alcXjUj0rKRHS9tVLYoduPH
 O5REGWNzF+bHhPkWtPDOuRyKfWfGS/j36S5Z+2TsTcemTXuO/vq994PPzuSe9fafCaDR
 7XSrB9TexmxiNP9Esj3pe0qPYbpwrj7psuFlyq9aKWAwr32Qs62B3Z4zZCfJ22PEEs2h
 8oZ+r2B8QiRiHer+TqDdIvKggN1b3hJv1g5CQPqRoEOyMHfQ2ck3yKBqhWMdU7zjdoFf
 P2DA==
X-Gm-Message-State: ANoB5pntiIg0oH/MoMxYJHBA/qPIsvSaHOhRhhvKS0lWcoWja9G+V/0E
 B93WrzoKhlSOuePaA3XEBG61GA==
X-Google-Smtp-Source: AA0mqf5Hg/AtPjCgCvfnCKNswL/KM0uv8sg7P5kVGrchRPVVGJIYTgKpXDXs4HQY6rXA/qV+AqZ+Bw==
X-Received: by 2002:a2e:9415:0:b0:279:82f1:f858 with SMTP id
 i21-20020a2e9415000000b0027982f1f858mr18794077ljh.336.1670455849430; 
 Wed, 07 Dec 2022 15:30:49 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 6-20020ac25f06000000b00498fbec3f8asm3074376lfq.129.2022.12.07.15.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 15:30:48 -0800 (PST)
Message-ID: <26d8c71b-d555-be3d-06b6-7bad0f5f6948@linaro.org>
Date: Thu, 8 Dec 2022 01:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
 <20221207220012.16529-3-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221207220012.16529-3-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v5 02/12] drm/msm/dpu: Introduce SC8280XP
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/12/2022 00:00, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> The Qualcomm SC8280XP platform contains DPU version 8.0.0, has 9
> interfaces, 2 DSI controllers and 4 DisplayPort controllers. Extend the
> necessary definitions and describe the DPU in the SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v4:
> - Fix highest_bank_bit, based on downstream
> - Add ubwc_swizzle
> - Use CTL_SC7280_MASK instead of listing the bits directly
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

