Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0878A22C7
	for <lists+freedreno@lfdr.de>; Fri, 12 Apr 2024 02:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800FD10F43A;
	Fri, 12 Apr 2024 00:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V8E89YJV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8644810F442
 for <freedreno@lists.freedesktop.org>; Fri, 12 Apr 2024 00:10:36 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso3809081fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Apr 2024 17:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712880634; x=1713485434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uWeAeryC+HSBQqc05Jp0Ysdkpvfyotn0oaGu/IDriio=;
 b=V8E89YJVJ8gd8a27EtX3a0kXxy8MbDAcmsq5f7DU2lT80zt6kZkm9y5dgZEgWwhdEy
 i1C9J1dE3yVs41HCa99aP13JY9gKJQyOfxbVt7WMFhazK6hAkxAIERLSGOZHajvSDU9X
 HX14aefBcvJlLE2sULmCqc885G1K4fbdafVTgiGWGTlRW5qnyFPC0Rew4HV5mi6kfWtn
 omocXygrQCUhQiIL9wydTWDS4lBv0gwmadjE45sJ0cE4e+yOS6vBSELwYVGyAjkpGlQo
 p0xz1YI2SV2I4bKySZjBf93otTGhn7Wh0SNZB/VLe/zW4vWsB2dt8pvKgpIycIZD3F4r
 EyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712880634; x=1713485434;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uWeAeryC+HSBQqc05Jp0Ysdkpvfyotn0oaGu/IDriio=;
 b=Q0cLwZuoGjatzoDma+ng1I728TVVgHwHBg+TTTMGXCrmwZuxdw2FiA2x6fXYktOl5x
 ynF4gSG4WJkHWWOjPEWdj2W7goQ5pJA28VQ5xhu1S9UbrJNixEhQMAucOf6tZsZhoDzS
 4nD6LPp12f3FBTm4iyVfzEhMl5VSqBIrafbY2jAuav/coY7SrUXAW98erffTIwoeVL9v
 BEs6HoTM0R1Bfm8PtSIqTjuDN0cZpqG/zpCP4FrW5NPtQcuHpI1r196ygaX4dLo/TjAx
 qsLQqTSM+M3QXX8kR8OB2vKuA+bznVdzB9oF09l6x4Fw2iP4bGdLt2wkMwJZdO5vEyCO
 YujQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE6J6dk1rcJdcgdMMSYJgOCh9WNRLVOCzlrLECs+UGJQt7L1CueaQc/YHdvcDIs3C/gMM4JHo3+1tfB+qE8z9Yf0WnstEvgDSzFhWvqsjo
X-Gm-Message-State: AOJu0YwhFh5d9XdOaIb8u3mlCmVja+ROThHtPSkgcD//MrGM+NRv92Nu
 QfDYvuiDL8FGMDS8kqBOxE8m18Ft/0IWHT+HLfYBOFS39TD6ptOWqeHZDtdpapg=
X-Google-Smtp-Source: AGHT+IFXAtUviYLODojZB8y1DGATalo/JeZWCLCv1nVOL1U9loFS9KRzrRPuGc6MkUfK7tlXBtUy6g==
X-Received: by 2002:a05:651c:1543:b0:2d4:6c52:23d5 with SMTP id
 y3-20020a05651c154300b002d46c5223d5mr620714ljp.50.1712880634395; 
 Thu, 11 Apr 2024 17:10:34 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 f15-20020a2e6a0f000000b002d868f2939bsm331735ljc.103.2024.04.11.17.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 17:10:34 -0700 (PDT)
Message-ID: <7634a8ba-e783-46ce-be91-779cd603bd3b@linaro.org>
Date: Fri, 12 Apr 2024 02:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: Move some socinfo defines to the header,
 expand them
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
 <20240410132510649-0700.eberman@hu-eberman-lv.qualcomm.com>
 <2c2bca6c-b429-4cef-b63a-ee3bd6c9eecb@linaro.org>
 <20240411130802689-0700.eberman@hu-eberman-lv.qualcomm.com>
 <bbec514f-9672-4e5a-bd83-20ab59b3dcd9@linaro.org>
 <20240411162849104-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240411162849104-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 4/12/24 01:49, Elliot Berman wrote:
> On Thu, Apr 11, 2024 at 10:24:08PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/11/24 22:09, Elliot Berman wrote:
>>> On Thu, Apr 11, 2024 at 10:05:30PM +0200, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 4/11/24 20:55, Elliot Berman wrote:
>>>>> On Fri, Apr 05, 2024 at 10:41:29AM +0200, Konrad Dybcio wrote:
>>>>>> In preparation for parsing the chip "feature code" (FC) and "product
>>>>>> code" (PC) (essentially the parameters that let us conclusively
>>>>>> characterize the sillicon we're running on, including various speed
>>>>>> bins), move the socinfo version defines to the public header and
>>>>>> include some more FC/PC defines.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>> ---
>>
>> [...]
>>
>>>
>>> 0xf is the last one.
>>
>> One more question, are the "internal/external feature codes" referring to
>> internality/externality of the chips (i.e. "are they QC-lab-only engineering
>> samples), or what else does that represent?
> 
> Yes, QC-lab-only engineering samples is the right interpretation of
> these feature codes.

Do you think it would be beneficial to keep the logic for these ESes in
the upstream GPU driver? Otherwise, I can yank out half of the added lines.

Konrad
