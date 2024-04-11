Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170418A2015
	for <lists+freedreno@lfdr.de>; Thu, 11 Apr 2024 22:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608B410F1DD;
	Thu, 11 Apr 2024 20:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i1XwMY+p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0587510F331
 for <freedreno@lists.freedesktop.org>; Thu, 11 Apr 2024 20:24:12 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d485886545so2670381fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 11 Apr 2024 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712867051; x=1713471851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OkivZAy8vHp+8K7Um26GAxu/l7QEtqH2ogeAPyc9feU=;
 b=i1XwMY+pSvlkA+OM9tRNniVgjFMWXAWrt3HuQ15g5gHyU47jZWQTzAMLP7zaRvDTcn
 58DuV2EGIIL/WeLp6yXWF5m36hhXgJJlrtAD3IXD96fo7buzy9ArG1BSo208mgX7xVPL
 ZQDf1R/2D80QPUi+Cdrzof5xiBrgxk69K4jf2CHzFDQsDaxKdf2KTYOh4XNP9+OOxySI
 dSOdE+J0VlJgn9R/uemtrSZf8Pre294VNham5yDZyoq8Mc/kQn6LdSOezgwhxivcpm7D
 QOlyo8eJkhhnRyiIzBlOYl1wS7cBANfLuef7gVf2YxgAEAAa8rxJUqUOdeZQW0Oe/SkX
 +OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712867051; x=1713471851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkivZAy8vHp+8K7Um26GAxu/l7QEtqH2ogeAPyc9feU=;
 b=NZ9qlVogFCmrtAU9tOaxaE7MchneXgCcNyPyBOLDPjiCd74ythB7Vp7TdFR+M5gVWF
 JoQFCq7cAPw32yg6DJXs/MEnrzd681UF9r+FWFOOxzINSg7TnrsaArveXhfQK9aEzIWu
 uP+MphTp+rT0WWciOS91bhmXIvLFSBJ9ozuXbfHXWsBdX7fPEfWFLLVmaXQd4vSz48ic
 ToQbJukliMbgWG8M1khi0vr54V55m8M9aAApsb/bC9eqOxGnjrtnXK3ZieocQR8KIE1Y
 vCUGzCF0Lb4A5JKMhSeX4frWXEdH6zPxEoCXwprgImTOzdfGWLhNmZcFEAjquafk1t5c
 nxfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYGmCWIio76cm17KxXofBRhXknENFxK3rgwjodlW00CfznX/WU7Nuu5l85QYLukebl4Hqx8SiyoMqyWy9AbbeLJvLrxZkCYOxfF7TKuPZ5
X-Gm-Message-State: AOJu0Yy/LmZy7QPSrxWOCVipxNTqiOwEJFb6TYMi0eRX7P6+PtMejybR
 L3YKtOedIPf1PGq/X8RdwgGxF93QCpZGPp5gJFBclLnMvu7f5TXGN6g+/CwvM0Q=
X-Google-Smtp-Source: AGHT+IFmKV1cZUNf2RDPXfgrp5jM/80Z18N3yhtpLtRxKHZ1VDKWNvDrx521CSjJRJIGHFCmxXfoWA==
X-Received: by 2002:a2e:7d15:0:b0:2d4:49d1:38e with SMTP id
 y21-20020a2e7d15000000b002d449d1038emr508466ljc.28.1712867050958; 
 Thu, 11 Apr 2024 13:24:10 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 f24-20020a2e6a18000000b002d4295d8563sm291115ljc.62.2024.04.11.13.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:24:10 -0700 (PDT)
Message-ID: <bbec514f-9672-4e5a-bd83-20ab59b3dcd9@linaro.org>
Date: Thu, 11 Apr 2024 22:24:08 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240411130802689-0700.eberman@hu-eberman-lv.qualcomm.com>
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



On 4/11/24 22:09, Elliot Berman wrote:
> On Thu, Apr 11, 2024 at 10:05:30PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/11/24 20:55, Elliot Berman wrote:
>>> On Fri, Apr 05, 2024 at 10:41:29AM +0200, Konrad Dybcio wrote:
>>>> In preparation for parsing the chip "feature code" (FC) and "product
>>>> code" (PC) (essentially the parameters that let us conclusively
>>>> characterize the sillicon we're running on, including various speed
>>>> bins), move the socinfo version defines to the public header and
>>>> include some more FC/PC defines.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---

[...]

> 
> 0xf is the last one.

One more question, are the "internal/external feature codes" referring to
internality/externality of the chips (i.e. "are they QC-lab-only engineering
samples), or what else does that represent?

Konrad
