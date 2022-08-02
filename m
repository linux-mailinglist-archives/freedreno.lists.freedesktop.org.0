Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235B587730
	for <lists+freedreno@lfdr.de>; Tue,  2 Aug 2022 08:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392B510E485;
	Tue,  2 Aug 2022 06:44:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E4D10E485
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 06:44:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t22so20615923lfg.1
 for <freedreno@lists.freedesktop.org>; Mon, 01 Aug 2022 23:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ZOIv/vib2AyO0KkqSUf/4LiDcnhQnMzPWNm6fTpfwe4=;
 b=zRsdTe2s2ok+tSA85hlsvI3Tp6wFqiwLQLGt0x5DWPDzHm3bXY1/ITRMp6N3Jo+x7p
 4pKD7OIvDedM5gi0YEQ4Z4v1ftVyjzsl1wFe4zma6Pv7sNCLToGtd08gqYlI39sN8fRW
 KGTHJ0N71mA6p05A4zRR3+2FK7Kb5EhYSz14PVS0G3m/XUv7I1zeRs2w3kdiZBMNeUPG
 tIuDT4HQ3L5BPCoqRAzEQjHb3xwZhw6DpC3aqUsjyyg864A1PpQQK/Z1VZV9gJ38kDfg
 z2OUYd22s9uATlIViBwdaZvCRIfF/YEcGqUdrh+pv9Pz/BsqaazOGmGEF24DHdlLpt3r
 pPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ZOIv/vib2AyO0KkqSUf/4LiDcnhQnMzPWNm6fTpfwe4=;
 b=Y6sarDV7hNUDa6kD1F3RD/Z7kf7fLTC421MWUfCN3nfEDnwnndnygyBVV5+8YLxcDm
 yogY5X0GZ4Ptowdnkmwvj+84LqpAs/NhTbLaIpo/VYzmdcA90QLa9M+PE0AHHhOX1Y71
 2+sM4yeSEYCmhqqgnjvo9A7y+l0JpGTicgwbgVCjyskoVypUgA9y3+g/uJRTozIjA7Nl
 vjw3xysXM2TxroZ9SHsbQ7cMuDgvjM6rN4oNWKvHjBEjBkKxB3+06zDcWxHUud1cElx9
 dyT2wQNyNJ/riu2oogobJ1x2q5YLYRnTXQ7CbwEf6pPPOOxqyA6bvuPukd9e51B38ful
 l/TQ==
X-Gm-Message-State: AJIora8PVvOPsIQxgVU+leten1qmXZw9nN5VSM+llfYUR2WGBdk5Nxln
 9KVmow0QstXHazFdMFCVgyRvWg==
X-Google-Smtp-Source: AGRyM1tb/aedcmiebbe1NUyI4UkGBdIxQqcLT2KKnD0mSMr6dbKmSZ1Ja9uT9FYb+wh62/LMA5bbWA==
X-Received: by 2002:a05:6512:3f1e:b0:48a:74cb:1409 with SMTP id
 y30-20020a0565123f1e00b0048a74cb1409mr6807833lfa.546.1659422640532; 
 Mon, 01 Aug 2022 23:44:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05651c032e00b0025d5eb5dde7sm704460ljp.104.2022.08.01.23.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 23:44:00 -0700 (PDT)
Message-ID: <1948d519-9ec0-e874-d51a-6d9f2f5ca3f6@linaro.org>
Date: Tue, 2 Aug 2022 09:43:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/gpu: Drop qos request if
 devm_devfreq_add_device() fails
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/07/2022 19:26, Bjorn Andersson wrote:
> In the event that devm_devfreq_add_device() fails the device's qos freq
> list is left referencing df->idle_freq and df->boost_freq. Attempting to
> initialize devfreq again after a probe deferral will then cause invalid
> memory accesses in dev_pm_qos_add_request().
> 
> Fix this by dropping the requests in the error path.
> 
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 ++
>   1 file changed, 2 insertions(+)


-- 
With best wishes
Dmitry
