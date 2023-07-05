Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90476748E97
	for <lists+freedreno@lfdr.de>; Wed,  5 Jul 2023 22:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE6910E3B5;
	Wed,  5 Jul 2023 20:11:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2A110E3B5
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jul 2023 20:11:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fba74870abso8543266e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jul 2023 13:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688587868; x=1691179868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZGLJKpWgZBypqeVIuylMzwlHijLnJxgvbBCgFK/ra7c=;
 b=o+gRKWs/8XgZZ0cK4Xocevje4YZufQEk8+P8MF8mttaHZGq3iX8blzoHyvHNYac1Jp
 QWB0/4jS1BDnoK9Gqzzp5AyQT3bx7xBCyqU6oCx0E65ZBinW9FIOAKooYudWApUTGej4
 topIIEqTcPIDSlw+1+ijFOB8nhshkBR9ADwee/7uZ8fOi82na4gkf3FsNvE54lxA15fu
 9EDbjhVz6mOCzGtIN5/LQsf/i18G63Wj1VUcia3z5giJ/XNJqFCjALoAAM4klLqkm291
 CgzbzIw3vv1WHM9QHkWxvroIGZ1zdprtR3AmrKuooJZhCKA01Me7b7WwHIHYx4wNx2qr
 oxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688587868; x=1691179868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGLJKpWgZBypqeVIuylMzwlHijLnJxgvbBCgFK/ra7c=;
 b=OVlpYenjUamNz1AcZC0TfTmVkkSpfe5DFku1qPBJbSTHPraKAsOEwtrtiIIEeSrig/
 3w3BygGURFW25HmDUzB/cLgQPeuZ5kFZTkv7qgXnaBbY4g3GmGOadjt/IIwSpMheic67
 E8c/OgsVaVcztPhqO28xHIiuiQl5JpMZeI/FZTlhKMcyyBvdGIREMJ+tDTNY9UQrj8U+
 BurRKTmmrX7eVHboN65/wqWPtDsrro0XjoMLe7kWxknROIUu2xZCWXhua5Z/cwau0Kq4
 X2PfwiwJhQlogl+nvNtzxCsC5ljfCU/zF49NRK6jWfqPxhgz/w8CcuGWj5Oo55yKlL0Z
 QLLw==
X-Gm-Message-State: ABy/qLa9Ck1gFS6XhjaPSDDe37GjYWvVkhYnyMPoJhBCEtYM5T4FHLTL
 8zQ/wfxj32R23V7YdV1Uka4iTw==
X-Google-Smtp-Source: APBJJlHQ4Ke1hGqOFB8V7SnRmnz79Tc1Kd2Dj2AIoT7Rl4I6R7yNlKDZHH5Ivqw/Uw1R8lIUxcuavQ==
X-Received: by 2002:ac2:5b42:0:b0:4f8:6d54:72fb with SMTP id
 i2-20020ac25b42000000b004f86d5472fbmr18406lfp.62.1688587868189; 
 Wed, 05 Jul 2023 13:11:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r2-20020ac24d02000000b004fb745fd22fsm5086277lfi.32.2023.07.05.13.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 13:11:07 -0700 (PDT)
Message-ID: <d3c23e3f-276e-8148-38a7-7e68b2d99240@linaro.org>
Date: Wed, 5 Jul 2023 23:11:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Ryan McCann <quic_rmccann@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-2-9e90a87d393f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-2-9e90a87d393f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 2/5] drm/msm/dpu: Drop unused num
 argument from relevant macros
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 05/07/2023 22:30, Ryan McCann wrote:
> Drop unused parameter "num" from VIG_SBLK_NOSCALE and DMA sub-block
> macros. Update calls to relevant macros to reflect change.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

