Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BB589DE44
	for <lists+freedreno@lfdr.de>; Tue,  9 Apr 2024 17:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7145210F70D;
	Tue,  9 Apr 2024 15:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ckdnBBO/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972F10F759
 for <freedreno@lists.freedesktop.org>; Tue,  9 Apr 2024 15:13:07 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-516f2e0edb7so3109062e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Apr 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712675586; x=1713280386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MDKIxls1YcB1qEzw3C9K5gDjPIzcv/YgHt6CoWlWLcc=;
 b=ckdnBBO/wMvtop+CkXF9yG+3S9VicjqokweqYIrnO1J7wj78blgva3m2MsBvkmTCKi
 h8LQYjzinNEVRNqTSgf6LaDrbCL47lqU85tJYgouOSo75NwaF65dKgB2Oeyy9UyuICPX
 7KAo9bIAh+v2YCquZFUi3Qe+43NxC6CQ/ExcmiXJrXCOovXZuer8ogTC/XX+ELw2LF84
 TeSILAvJEpokgrUPRC8g/32hYpNsmgMfORmegsxQNvVSOnaea0qV/0O+r+RKIUiNMkf2
 E9FXsGQIy4MC63WaP6+FOu+4w1r9K7KJKE3n0GWKQRzdjL4krjt8EZ319i5eqKJV6S1+
 cAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712675586; x=1713280386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDKIxls1YcB1qEzw3C9K5gDjPIzcv/YgHt6CoWlWLcc=;
 b=hZPl6qxIB5B4T5BZAZpPgHOY8xIqdHHftxFuX54EovOcXhp4HBJ+7uZjPp1MgG8U9E
 cVKFp5axeKRvLjv23MmkktSD92kMeg7epERW+mI2vmSOQFQhDrtdc5b7dkftgWvieZUj
 M1Rw/8bMT9+7onrUbqUWcVc4qqIseXWN0MEYefKs5H63k+j2tHpxQPgKuZ0MQD3GnkEG
 8rdzIieeGUI+8DnRt8R/5DX8UgI0lKZc7bvPRV+YxmFBrPTXaMNMMJ4FiIryOCZ1MBfi
 7d8W7x3oUaXhjWZJQ5o4YI8I+8M0w7g2qdkUT0RtFbAHfCQtNbzENYlDxvKBWxHsjTpd
 nRgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSaERNbQMhPuoTOUMq0Xua7E0U/pECjuFB3tr9aa3+JEzCjYxozSyOe9qTtVvACqg3yWTVE1PDGwL2IQ9F3b0lO0QypxVss5FZOziF7ZnV
X-Gm-Message-State: AOJu0YxlBhMl24vaW+RAeP4kDP63O8MpHeULfbnJkR7rfqdcPgm2IdwA
 n6o7JyHk7S8fdkO4ELmQ9ax8XWCdgfUbcSkHXQwFaN/tRl2yd0OWM8XKMbZhrYE=
X-Google-Smtp-Source: AGHT+IGhk42UgX0piJ3IhGVv53mL8Xv3MlZAlkmhqiALnY/XM/pfqByw6e+NvkM8SZnf8BoJDnWAbw==
X-Received: by 2002:a19:8c5d:0:b0:515:93ef:98ae with SMTP id
 i29-20020a198c5d000000b0051593ef98aemr8314023lfj.54.1712675585961; 
 Tue, 09 Apr 2024 08:13:05 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 f9-20020a193809000000b00516aff23fc1sm1610227lfa.138.2024.04.09.08.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:12:59 -0700 (PDT)
Message-ID: <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
Date: Tue, 9 Apr 2024 17:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
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



On 4/6/24 04:56, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
>> the highest. Falling back to it when things go wrong is largely
>> suboptimal, as more often than not, the top frequencies are not
>> supposed to work on other bins.
> 
> Isn't it better to just return an error here instead of trying to guess
> which speedbin to use?

Not sure. I'd rather better compatibility for e.g. booting up a new
laptop with just dt.

> 
> If that's not the case, I think the commit should be expanded with
> actually setting default_speedbin for the existing GPUs.

I think that should be addressed, although separately.

Konrad
