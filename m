Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252EE7CC7A3
	for <lists+freedreno@lfdr.de>; Tue, 17 Oct 2023 17:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFF210E20A;
	Tue, 17 Oct 2023 15:41:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2BE10E301
 for <freedreno@lists.freedesktop.org>; Tue, 17 Oct 2023 15:41:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-405361bb9f7so57342905e9.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Oct 2023 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697557315; x=1698162115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fhb/VbAKqWW2bljNb3g4iYW+C+1SCZk6etl2bAcOYLg=;
 b=jHZdal/0j/BZyDVUdNjoWifwcATbnRW2BgYzrE2D8CHzfpQQNTw/9h81A59NRpptp1
 Yr0V4NuJD7FVT5Ihq+eV2id8bpP1MJ4hbFMrznPQESFfmP0SYqgBnk6kHoHLCKv19MTG
 A8FQtE943Hywk5OPabRCX9u/XFXnR6pdFS/qJgKDRzFG37mfxK3cJwh7O4ogwe4PXySE
 9VAZM9/2hBiK43pxsoMnmGtKCM0CToXGIPmquckXoHEC9keBlhrVDIVxKjzCTAh9bI1N
 0yGqy+mPYlysXJ45V/5u5jeSX5iwwvZwCn7dvsyJmOQzCsrtMeiOGvbCN33KrXM5t2ir
 YPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697557315; x=1698162115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fhb/VbAKqWW2bljNb3g4iYW+C+1SCZk6etl2bAcOYLg=;
 b=Ug4Mo/nz+cZC9EyoLS+cH3jbTd2bFtznWUTCwDCen7z6oB646UNcUcLLY+YTKJZSfz
 byR/WibUrddu3KMwETUXc7ck4ZepPoTeVD+cNcIGFQFn6EYP4bRjidu0Xms0C2WpU3V0
 NH1/y5nXJVwoVGNPQvne44SekWORzIt8XsFpCF96pPX7IUDdzWYbu3Ltftf1nH49JhNb
 539oeNBMiZp7zqE+fUkmL8uARmhje41jjhhbAVmWC9nSma2W5Tsn6Bx3ksOHFtpW4EKX
 NhH/9/2Ws73DO+gD+8QFG+FMPxS3FKKSCtg+XJjQnvHeD6ZUpaVJTnEl3rhoaU6NCIMO
 0p2g==
X-Gm-Message-State: AOJu0Ywfb8GmAtBtNE0wrIK818WWgLKVf7R/7cE11IlvjqTlk9VbO06k
 2G8iSH/o/1sZsZSXafxCLsfLdQ==
X-Google-Smtp-Source: AGHT+IEBdPfJkKsMwqOR6v2jaw8Ctfjv771N7HSdvQQL35i0TEr+3Xf1Wr87PCO+t6DIWat/o2wyKA==
X-Received: by 2002:adf:fac9:0:b0:32d:8401:404a with SMTP id
 a9-20020adffac9000000b0032d8401404amr2001007wrs.10.1697557314693; 
 Tue, 17 Oct 2023 08:41:54 -0700 (PDT)
Received: from [172.30.204.57] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 e11-20020adffd0b000000b0032dbf26e7aesm38382wrr.65.2023.10.17.08.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 08:41:54 -0700 (PDT)
Message-ID: <eb05e877-ad8f-4724-bcf9-6054ae14a5e8@linaro.org>
Date: Tue, 17 Oct 2023 17:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
 <20230926-topic-a643-v1-2-7af6937ac0a3@linaro.org>
 <43q6mui3lofa4rqh667o54b2qcbqn5fg34ss5o7y7k7uxbxsro@dxgovofsrvqx>
 <CAJs_Fx7WkdhY31aP_buZP+b7ihOOmE8zBZFOLZ8z9uqcNmEhVw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAJs_Fx7WkdhY31aP_buZP+b7ihOOmE8zBZFOLZ8z9uqcNmEhVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 2/7] drm/msm/adreno: Add ZAP firmware name
 to A635
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 10/17/23 09:33, Rob Clark wrote:
> On Mon, Oct 16, 2023 at 1:12 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On Tue, Sep 26, 2023 at 08:24:37PM +0200, Konrad Dybcio wrote:
>>>
>>> Some (many?) devices with A635 expect a ZAP shader to be loaded.
>>>
>>> Set the file name to allow for that.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> index fa527935ffd4..16527fe8584d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>>> @@ -454,6 +454,7 @@ static const struct adreno_info gpulist[] = {
>>>                .quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
>>>                        ADRENO_QUIRK_HAS_HW_APRIV,
>>>                .init = a6xx_gpu_init,
>>> +             .zapfw = "a660_zap.mbn",
>>
>> sc7280 doesn't have a TZ and so no zap shader support. Can we handle
>> this using "firmware-name" property in your top level platform dt? Zap
>> firmwares are signed with different keys for each OEMs. So there is
>> cross-compatibility anyway.
> 
> I think this ends up working out because the version of sc7280 that
> doesn't have TZ also doesn't have the associated mem-region/etc..
Yes

> but
> maybe we should deprecate the zapfw field as in practice it isn't
> useful (ie. always overriden by firmware-name).
Also yes, we've discussed that on IRC once

> 
> Fwiw there are windows laptops with sc7180/sc7280 which do use zap fw.
Correct, e.g. the SC7180 Acer Aspire 1 that is supported upstream.

Konrad

Konrad
