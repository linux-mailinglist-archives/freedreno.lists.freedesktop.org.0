Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B090C8A0
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 13:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4110E63B;
	Tue, 18 Jun 2024 11:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VAsbEmSX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228D210E211
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 11:11:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2eadaac1d28so56024731fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709113; x=1719313913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tCJ1koSXaUSbG2q6a2DQFAstliIPSMU/Xsi5Jpzojx4=;
 b=VAsbEmSXBYRgf4VxBY8pegUgsLEkQrhQlA8QS++/3MT79zorlhkWjjQ2JQ/TsW2DXH
 pgX2i4KQBnoefbpZ9buG4UmaW0B/H5HefUnzRfFxDnn8XaYjDAIKmb3H+jYVRPUO3Vhy
 rLsaZXMwAqDd4fXIACDWJZbc8WO2A2Ctv4NsYzDyZYfVhE+6fAtGpZuokku79Pzm0z53
 xNn1+34nydxCKD80RWtWjHgDaejq+uny/XDCvJ/YAKJDlm2kGWmJFa62zBEnVL818NDa
 7s20wZ1d5Eu8xkkplXmcaq8TL4b3H+qIQ0kyp3PUphcKWRJnX5ApDsxuOTTpwv6mD5Sk
 zg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709113; x=1719313913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCJ1koSXaUSbG2q6a2DQFAstliIPSMU/Xsi5Jpzojx4=;
 b=YSLxyIXEFl9DmK4b9D/E9gQynnzjRGaFGpVN8XuQF0+fXNx7ZwTFYiMI4bWmtwnmnn
 aMxSwB4cAEBck9j4RYUZRednt05oMtaM5XL6nl6ABOMvEgf0Rk81BFfJoGPePVX2ZCZU
 zghASqxDQ841UPKFiY1KQReuglIToMUt33Z3Upm//4XZATlTB/890UaadjoT8q0J5elj
 pVQqIzEXajpj+vHPohL5LBwITFMNQLyqqGmJ66qLEoE+YcRrx/T4wf2jxsdqn5whOq6G
 qc5gfayNVY8L7OWF5kPqr58bSOCwuahnFehxvkirTmiznRekR4oNWQAW1cTAb3mxRRhU
 ZYSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXNteKD9L+LWsWQf5kZLqtYPXeiWV39JXPPnT7KEaH3Z8wJkK8orOamFT1OHGdqpZ89+Cwb1Bv1gdwB4rpzjWM6W0RXQuUFdOp1IhrocHF
X-Gm-Message-State: AOJu0YxBlpFI9xUVuuN244EhITQqWpdimLkdb/hvH+N1VWM2Aihi8ErT
 nM5aV0KjQydfLtigWSE/6DJSmRr1Glt0lxZ9NK3JmUrbCAZ0RY+8Bz3wktko4bQ=
X-Google-Smtp-Source: AGHT+IG4NDeCUql9vT+yjYQb6VBnlvabxwjfMz1iCQArGCJOw0YSMVEKgJePGYR0dmojAmuJWyu8kQ==
X-Received: by 2002:ac2:490e:0:b0:52c:9413:d02f with SMTP id
 2adb3069b0e04-52ca6e659e9mr8585345e87.17.1718709113180; 
 Tue, 18 Jun 2024 04:11:53 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282f2ddsm1467138e87.87.2024.06.18.04.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:11:52 -0700 (PDT)
Message-ID: <948d34a9-ff11-4ec0-ab6f-05e87533caa8@linaro.org>
Date: Tue, 18 Jun 2024 13:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-4-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-4-robdclark@gmail.com>
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



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the hwcg tables into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
