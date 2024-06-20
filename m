Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF09115D0
	for <lists+freedreno@lfdr.de>; Fri, 21 Jun 2024 00:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287610E15B;
	Thu, 20 Jun 2024 22:47:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rhbTv1uh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601EC10E15B
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 22:47:46 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a6efae34c83so151347466b.0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718923664; x=1719528464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4I073d0BTX95Go5STXxxrqm3YTQm7wdPzYcykgxi0es=;
 b=rhbTv1uhI+rH32ezMoqanc1QzG/I0CIkOYcUDJFFGMrbLQdz/sDdCLbVZqEDfXrsVx
 r/oXAX3YoaPOo5W540B4q/t05uzQhSfzvbS+ZadVT4u10NY8w4zrzZC5UB7kS/xRveSm
 762pEu/GH0nUGn0icKT9ipfU5JvaQjTGRJlINwtaiAJczcJa34VjR1sUE5gBqHGmDxcn
 Qj0d2Dkg0P/ugORYTKfrJvk9VZcH3vRQxm32fcottgdW5iwiM0gsZVjxrG+okJvOJvdd
 d/K7Su5lG297rG7ZHAhv7dGF5I4T+OjhJCvIPQfGZinAJzE1A00ywv4NMDl/XBIty/6u
 WX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718923664; x=1719528464;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4I073d0BTX95Go5STXxxrqm3YTQm7wdPzYcykgxi0es=;
 b=MpTtKs/okojIEqLpVLr5p5a1z58ZDs4Qj3DjNLaT3kscfe1kQkyphIWDjj5V6f41MN
 uFX0poDF00SQdBXb1w3kZ+M9NZ0maoZJBWJceH54FEcg0Dx0RZVuKOA9GnREUwkEcKBT
 2S5ecbiIU1cxDT712PNPuS39xo0NN5nypE132Oj+dFcKp6ooZ4nDux1wcNDn7hMYbdd2
 2Pb1kC7f5s7SojGakc7hr7dcLklHfUAoTHRIw6s2TvpYRzavEgmto19xOZjEx0OlzP26
 5gWKKUGuSGYwb+b3Ejm3c8p3SwfI4KkZykSHJKj9U9EJA4QM/fqSD/4Onb+uzmUkz1XT
 px0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX97pMtQL5nQenakxnsAk6erxcJc9hbpUTaOu9zX2q6EMn0ku2oczbCVRgXpxSSUwa5TQ89EAWQodbs8gkxOwR7DnDI/cWncu3t4dmlB8m9
X-Gm-Message-State: AOJu0YwDFIN+i6g61U5ZMUEZgG/Xg/oIFSsNj/pVoGpTNjYe8gB9KYJX
 HDMzuRstsvpoVvfL8mXRXNwlml2g7oCpQP/ivnE9yLl2o/vh7ZzxygpizpzZHQE=
X-Google-Smtp-Source: AGHT+IHmD+Gya/nhlhxOrWtEB0hFxetdUkl4tZxvwdn9QG78XjNenK5hvKKgWCxgXbZXFjeg6GZ8WQ==
X-Received: by 2002:a17:907:cb81:b0:a6f:af8e:b76d with SMTP id
 a640c23a62f3a-a6faf8ec937mr336001266b.49.1718923664033; 
 Thu, 20 Jun 2024 15:47:44 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9090:3594:c427:be6a:c9:3e84?
 ([2a00:f41:9090:3594:c427:be6a:c9:3e84])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b38esm17300266b.79.2024.06.20.15.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 15:47:43 -0700 (PDT)
Message-ID: <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
Date: Fri, 21 Jun 2024 00:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 6/20/24 20:24, Dmitry Baryshkov wrote:
> On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Thu, May 30, 2024 at 2:48 AM Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>>
>>> On 16/05/2024 10:43, Marijn Suijten wrote:
>>>
>>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
>>>>
>>>>> When create_address_space() fails (e.g. when smmu node is disabled)
>>
>> Note that smmu support is going to become a hard dependency with the
>> drm_gpuvm/VM_BIND conversion.. which I think means we should never get
>> far enough to hit this error path..
> 
> Does that mean that we will lose GPU support on  MSM8974?

Yeah, that was brought up on #freedreno some time ago

Konrad
