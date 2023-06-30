Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E649574318A
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 02:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C17510E411;
	Fri, 30 Jun 2023 00:20:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFA210E40E
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 00:20:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so2063757e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688084450; x=1690676450;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yx2uReacsSjlB5YUCVOOR3S8enk7DDYDiBnyRDkYlf8=;
 b=EEK6IM0oR1KQiaIUmQRzZYYbmsv33f420dSCtYsBV6ZuFqE2WeNCsHpCN+uDOGT73P
 5B078rFYqp6L8I24vgAINwhEq2O1vhTEkUqf9wwRWpqfJPvjKOe9Fxz1GC/IZpecx3ke
 a5M2ptUfACDXN36SmJiznMyema0SeRiDs3Jak/9AjhkiHsdnT3UiKJh+ipgRS/CExtbK
 F2bJBiDKG0wOwYONYiUYN8Szht9deFiI+oOr8RdSpOwvZ8aAF+2lwA0meIaawZU4cr5v
 /4P/yubPC4bvatCGzbuH9ObBkuyoB9zzTW/O0ASsqXmRW3Y/wWSLytQbYW6Cz6s5gTNg
 NyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688084450; x=1690676450;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yx2uReacsSjlB5YUCVOOR3S8enk7DDYDiBnyRDkYlf8=;
 b=WBE7GQxGy6vV4ak5hfbovqxzFzPyeoU1p+iAl0cQ6SRGHVX5D1QrrHGj44g6tDDEL6
 D6RSVrEyJr9dB/c6ScT5Uqp0KeTLZmG+IP/wKAgBTIrf7ahsm1ELBiM6cf7XuXKKcNID
 0B2/5ZVw/tLI/fCoUkFhrXixiSVQ2wQJw60Had/XYcvEEWuALNPmBFshX5TvrEsnDSWr
 C1NMnXV1SuAKYb/hHcnEM0gQNhBZyPIUqOBN5bSY6mXZnxQ3UWypLCklKfbDPqxMFHDN
 FblEXi/8R6NFlgLCs4yXTITHRie8eoMDl8q3fNNevKgiqhMhuUsN7MjZOviRv/bLpMB2
 rauw==
X-Gm-Message-State: ABy/qLbaVPDdU3xnHy4tEYujzR9VygRbNksk39iq8bZ4V1SisS3SIvC9
 n/ojYw4VQw+h1WjeTcyl0mxTBfsHBRj8MSTHlqQ=
X-Google-Smtp-Source: APBJJlGPbplAHhgvOKZA2syZpVDVCLQJrMf9fUCYsyO4mN8vNXFe03nhEl8FXt+lD7Pd8jeD+j5IEA==
X-Received: by 2002:a05:6512:3b9c:b0:4f8:5960:49a9 with SMTP id
 g28-20020a0565123b9c00b004f8596049a9mr1260706lfv.23.1688084450081; 
 Thu, 29 Jun 2023 17:20:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y9-20020ac255a9000000b004f755b6ffcdsm2536439lfg.23.2023.06.29.17.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:20:49 -0700 (PDT)
Message-ID: <c4a6e82f-ddcc-3adf-4c50-b88c02c09a0f@linaro.org>
Date: Fri, 30 Jun 2023 03:20:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <20230629193001.22618-3-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230629193001.22618-3-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 3/3] drm/msm/dpu: drop
 DPU_INTF_DATA_COMPRESS from dpu catalog
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/06/2023 22:29, Abhinav Kumar wrote:
> Now that all usages of DPU_INTF_DATA_COMPRESS have been replaced
> with the dpu core's major revision lets drop DPU_INTF_DATA_COMPRESS
> from the catalog completely.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

