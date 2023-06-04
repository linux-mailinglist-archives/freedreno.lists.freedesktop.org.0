Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1FF721411
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 04:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B412D10E0D2;
	Sun,  4 Jun 2023 02:10:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB32210E0D1
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 02:09:59 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f6255ad8aeso165355e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 19:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685844597; x=1688436597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V9eSsxUopAOhh02C1XZ5Y2iHb3zpn16hh2Ni/D7tYJk=;
 b=ojlqA7jxB8ljYaLIc3w25f2B0Hz3Rbu6nhF4qLAg0A6Iex8uquzsqsUfwIkL+CAuSZ
 sK6q0+ub8EPNp6MMtDhGwQoiIkgV2O256BdHkzGDpYw2gtvumhg1zD2XDs7tDm6qhgYS
 XHwRhieg4zlvhSO+VU8bAG8LfkOwR8sITNRtC9j3kuMjDlDe/iWcVV69OFOoqSJb/YPy
 4EmmPvVRYYYWlTyW/uxvT9zYNe31Jb1oMPwq/HASwSo4oCdfr1fB+6SfDlyPLLvvv0uU
 9pnOvh77elcWHiI3WhRnWx+GwoOsqezkf0oIbwbKwcWhHP5KVC8vOCQeEONcxZ1qOkpk
 ywBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685844597; x=1688436597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V9eSsxUopAOhh02C1XZ5Y2iHb3zpn16hh2Ni/D7tYJk=;
 b=etvb1JzPFevau8nNnAerL0XHHl2teB73W7FRD1KXqfbSPBqWIa1LijLv6h1oQFKvcV
 dtgKqbSFIott4s2mGO0WgNWH3E5vdtre0NPL6lrcgQ9lKExFbq3Wt4XOjMIYc89r7R9z
 m9LMfamDVuqqLggWAmfV27FcrGyHuV+c+u5N5tdtNIgCEzWI318tHHlls2V+rF/+dFMQ
 6TRSws6h0xKnz5jCcOhoXRGdUEIp8KSGNpU5sBkmaSFcOBj+HyIDphd3nVcly2sO9FiD
 psgB9DD2P6ASjDFUCLz4skR30wtPPfdgIVOpF0O7WscRu0Rv6dHbfDbKcjXI7SvEcJGv
 pzVg==
X-Gm-Message-State: AC+VfDwB40zxejSu2ErEKSkMXSbeur+WREZhQ76YuDpBISsxGOgw4ONs
 qBfjMlM5ZNykDdYyoRt2o2iW9A==
X-Google-Smtp-Source: ACHHUZ7VlK4xbclyxPlsscCr4C6Comy8dBU2iSY/G5l/WNa8ffpmH3mxhNOZS+SIEZf7DeEu+xrQtw==
X-Received: by 2002:a2e:3803:0:b0:2b1:c389:c425 with SMTP id
 f3-20020a2e3803000000b002b1c389c425mr405969lja.25.1685844597625; 
 Sat, 03 Jun 2023 19:09:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a2e86c5000000b002ac7a715585sm848818ljj.30.2023.06.03.19.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 19:09:57 -0700 (PDT)
Message-ID: <07d11141-02f8-6920-9c96-70cbefe6c05b@linaro.org>
Date: Sun, 4 Jun 2023 05:09:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685036458-22683-1-git-send-email-quic_khsieh@quicinc.com>
 <1685036458-22683-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685036458-22683-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v14 02/10] drm/msm/dpu: add DSC blocks to
 the catalog of MSM8998 and SC8180X
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25/05/2023 20:40, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998 and SC8180X.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> Changes in v10:
> -- fix grammar at commit text
> 
> Changes in v12:
> -- fix "titil" with "title" at changes in v9
> 
> Changes in v14:
> -- "dsc" tp "DSC" at commit title
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 +++++++++++
>   2 files changed, 18 insertions(+)

The sc8180x changes conflict with the patch at [1], which is already 
applied.

[1] https://patchwork.freedesktop.org/patch/531490/

-- 
With best wishes
Dmitry

