Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67BF65AAB6
	for <lists+freedreno@lfdr.de>; Sun,  1 Jan 2023 17:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4E10E084;
	Sun,  1 Jan 2023 16:42:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8387810E0B4
 for <freedreno@lists.freedesktop.org>; Sun,  1 Jan 2023 16:42:28 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id x11so2710376ljh.12
 for <freedreno@lists.freedesktop.org>; Sun, 01 Jan 2023 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DyHmJqMwBFUTDUCLBa6xYcpZiFOVVP1mRqK8f17ZqlQ=;
 b=nlo6vvboC1gDKb90dwiGsoLvLW04p9t5Iuivx1rAOrJQ6IdEGnrYpwh7jiDBPfE/3D
 /SMwuvv2zdSpkX3dgprB2gdElbPIkRczorWVOEB821htUEsSZdQlXni1KB2PltWAtEiU
 duBP9BJ+ZUkQTfY3MHdF5GDxVfYlrnXii5Fe+uSAh2XXhhXWVppStGOaYMrQ0N3kRayx
 uDlPAxzZyXRVO7PyNKmoKgq2xT3baa+YWX5aLoMUFQ32mQGvmiqRLJqeQMA+YQ/0kBGG
 nG4V/dc/WuOXxNT7AqOKI3SGw0IDcnnOmQUljoQy3JwlvVxahlXdRn5EAaePVMzvq6E9
 Ga5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DyHmJqMwBFUTDUCLBa6xYcpZiFOVVP1mRqK8f17ZqlQ=;
 b=HU1GunFocjoCavpim6v82RUG21xWNPhFSOq0/yzakF/SgxZ9wxVcpZ2u4TlkYS3y+O
 OsiLF58FyP+8LNPspQQOoUorfT5zyux93fxfIw/zP+xUE3c2Aufolfz9YSAe4zaVkMUF
 6qO/Ur07w/XgFU8kqXvkTCQu/EFMHoauPOd6P0CvUg8scqd0yFg8CZ7Y+XKoXSRVokih
 nsTc7CZXIRuwzo1HMhTkVkWkmAOwuYoztParZbWtkQc9EiW3nMiLLmEAtV3PYTq9ZZXp
 ZoH3sqY7a1QWk+owlovm4UkH3AmuzHpfnlfX0OIXtL9ccQFxa+PNDAD3s6uYzllyFJ87
 INFg==
X-Gm-Message-State: AFqh2koXhyWdJAFuuolaQ+UsUJMNKvJISa1c49o/kXoUDlXpDW2XzCaJ
 DX7XofQ+NUw4GPPU0T7pb1qGjQ==
X-Google-Smtp-Source: AMrXdXtaUkfXq3/pXQqKV7l0Qid+mJyMwHrwTgiPlwkTGs86H4Do7vJZvJh904esgyxZHUHgnau53Q==
X-Received: by 2002:a2e:a54d:0:b0:27f:bc58:3926 with SMTP id
 e13-20020a2ea54d000000b0027fbc583926mr8113638ljn.43.1672591346531; 
 Sun, 01 Jan 2023 08:42:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a2eb8c9000000b00267232d0652sm3055761ljp.46.2023.01.01.08.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Jan 2023 08:42:25 -0800 (PST)
Message-ID: <3dceb85f-1c1c-e8c6-1cc7-3c75f3f4c0b7@linaro.org>
Date: Sun, 1 Jan 2023 18:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20221229101846.981223-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221229101846.981223-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: Make adreno quirks not
 overwrite each other
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
Cc: freedreno@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/12/2022 12:18, Konrad Dybcio wrote:
> So far the adreno quirks have all been assigned with an OR operator,
> which is problematic, because they were assigned consecutive integer
> values, which makes checking them with an AND operator kind of no bueno..
> 
> Switch to using BIT(n) so that only the quirks that the programmer chose
> are taken into account when evaluating info->quirks & ADRENO_QUIRK_...
> 
> Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)-- 
With best wishes
Dmitry

