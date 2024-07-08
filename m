Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C4B92A0B1
	for <lists+freedreno@lfdr.de>; Mon,  8 Jul 2024 13:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AAA10E12D;
	Mon,  8 Jul 2024 11:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="vSAcs/6Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2910E0FE
 for <freedreno@lists.freedesktop.org>; Mon,  8 Jul 2024 11:07:12 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-367a183df54so2255945f8f.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Jul 2024 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1720436831; x=1721041631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dcsI0Fp4d0lizbnZrWTDYuNRxhLlQN9hrnJVHrPEMm0=;
 b=vSAcs/6ZvAmFlbwxIE13UuXqBt1DPYCAbgde/TOlnzw+pJYe0v8fcRlnyFUkiNMSOX
 2Rx+HpnMPwT5SLITCQKBYhqb+U5UjL7k3ODD9yjGsctzu5igbX1ZijxxJwSjH1UyvlwV
 I9tQ4XqJkNQVjBVGxiQXb84I+wy0nJAzuxDHuWrsXzn4JxHE2njB7Ysw2MoqqHc7JgqA
 VMdouDqTLD/SHGYiE65C2+d7FyV+zqB0pFRieu1sYPwK1deAp0NkRqkGTcyeqq6y457k
 yBcts4A0GKDZUKPDJ4hdQ3sVp0UoHNY6oFtQAwIYFsV3it9RK69Bf/WDtVer1b5Fe5Oo
 OGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720436831; x=1721041631;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dcsI0Fp4d0lizbnZrWTDYuNRxhLlQN9hrnJVHrPEMm0=;
 b=BlX1MySvCGgETkiYPpvrK0XSwsBSOdUwXPSbzjHYMuHw2JpvYNtMLw+yjvx40ixqQ2
 kV8MTaQ4CtCA4oCTvQprKvrMjGUVifXmqIqMdYphPGg7rA7XoM5ZA/LacpNd2NPAXQSM
 W+2f039SiDQPhsLY31a16LMXe9TGGicsqVZm4cpHs3GYNVJ2qaNgcid9sZonf4OMscdM
 373NAh1IK69anLLxQgYm2moPdM4SkatEceXv1OzlIpuCwTAwb1P1hLQbrtDWRwdU91gc
 UM0Vs0HpMuRxV/uWT+obDY/VCo9092he0DX4ZlijTgESHit0uB99bwaKvEXsGfMM+MJU
 FMyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvKtjsWN8JYWV/e+WGkL8a7ZGq+PZ4HfSxX5tiBock36eIjJ46XA4IO73PLEu2uor2nIqGl8I/oWRN+ZT8FULm36E1oHE5f8umrMnDc8dv
X-Gm-Message-State: AOJu0YxB11sKojDCs0nJ0ikZl+/8DC22BOec7C20uIcdnB8I6ufxZkTQ
 yYoTlGk6VMX1p5xkH0veJU9evaExilv1+cs0OEdL8phzlqaPbf9q6vsOnKKsjes=
X-Google-Smtp-Source: AGHT+IEKYdET8KfBw3aNCJckmIjDHRgLhPCL/RlwhYnD8BvFqsYWoobXZB0e3p/fZkpFRo2ReXBUAg==
X-Received: by 2002:adf:f548:0:b0:366:ec2c:8648 with SMTP id
 ffacd0b85a97d-3679dd66b0emr7705422f8f.43.1720436830645; 
 Mon, 08 Jul 2024 04:07:10 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3679ac6d60dsm10918074f8f.39.2024.07.08.04.07.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 04:07:10 -0700 (PDT)
Message-ID: <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr>
Date: Mon, 8 Jul 2024 13:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
Content-Type: text/plain; charset=UTF-8
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

On 05/07/2024 16:34, Dmitry Baryshkov wrote:

> On Thu, Jul 04, 2024 at 06:45:36PM GMT, Marc Gonzalez wrote:
>
>> From: Arnaud Vrac <avrac@freebox.fr>
>>
>> Ported from the downstream driver.
> 
> Please write some sensible commit message.

Here's an attempt at expanding the commit message:

"""
This code adds support for the HDMI PHY block in the MSM8998.
It is a copy & paste of the vendor driver downstream:
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/clk/msm/mdss/mdss-hdmi-pll-8998.c
"""


>>  drivers/gpu/drm/msm/Makefile                   |   1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi.c                |   1 +
>>  drivers/gpu/drm/msm/hdmi/hdmi.h                |   8 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c            |   5 +
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c       | 789 +++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/registers/display/hdmi.xml |  89 +++
>>  6 files changed, 893 insertions(+)
> 
> - Missing changelog

- Rebase onto v6.10
- Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
- Add copyright attribution
- Remove all dead/debug/temporary code

> - Missing a pointer to bindings. Ideally bindings should come together with the driver.

"qcom,hdmi-phy-8998" is defined in "HDMI TX support in msm8998" series (Acked by Rob Herring & Vinod Koul)

> I'm not going to check the math, but it looks pretty close to what we
> have for msm8996.

What is the consequence of this?


>> +static const char * const hdmi_phy_8998_reg_names[] = {
>> +	"vdda-pll",
>> +	"vdda-phy",
> 
> Unless you have a strong reason to, please use vcca and vddio here, so
> that we don't have unnecessary conditionals in schema.

The vendor code uses vddio & vcca for msm8996;
vdda-pll & vdda-phy for msm8998.

Which is vcca? Which is vddio?

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8996-mdss-pll.dtsi
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-mdss-pll.dtsi#L121-172

Regards

