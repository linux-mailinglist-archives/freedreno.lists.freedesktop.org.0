Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2326BCCC3
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 11:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613A810EC9A;
	Thu, 16 Mar 2023 10:29:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E3710EC97
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 10:29:26 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b10so468124lfb.9
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678962565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZoXEVHbh4zESyEnp5EA5Zcb4rCYHcLM5oXeCPSUEYhA=;
 b=hPGRGxF+ke8z3JzOJVv+C09Jmuv4N0i5SYgY2ZnNIKaXxFPKIJ7v7rnm2ULALJDkS3
 BN+pVAOZSFrQcXJ72EtdmQLp8W7xIabGTpOC1j1pFwBeGr3S2feU1PHVkEeTqdTutiPw
 aU9vqjmKMMz40gaZ8L2TzgsC/ycD6WoA6uapZvUDjCeahwljPbAPNVSsRefd0Mq9y20n
 fdX4PKenMaxkUbhjaaU7NYQUZYUJL59wmPbtVVOg7gfHNbtejQlMvxNRmrqa60LdbRxE
 2y2ayOBGkrD8bvHM/UhTZZ8TxMdjgvxZpe44qY/YBMkbC6Sfiyj2cTlfsM4hD2W2wrYN
 /TEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678962565;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZoXEVHbh4zESyEnp5EA5Zcb4rCYHcLM5oXeCPSUEYhA=;
 b=Le1dAJYJrX/6dYZ9VrtXy6LipOdV8z1/XNDb5Z1M8KsIv/p0jlUeP/zxl8Ih+y5ySa
 MB9qi3MGJiNhU044VVWVUFRf0tbzRPjqW6Yf2E+/GzWT9rFS2pkUNpJID8SxkgR7kZ7I
 +R7nYcIGrhekxmED75j8MCTxMR+XRqMPHo+vhaW/8yviOP4Me1OdUUR5obPm5f0x3WRv
 EwUFh8zhOQDSzSwwt4c5yfkadrVDBGXcTHWxrePst0ZXG6AoSxZSq+yyeJBoKPTHlIfD
 PzeNwEgFnewtV2DnOAbpRD6enBT4G2JB+sjj2ZFvy9JA7jUKfutEnv6eKMEEj1hCGlUl
 X6BA==
X-Gm-Message-State: AO0yUKXuTMllc59fV90YqOYvlsX7WdFlexmJqdkNuHj78AqNXup0eSYi
 D+yuBPI/fX687Fq1ooDIREZtOg==
X-Google-Smtp-Source: AK7set8RqMAmh9lKg1cILMKHSx8C7wupxbgS49UmQD0f1euyKuqdXR0j+LcLnHCcQgn5HAX+nmRHtQ==
X-Received: by 2002:ac2:5dd1:0:b0:4e8:4699:d01 with SMTP id
 x17-20020ac25dd1000000b004e846990d01mr2775148lfq.27.1678962565001; 
 Thu, 16 Mar 2023 03:29:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a195507000000b004e84896253asm1169523lfe.251.2023.03.16.03.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 03:29:23 -0700 (PDT)
Message-ID: <5cfc6a2b-5b70-c44c-17d4-9c5dfaa33f54@linaro.org>
Date: Thu, 16 Mar 2023 12:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Adam Skladowski <a39.skl@gmail.com>
References: <20230314221757.13096-1-a39.skl@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230314221757.13096-1-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm: msm: adreno: Disable preemption on
 Adreno 510
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
Cc: freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/03/2023 00:17, Adam Skladowski wrote:
> Downstream driver appears to not support preemption on A510 target,
> trying to use one make device slow and fill log with rings related errors.
> Set num_rings to 1 to disable preemption.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

