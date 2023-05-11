Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BE6FF1AF
	for <lists+freedreno@lfdr.de>; Thu, 11 May 2023 14:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBCA10E12F;
	Thu, 11 May 2023 12:39:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7ED10E12F
 for <freedreno@lists.freedesktop.org>; Thu, 11 May 2023 12:39:36 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac82b07eb3so86313481fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 May 2023 05:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683808772; x=1686400772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sguCADxh6/8JZhFfgnCw2t9kQNtuJnhKvTXcCcJKeVo=;
 b=N+cChiVGWGTovdxW3imjqG5act1QQ5KtOXb3rtHLD0O5XukjYbg4R8yAFzaKwsj0LV
 sw26mEJ4W2mmwpCqPIz/MEc9EQoRXJRPXV95YPcUdrkNXSLeKcwBT2cm9C1L+p+15dpr
 2I6soBLa49oUYkTYkhbTtNs8tOFwxOiBNiP7z0uAqxtfQjmImVisFnxkF5u0k6k/t6pY
 O0XkPrRpnSIpg9+5p6XpcY5Ax06D8WwHsdxn2h4MDX2SVSW6otTrHULi2pD5B9+N7Syy
 eDWZx0fD9yAF6aAbOvxMrxefdna9pQ7gzLCjaHjYmEXVDiUUqx04bgounx98mhAekQTd
 QfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683808772; x=1686400772;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sguCADxh6/8JZhFfgnCw2t9kQNtuJnhKvTXcCcJKeVo=;
 b=fSH49vhV124GE4c13S9Xk6KvwgGE2owY5NRFB2IUyNNVbBMolsVb5ouOLEddWkgLFW
 cxMSEz4T6qCa0FESFsTCksoRv7dyE+QlAeNuC8N+GJLtbhU7nkP/Xmk+1FsNk1l6wb6j
 9vXK8RXF9K1ngWVvDd6RDHoMU17JO+37sMsJSXGAOjz1U+O/jUBC4H6VF9TmO7Wqe+ri
 FoJ0hTd2cQJ+WU48+NdZ7gS4/eQ9HxNX1B4ZFuWrqPo00+S2evyrCu55eZmjUhlm1deB
 UwiAa9HA64Boa/ipTUsbI7lxeIoKUtmFednss/enjw+LpuJt2aa8VkZtqDd96/PTyqUX
 zBeg==
X-Gm-Message-State: AC+VfDwtsI8PeI2FcMTu5MTs6kssd434U0k87Y1WjQhSYO9iimuysN21
 ru5kMRh/3bNHCI+JV8ub2+vqdQ==
X-Google-Smtp-Source: ACHHUZ6+tTZyN721QPlPxPuC2A0OHeNX3tT1BQq7UBNV3ZI/xQJB2a24CSnNTYmrGnjbCg+GxE97XQ==
X-Received: by 2002:a2e:3211:0:b0:2a8:ba15:eb6f with SMTP id
 y17-20020a2e3211000000b002a8ba15eb6fmr3164629ljy.6.1683808771890; 
 Thu, 11 May 2023 05:39:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a2e9617000000b002a8bc9918d4sm2374591ljh.97.2023.05.11.05.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 05:39:31 -0700 (PDT)
Message-ID: <894ea5be-5126-b72b-ad88-4f06cb5c11ca@linaro.org>
Date: Thu, 11 May 2023 15:39:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230508-6-4-drm-msm-iommu-fixup-v1-1-a7a21ec94f5b@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230508-6-4-drm-msm-iommu-fixup-v1-1-a7a21ec94f5b@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/iommu: Fix null pointer dereference
 in no-IOMMU case
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/05/2023 23:26, Luca Weiss wrote:
> In the case that no IOMMU is available, msm_iommu_new can return NULL
> which should be handled. Without we will get a NULL pointer dereference
> in the next statement when we try to use the mmu variable.
> 
> Fixes: 8cceb773f565 ("drm/msm/adreno: stall translation on fault for all GPU families")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

